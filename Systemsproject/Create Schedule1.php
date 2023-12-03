<?php
@include 'config1.php'; // Include your database configuration file

session_start();

// Check for user's session UID
if (!isset($_SESSION['UID'])) {
    echo "Please log in to assign courses.";
    exit;
}

$uid = $_SESSION['UID'];

// Fetch available courses with additional details, including prerequisites, ordered by CRN
$query = "SELECT
    coursesection.CRN,
    coursesection.CourseID,
    coursesection.AvailableSeats,
    timeslot.TimeSlotID,
    day.Weekday,
    course.CourseName,
    room.RoomNum,
    building.BuildingName,
    periodd.StartTime,
    periodd.EndTime,
    coursesection.SectionNum,
    coursesection.SemesterID,
    courseprerequisite.PRcourseID,
    courseprerequisite.MinGrade,
    course.Credits  -- Include the Credits column from the course table
FROM coursesection
JOIN timeslot ON coursesection.TimeSlotID = timeslot.TimeSlotID
JOIN day ON timeslot.DayID = day.DayID
JOIN periodd ON timeslot.PeriodID = periodd.PeriodID
JOIN room ON coursesection.RoomID = room.RoomID
JOIN building ON room.BuildingID = building.BuildingID
LEFT JOIN courseprerequisite ON coursesection.CourseID = courseprerequisite.CourseID
JOIN course ON coursesection.CourseID = course.CourseID  -- Join the course table to get Credits
ORDER BY coursesection.CRN ASC";


$result = mysqli_query($conn, $query);

$courses = [];
while ($row = mysqli_fetch_assoc($result)) {
    $courses[] = $row;
}

// Fetch TimeSlotIDs of courses the student is currently enrolled in
$currentEnrollmentsQuery = "SELECT TimeSlotID FROM coursesection JOIN studenthistory ON coursesection.CRN = studenthistory.CRN WHERE studenthistory.StudentID = '$uid'";
$currentEnrollmentsResult = mysqli_query($conn, $currentEnrollmentsQuery);
$currentEnrollmentTimeSlots = [];
while ($enrollmentRow = mysqli_fetch_assoc($currentEnrollmentsResult)) {
    $currentEnrollmentTimeSlots[] = $enrollmentRow['TimeSlotID'];
}

// Handle course assignment
if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['courses']) && is_array($_POST['courses'])) {
    $selectedTimeSlots = [];
    $timeSlotConflict = false;

    foreach ($_POST['courses'] as $selectedCRN) {
        $selectedCRN = mysqli_real_escape_string($conn, $selectedCRN);
    
        // Retrieve course details for the selected course
        $courseDetailsQuery = "SELECT TimeSlotID FROM coursesection WHERE CRN = '$selectedCRN'";
        $courseDetailsResult = mysqli_query($conn, $courseDetailsQuery);
        
        if ($courseDetailsRow = mysqli_fetch_assoc($courseDetailsResult)) {
            // Check if the course has already been dropped in the same semester
            $checkDropQuery = "SELECT * FROM studenthistory WHERE StudentID = '$uid' AND CRN = '$selectedCRN' AND SemesterID = (SELECT SemesterID FROM coursesection WHERE CRN = '$selectedCRN') AND Grade = 'Dropped'";
            $checkDropResult = mysqli_query($conn, $checkDropQuery);
    
            if (mysqli_num_rows($checkDropResult) > 0) {
                echo "Course with CRN $selectedCRN has already been dropped in this semester.";
                exit;
            }
    
            // Retrieve prerequisite information for the selected course
            $prerequisiteQuery = "SELECT PRcourseID, MinGrade FROM courseprerequisite WHERE CourseID = (SELECT CourseID FROM coursesection WHERE CRN = '$selectedCRN')";
            $prerequisiteResult = mysqli_query($conn, $prerequisiteQuery);
    
            if ($prerequisiteRow = mysqli_fetch_assoc($prerequisiteResult)) {
                $prerequisiteCourseID = $prerequisiteRow['PRcourseID'];
                $minGrade = $prerequisiteRow['MinGrade'];
    
                // Check if the student has met the prerequisite requirement
                $hasPrerequisite = false;
    
                // Query to check if the student has the required grade in the prerequisite course
                $prerequisiteCheckQuery = "SELECT * FROM studenthistory WHERE StudentID = '$uid' AND CourseID = '$prerequisiteCourseID' AND Grade IN ('A', 'B', 'C')";
                $prerequisiteCheckResult = mysqli_query($conn, $prerequisiteCheckQuery);
    
                if (mysqli_num_rows($prerequisiteCheckResult) > 0) {
                    $hasPrerequisite = true;
                }
    
                if (!$hasPrerequisite) {
                    echo "<div id='prerequisiteError'>Enrollment failed: You must obtain a $minGrade or better in the prerequisite course (CourseID: $prerequisiteCourseID) to register for this class.</div>";
                    echo "<script>setTimeout(function() { window.location.href = 'Create Schedule1.php'; }, 3000);</script>";
                    exit;
                }
            }
    
            if (in_array($courseDetailsRow['TimeSlotID'], $selectedTimeSlots)) {
                $timeSlotConflict = true;
                echo "Enrollment failed: Time slot conflict detected.";
                break;
            }
            $selectedTimeSlots[] = $courseDetailsRow['TimeSlotID'];
        }
    }
    
    
    // Check for conflicts with current enrollments
    foreach ($selectedTimeSlots as $selectedTimeSlot) {
        if (in_array($selectedTimeSlot, $currentEnrollmentTimeSlots)) {
            echo "Enrollment failed: Conflict with previous or currently enrolled course.";
            echo "<script>setTimeout(function() { window.location.href = 'Create Schedule1.php'; }, 3000);</script>";
            exit;
        }
    }

    if (!$timeSlotConflict) {
        mysqli_begin_transaction($conn);

        try {
            foreach ($_POST['courses'] as $selectedCRN) {
                $selectedCRN = mysqli_real_escape_string($conn, $selectedCRN);
                $courseDetailsQuery = "SELECT CourseID, AvailableSeats, SemesterID FROM coursesection WHERE CRN = '$selectedCRN'";
                $courseDetailsResult = mysqli_query($conn, $courseDetailsQuery);
                if ($courseDetailsRow = mysqli_fetch_assoc($courseDetailsResult)) {
                    if ($courseDetailsRow['AvailableSeats'] > 0) {
                        // Enrollment logic for studenthistory table
                        $insertHistoryQuery = "INSERT INTO studenthistory (StudentID, CRN, CourseID, SemesterID, Grade) VALUES (?, ?, ?, ?, ?)";
                        $grade = 'In Progress'; // Set the initial grade
                        $stmt = mysqli_prepare($conn, $insertHistoryQuery);
                        mysqli_stmt_bind_param($stmt, "sssss", $uid, $selectedCRN, $courseDetailsRow['CourseID'], $courseDetailsRow['SemesterID'], $grade);
                        mysqli_stmt_execute($stmt);

                        // Enrollment logic for enrollment table
                        $currentDateTime = date("Y-m-d H:i:s"); // Get the current date and time
                        $insertEnrollmentQuery = "INSERT INTO enrollment (StudentID, CRN, Grade, DOE) VALUES (?, ?, ?, ?)";
                        $stmt = mysqli_prepare($conn, $insertEnrollmentQuery);
                        mysqli_stmt_bind_param($stmt, "ssss", $uid, $selectedCRN, $grade, $currentDateTime);
                        mysqli_stmt_execute($stmt);

                        // Update the available seats
                        $updateSeatsQuery = "UPDATE coursesection SET AvailableSeats = AvailableSeats - 1 WHERE CRN = ?";
                        $stmt = mysqli_prepare($conn, $updateSeatsQuery);
                        mysqli_stmt_bind_param($stmt, "s", $selectedCRN);
                        mysqli_stmt_execute($stmt);
                    } else {
                        echo "Enrollment failed: No available seats in course CRN $selectedCRN.";
                        mysqli_rollback($conn);
                        exit;
                    }
                }
            }
            mysqli_commit($conn);
            echo "You have been successfully enrolled in the selected courses.";
        } catch (Exception $e) {
            mysqli_rollback($conn);
            echo "An error occurred: " . $e->getMessage();
        }
    }
}

if (isset($_GET['drop_course'])) {
    $dropCRN = mysqli_real_escape_string($conn, $_GET['drop_course']);

    // Check if the user is enrolled in the course
    // Check if the user is enrolled in the course and get the SemesterID from the enrollment table
$checkEnrollmentQuery = "SELECT enrollment.StudentID, studenthistory.SemesterID
FROM enrollment
JOIN studenthistory ON enrollment.StudentID = studenthistory.StudentID AND enrollment.CRN = studenthistory.CRN
WHERE enrollment.StudentID = '$uid' AND enrollment.CRN = '$dropCRN'";

    $checkEnrollmentResult = mysqli_query($conn, $checkEnrollmentQuery);

    if (mysqli_num_rows($checkEnrollmentResult) > 0) {
        $enrollmentRow = mysqli_fetch_assoc($checkEnrollmentResult);
        $semesterID = $enrollmentRow['SemesterID'];

        // Check if the course has already been dropped in the same semester
        $checkDropQuery = "SELECT * FROM studenthistory WHERE StudentID = '$uid' AND CRN = '$dropCRN' AND SemesterID = '$semesterID' AND Grade = 'Dropped'";
        $checkDropResult = mysqli_query($conn, $checkDropQuery);

        if (mysqli_num_rows($checkDropResult) > 0) {
            echo "Course with CRN $dropCRN has already been dropped in this semester.";
        } else {
            // Update the grade to "Dropped" in studenthistory
            $updateHistoryQuery = "UPDATE studenthistory SET Grade = 'Dropped' WHERE StudentID = '$uid' AND CRN = '$dropCRN' AND SemesterID = '$semesterID'";
            mysqli_query($conn, $updateHistoryQuery);

            // Increase the available seats in coursesection
            $updateSeatsQuery = "UPDATE coursesection SET AvailableSeats = AvailableSeats + 1 WHERE CRN = '$dropCRN'";
            mysqli_query($conn, $updateSeatsQuery);

            // Remove the course from enrollment
            $deleteEnrollmentQuery = "DELETE FROM enrollment WHERE StudentID = '$uid' AND CRN = '$dropCRN'";
            mysqli_query($conn, $deleteEnrollmentQuery);

            echo "Course with CRN $dropCRN has been dropped successfully.";
        }
    } else {
        echo "Course with CRN $dropCRN is not currently enrolled.";
    }
}
?>




<!DOCTYPE html>
<html lang="en">
<head>
   <meta charset="UTF-8">
   <meta http-equiv="X-UA-Compatible" content="IE-edge">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <div class="header">
      <h1>Academic Profile</h1>
      <a href="student_academic_profile1.php" class="back-button">Back to Academic Profile</a>
   </div>


   <link rel="stylesheet" href="css/fatman1.css">

<style>
   .header {
      background: #000;
      color: #fff;
      padding: 20px;
      text-align: center;
      display: flex;
      justify-content: space-between;
   }

   .buttons a {
         margin-left: 20px;
         background: #000;
         color: #fff;
         padding: 10px 30px;
         text-decoration: none;
         border-radius: 5px;
      }

      .button-container .btn:hover {
         background: #333;
      }

   .header h1 {
      font-size: 36px;
   }

   .header a {
      text-decoration: none;
      color: #fff;
      margin-right: 20px; /* Add some spacing between buttons */
      font-size: 18px;
      transition: background-color 0.3s ease; /* Add a smooth background color transition */
   }

   .header a:hover {
      background-color: #333; /* Change the background color on hover */
   }

   table {
      width: 100%; /* Full width */
      max-width: 100%; /* Ensures table is not wider than its container */
      border-collapse: collapse;
      table-layout: auto; /* New line: Ensures the table respects the width */
   }

   th, td {
      border: 1px solid #000;
      padding: 15px;
      text-align: left;
      font-size: 14px;
      word-wrap: break-word; /* New line: Allows words to break and wrap */
   }

   th {
      background-color: #f2f2f2; /* Gives a slight background color to the header */
   }

   /* Style for every other row */
   tr:nth-child(even) {
      background-color: #ccffcc; /* Light green background */
   }
   .selected-courses-box {
    border: 2px solid #333;
    background-color: #f2f2f2;
    padding: 10px;
    font-size: 18px;
    margin-top: 20px;
}


.top-right-container {
    margin-top: 20px; /* Add margin-top instead of top */
    width: 50%;
    box-sizing: border-box;
    padding: 20px;
}


      /* Style the table within the top-right container */
      .enrolled-courses-table {
         width: 100%;
         border-collapse: collapse;
         margin-bottom: 20px;
      }

      .enrolled-courses-table, th, td {
         border: 1px solid #000;
      }

   </style>
   <script>
       function searchTable() {
           var input, filter, table, tr, td, i, txtValue;
           input = document.getElementById("searchInput");
           filter = input.value.toUpperCase();
           table = document.getElementById("courseTable");
           tr = table.getElementsByTagName("tr");

           for (i = 0; i < tr.length; i++) {
               td = tr[i].getElementsByTagName("td");
               var found = false;
               for (var j = 0; j < td.length; j++) {
                   if (td[j]) {
                       txtValue = td[j].textContent || td[j].innerText;
                       if (txtValue.toUpperCase().indexOf(filter) > -1) {
                           found = true;
                           break;
                       }
                   }
               }
               if (found) {
                   tr[i].style.display = "";
               } else {
                   tr[i].style.display = "none";
               }
           }
       }

       function updateSelectedCourses() {
    var selectedCourses = document.querySelectorAll('input[name="courses[]"]:checked');
    var displayBox = document.getElementById("selectedCoursesBox");
    var selectedInfo = Array.from(selectedCourses).map(function(checkbox) {
        return checkbox.value + ' - ' + checkbox.getAttribute('data-course-name');
    });

    if (selectedInfo.length > 0) {
        displayBox.textContent = "Selected Courses:";
        var ul = document.createElement('ul');
        selectedInfo.forEach(function(course) {
            var li = document.createElement('li');
            li.textContent = course;
            ul.appendChild(li);
        });
        displayBox.appendChild(ul);
    } else {
        displayBox.textContent = "Selected Courses: None";
    }
}

   </script>
</head>

<body>
<div id="selectedCoursesBox" class="selected-courses-box">Selected Courses: None</div>
    <div class="course-assignment-container">
        <h1>Assign/Drop Courses</h1>
        <!-- ... Existing search input and course assignment form ... -->
        <input type="text" id="searchInput" onkeyup="searchTable()" placeholder="Search for courses...">


        <div class="top-right-container">
      <h2>Schedule</h2>
      <table class="enrolled-courses-table">
            <thead>
               <tr>
                  <th>CRN</th>
                  <th>Course Name</th>
                  <th>Day</th>
                  <th>Building</th>
                  <th>Room</th>
                  <th>Section</th>
                  <th>Time</th>
               </tr>
            </thead>
            <tbody>
               <?php
               // Fetch and display currently enrolled courses
              $enrolledCoursesQuery = "SELECT coursesection.CRN, coursesection.CourseID, coursesection.SectionNum, timeslot.TimeSlotID, day.Weekday, course.CourseName, room.RoomNum, building.BuildingName, periodd.StartTime, periodd.EndTime 
                           FROM enrollment
                           JOIN coursesection ON enrollment.CRN = coursesection.CRN
                           JOIN timeslot ON coursesection.TimeSlotID = timeslot.TimeSlotID
                           JOIN day ON timeslot.DayID = day.DayID
                           JOIN course ON coursesection.CourseID = course.CourseID
                           JOIN periodd ON timeslot.PeriodID = periodd.PeriodID
                           JOIN room ON coursesection.RoomID = room.RoomID
                           JOIN building ON room.BuildingID = building.BuildingID
                           WHERE enrollment.StudentID = '$uid'";
$enrolledCoursesResult = mysqli_query($conn, $enrolledCoursesQuery);

               while ($enrolledCourse = mysqli_fetch_assoc($enrolledCoursesResult)) {
                  echo "<tr>";
                  echo "<td>{$enrolledCourse['CRN']}</td>";
                  echo "<td>{$enrolledCourse['CourseName']}</td>";
                  echo "<td>{$enrolledCourse['Weekday']}</td>";
                  echo "<td>{$enrolledCourse['BuildingName']}</td>";
                  echo "<td>{$enrolledCourse['RoomNum']}</td>";
                  echo "<td>{$enrolledCourse['SectionNum']}</td>";
                  echo "<td>{$enrolledCourse['StartTime']} to {$enrolledCourse['EndTime']}</td>";
                  echo "<td><a href='?drop_course={$enrolledCourse['CRN']}'>Drop</a></td>"; // Add a "Drop" link
                  echo "</tr>";
               }
               ?>
            </tbody>
         </table>
      </div>
        
        <form action="" method="post">
            <table id="courseTable">
            <thead>
    <tr>
        <th>CRN</th>
        <th>Course Name</th>
        <th>Section</th>
        <th>Day</th>
        <th>Building</th>
        <th>Room</th>
        <th>SemesterID</th>
        <th>Time</th>
        <th>Credits</th> <!-- Add a "Credits" column -->
        <th>Available Seats</th>
        <th>Select</th>
    </tr>
</thead>

                <tbody>
                <?php foreach ($courses as $course): ?>
    <tr>
        <td><?php echo $course['CRN']; ?></td>
        <td><?php echo $course['CourseName']; ?></td>
        <td><?php echo $course['SectionNum']; ?></td>
        <td><?php echo $course['Weekday']; ?></td>
        <td><?php echo $course['BuildingName']; ?></td>
        <td><?php echo $course['RoomNum']; ?></td>
        <td><?php echo $course['SemesterID']; ?></td>
        <td><?php echo $course['StartTime'] . " to " . $course['EndTime']; ?></td>
        <td><?php echo $course['Credits']; ?></td> <!-- Display the Credits column -->
        <td><?php echo $course['AvailableSeats']; ?></td>
        <td>
            <input type="checkbox" name="courses[]" value="<?php echo $course['CRN']; ?>" data-course-name="<?php echo $course['CourseName']; ?>" onchange="updateSelectedCourses()">
        </td>
    </tr>
<?php endforeach; ?>

                </tbody>
            </table>
            <input type="submit" value="Assign Course">
        </form>
    </div>







    
</body>

</html>