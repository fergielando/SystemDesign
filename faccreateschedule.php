<?php
// Start the session
session_start();

// Include your database configuration file
@include 'config1.php';

// Check if a UID is passed in the URL
if (!isset($_GET['UID'])) {
    echo "No student selected. Redirecting to previous page.";
    header("refresh:3;url=javascript:history.back()");
    exit;
}


// Use the UID from the URL parameter
$uid = mysqli_real_escape_string($conn, $_GET['UID']);

// Determine the student's course type based on their StudentID
$courseType = ($uid >= 500801) ? 'Graduate' : 'Undergraduate';

// Query to fetch student's name from the user table
$userQuery = "SELECT FirstName, LastName FROM user WHERE UID = '$uid'";
$userResult = mysqli_query($conn, $userQuery);

// Initialize variables to store the name
$firstName = '';
$lastName = '';

// Fetch the result
if ($userRow = mysqli_fetch_assoc($userResult)) {
    $firstName = $userRow['FirstName'];
    $lastName = $userRow['LastName'];
}




// Fetch available courses with additional details, including prerequisites, ordered by CRN
$query = "SELECT
    coursesection.CRN,
    MAX(coursesection.CourseID) AS CourseID,
    MAX(coursesection.AvailableSeats) AS AvailableSeats,
    MAX(timeslot.TimeSlotID) AS TimeSlotID,
    MAX(day.Weekday) AS Weekday,
    MAX(course.CourseName) AS CourseName,
    MAX(room.RoomNum) AS RoomNum,
    MAX(building.BuildingName) AS BuildingName,
    MAX(periodd.StartTime) AS StartTime,
    MAX(periodd.EndTime) AS EndTime,
    MAX(coursesection.SectionNum) AS SectionNum,
    MAX(coursesection.SemesterID) AS SemesterID,
    MAX(courseprerequisite.PRcourseID) AS PRcourseID,
    MAX(courseprerequisite.MinGrade) AS MinGrade,
    MAX(course.CourseType) AS CourseType,
    MAX(course.Credits) AS Credits,
    MAX(dept.DeptName) AS DeptName
FROM coursesection
JOIN timeslot ON coursesection.TimeSlotID = timeslot.TimeSlotID
JOIN day ON timeslot.DayID = day.DayID
JOIN periodd ON timeslot.PeriodID = periodd.PeriodID
JOIN room ON coursesection.RoomID = room.RoomID
JOIN building ON room.BuildingID = building.BuildingID
LEFT JOIN courseprerequisite ON coursesection.CourseID = courseprerequisite.CourseID
JOIN course ON coursesection.CourseID = course.CourseID
JOIN dept ON course.DeptID = dept.DeptID
WHERE course.CourseType = '$courseType'
GROUP BY coursesection.CRN
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



        // Check for student hold
$checkHoldQuery = "SELECT * FROM Hold WHERE StudentID = '$uid'";
$checkHoldResult = mysqli_query($conn, $checkHoldQuery);

if ($checkHoldResult && mysqli_num_rows($checkHoldResult) > 0) {
    // The student has a hold
    $holdInfo = mysqli_fetch_assoc($checkHoldResult);
    
    // Display a larger, red error message with a 6-second delay
    echo "<div style='font-size: 24px; color: red;'>There is a hold on this account of type: " . $holdInfo['HoldType'] . " since " . $holdInfo['DateOfHold'] . "</div>";
    
    // Redirect back to the previous page after 6 seconds
    echo "<script>setTimeout(function() { window.history.back(); }, 6000);</script>";
    exit;
}

// If the student doesn't have a hold, proceed with class assignment logic
// ...
        
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
    
                if (!$hasPrerequisite) {
                    // Retrieve the course name and CRN for the prerequisite course
                    $prerequisiteCourseInfoQuery = "SELECT course.CourseName, coursesection.CRN FROM coursesection
                    JOIN course ON coursesection.CourseID = course.CourseID
                    WHERE course.CourseID = '$prerequisiteCourseID'";
                    $prerequisiteCourseInfoResult = mysqli_query($conn, $prerequisiteCourseInfoQuery);
                    $prerequisiteCourseName = "";
                    $prerequisiteCRN = "";
                
                    if ($prerequisiteCourseInfoRow = mysqli_fetch_assoc($prerequisiteCourseInfoResult)) {
                        $prerequisiteCourseName = $prerequisiteCourseInfoRow['CourseName'];
                        $prerequisiteCRN = $prerequisiteCourseInfoRow['CRN'];
                    }
                
                    echo "<div id='prerequisiteError' style='font-size: 18px; color: red;'>Enrollment failed: You must obtain a $minGrade or better in the prerequisite course ($prerequisiteCourseName - CRN: $prerequisiteCRN) to register for this class. Please review your course selection.</div>";
                    echo "<script>setTimeout(function() { window.location.href = 'Create Schedule1.php'; }, 4500);</script>";
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

$currentSemester = "20232"; 
?>




<!DOCTYPE html>
<html lang="en">
<head>
   <meta charset="UTF-8">
   <meta http-equiv="X-UA-Compatible" content="IE-edge">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <div class="header">

   <div class="student-name">
    <label>Student:</label>
    <span><?php echo $firstName . ' ' . $lastName; ?></span>
</div>


      <h1>Academic Profile</h1>
      <a href="Update_a_user1.php" class="btn">Back</a>
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

   .student-name {
         font-size: 24px; /* Increase font size */
         font-weight: bold; /* Optional: makes the text bold */
         margin-top: 10px; /* Optional: adds some space above the name */
         /* Add other styling as needed */
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
      .search-container {
         margin: 20px 0;
         text-align: center;
      }

      .search-container input[type="text"] {
         padding: 10px;
         border: 1px solid #ccc;
         border-radius: 5px;
         font-size: 16px;
      }

      .search-container button {
         padding: 10px 20px;
         background-color: #000;
         color: #fff;
         border: none;
         border-radius: 5px;
         cursor: pointer;
         font-size: 16px;
      }

      .search-container button:hover {
         background-color: #333;
      }
      .filter-container {
         display: flex;
         justify-content: space-between;
         margin: 10px 0;
         padding: 10px;
         background-color: #f2f2f2;
      }

      .filter-container label {
         font-weight: bold;
      }

      .filter-container select {
         padding: 5px;
      }
      .button-container {
   background-color: #000; /* Black background for the container */
   padding: 10px;
   text-align: center;
}

.button-container .btn {
   background-color: transparent; /* Transparent background for buttons */
   color: #fff; /* White text */
   padding: 10px 20px;
   margin: 5px;
   border: 2px solid #fff; /* White border */
   border-radius: 5px;
   text-decoration: none; /* Remove underline from links */
   font-size: 16px;
   transition: background-color 0.3s, color 0.3s; /* Smooth transition for hover effect */
}

.button-container .btn:hover {
   background-color: #90ee90; /* Light green background on hover */
   color: #000; /* Black text on hover */
}
   </style>

   <script>

function applyFilters() {
    var departmentFilter = document.getElementById("departmentFilter").value;
    var dayFilter = document.getElementById("dayFilter").value;
    var roomFilter = document.getElementById("roomFilter").value;
    var semesterFilter = document.getElementById("semesterFilter").value;
    var courseTypeFilter = document.getElementById("courseTypeFilter").value; // Add this line

    var table = document.getElementById("courseTable");
    var rows = table.getElementsByTagName("tr");

    for (var i = 1; i < rows.length; i++) { // Start from 1 to skip the header row
        var row = rows[i];
        var departmentCell = row.cells[8].textContent; // Column index 8 for the department
        var dayCell = row.cells[3].textContent; // Column index 3 for the day
        var roomCell = row.cells[5].textContent; // Column index 5 for the room
        var semesterCell = row.cells[6].textContent; // Column index 6 for the semester
        var courseTypeCell = row.cells[10].textContent; // Column index 10 for CourseType

        // Check if the row matches the selected criteria
        var departmentMatch = departmentFilter === "" || departmentCell === departmentFilter;
        var dayMatch = dayFilter === "" || dayCell === dayFilter;
        var roomMatch = roomFilter === "" || roomCell === roomFilter;
        var semesterMatch = semesterFilter === "" || semesterCell === semesterFilter;
        var courseTypeMatch = courseTypeFilter === "" || courseTypeCell === courseTypeFilter; // Add this line

        // Hide or show the row based on the matches
        if (departmentMatch && dayMatch && roomMatch && semesterMatch && courseTypeMatch) { // Update this line
            row.style.display = "";
        } else {
            row.style.display = "none";
        }
    }
}

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

      function goBack() {
            window.history.back();
        }


      // Function to handle course selection
      function handleCourseSelection(checkbox, semesterID, prerequisiteCourseID, minGrade) {
    if (semesterID === "20232") {
        // Check if the semester is Fall 2023
        var popup = document.getElementById("popup");
        popup.style.display = "block";
        checkbox.checked = false;
        setTimeout(function() {
            popup.style.display = "none";
        }, 3000);
    } else {
        // Check prerequisites
        var hasPrerequisite = checkPrerequisite(prerequisiteCourseID, minGrade);

        if (hasPrerequisite) {
            // Course selection logic (e.g., updateSelectedCourses)
            updateSelectedCourses();
        } else {
            // Display an error message or handle prerequisites not met
            alert("Prerequisite not met. Please review your course selection.");
            checkbox.checked = false;
        }
    }
}

function checkPrerequisite(prerequisiteCourseID, minGrade) {
    // Implement logic to check if the student has met the prerequisite requirement
    // You can make an AJAX request or use existing data to check the student's history.
    // Return true if prerequisites are met, false otherwise.
    // Example:
    // var hasPrerequisite = makeAJAXRequestToCheckPrerequisite(prerequisiteCourseID, minGrade);
    // return hasPrerequisite;

    // For demonstration purposes, assume prerequisites are always met.
    return true;
}


   </script>
</head>

<body>
<div id="selectedCoursesBox" class="selected-courses-box">Selected Courses: None</div>
    <div class="course-assignment-container">
        <h1>Assign/Drop Courses</h1>
        <!-- ... Existing search input and course assignment form ... -->
        <input type="text" id="searchInput" onkeyup="searchTable()" placeholder="Search for courses...">

        <div class="filter-container">
    <label for="departmentFilter">Department:</label>
    <select id="departmentFilter">
        <option value="">All</option>
        <?php
        // Fetch and display unique department names from your database
        $departmentQuery = "SELECT DISTINCT DeptName FROM dept";
        $departmentResult = mysqli_query($conn, $departmentQuery);
        while ($department = mysqli_fetch_assoc($departmentResult)) {
            echo "<option value='{$department['DeptName']}'>{$department['DeptName']}</option>";
        }
        ?>
    </select>

    <label for="dayFilter">Day:</label>
    <select id="dayFilter">
        <option value="">All</option>
        <?php
        // Fetch and display unique weekday values from your database
        $weekdayQuery = "SELECT DISTINCT Weekday FROM day";
        $weekdayResult = mysqli_query($conn, $weekdayQuery);
        while ($weekday = mysqli_fetch_assoc($weekdayResult)) {
            echo "<option value='{$weekday['Weekday']}'>{$weekday['Weekday']}</option>";
        }
        ?>
    </select>



    <label for="courseTypeFilter">Course Type:</label>
<select id="courseTypeFilter">
    <option value="">All</option>
    <?php
    // Fetch and display unique course types from your database
    $courseTypeQuery = "SELECT DISTINCT CourseType FROM course";
    $courseTypeResult = mysqli_query($conn, $courseTypeQuery);
    while ($courseType = mysqli_fetch_assoc($courseTypeResult)) {
        echo "<option value='{$courseType['CourseType']}'>{$courseType['CourseType']}</option>";
    }
    ?>
</select>





    <label for="roomFilter">Room:</label>
    <select id="roomFilter">
        <option value="">All</option>
        <?php
        // Fetch and display unique room numbers from your database
        $roomQuery = "SELECT DISTINCT RoomNum FROM room";
        $roomResult = mysqli_query($conn, $roomQuery);
        while ($room = mysqli_fetch_assoc($roomResult)) {
            echo "<option value='{$room['RoomNum']}'>{$room['RoomNum']}</option>";
        }
        ?>
    </select>

  
    </select>

    <label for="semesterFilter">Semester:</label>
    <select id="semesterFilter">
        <option value="">All</option>
        <?php
        // Fetch and display unique semester values from your database
        $semesterQuery = "SELECT DISTINCT SemesterID FROM coursesection";
        $semesterResult = mysqli_query($conn, $semesterQuery);
        while ($semester = mysqli_fetch_assoc($semesterResult)) {
            echo "<option value='{$semester['SemesterID']}'>{$semester['SemesterID']}</option>";
        }
        ?>
    </select>

    <button onclick="applyFilters()">Apply Filters</button>
</div>

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
             // Fetch and display currently enrolled courses
             $enrolledCoursesQuery = "SELECT coursesection.CRN, coursesection.CourseID, coursesection.SectionNum, timeslot.TimeSlotID, day.Weekday, course.CourseName, room.RoomNum, building.BuildingName, periodd.StartTime, periodd.EndTime 
             FROM studenthistory
             JOIN coursesection ON studenthistory.CRN = coursesection.CRN
             JOIN timeslot ON coursesection.TimeSlotID = timeslot.TimeSlotID
             JOIN day ON timeslot.DayID = day.DayID
             JOIN course ON coursesection.CourseID = course.CourseID
             JOIN periodd ON timeslot.PeriodID = periodd.PeriodID
             JOIN room ON coursesection.RoomID = room.RoomID
             JOIN building ON room.BuildingID = building.BuildingID
             WHERE studenthistory.StudentID = '$uid'";
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
        <th>Prerequisite Course</th>
        <th>Minimum Grade</th>
        <th>Day</th>
        <th>Building</th>
        <th>Room</th>
        <th>SemesterID</th>
        <th>Time</th>
        <th>Department</th> <!-- Add a "Department" column -->
        <th>Credits</th>
        <th>Course Type</th>
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
        <td><?php echo $course['PRcourseID']; ?></td>
        <td><?php echo $course['MinGrade']; ?></td>
        <td><?php echo $course['Weekday']; ?></td>
        <td><?php echo $course['BuildingName']; ?></td>
        <td><?php echo $course['RoomNum']; ?></td>
        <td><?php echo $course['SemesterID']; ?></td>
        <td><?php echo $course['StartTime'] . " to " . $course['EndTime']; ?></td>
        <td><?php echo $course['DeptName']; ?></td> <!-- Display the DeptName column -->
        <td><?php echo $course['Credits']; ?></td>
        <td><?php echo $course['CourseType']; ?></td>
        <td><?php echo $course['AvailableSeats']; ?></td>
        <td>
        <?php
                     // Check if the course is in the Fall 2023 semester (semesterID 20232)
                     if ($course['SemesterID'] === "20232") {
                        echo '<input type="checkbox" name="courses[]" value="' . $course['CRN'] . '" data-course-name="' . $course['CourseName'] . '" disabled>';
                     } else {
                        echo '<input type="checkbox" name="courses[]" value="' . $course['CRN'] . '" data-course-name="' . $course['CourseName'] . '" onchange="handleCourseSelection(this, \'' . $course['SemesterID'] . '\')">';
                     }
                     ?>
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