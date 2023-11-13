<?php
@include 'config1.php'; // Include your database configuration file

session_start();

// Check for user's session UID
if (!isset($_SESSION['UID'])) {
    echo "Please log in to assign courses.";
    exit;
}

$uid = $_SESSION['UID'];

// Fetch available courses with additional details, ordered by CRN
$query = "SELECT coursesection.CRN, coursesection.CourseID, coursesection.AvailableSeats, timeslot.TimeSlotID, masterschedule.CourseName, masterschedule.Day, masterschedule.Bldg, periodd.StartTime, periodd.EndTime FROM coursesection JOIN timeslot ON coursesection.TimeSlotID = timeslot.TimeSlotID JOIN masterschedule ON coursesection.CourseID = masterschedule.CourseID JOIN periodd ON timeslot.PeriodID = periodd.PeriodID ORDER BY coursesection.CRN ASC";
$result = mysqli_query($conn, $query);

$courses = [];
while ($row = mysqli_fetch_assoc($result)) {
    $courses[] = $row;
}

// Handle course assignment
if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['courses']) && is_array($_POST['courses'])) {
    foreach ($_POST['courses'] as $selectedCRN) {
        // Sanitize the CRN
        $selectedCRN = mysqli_real_escape_string($conn, $selectedCRN);

        // Get the TimeSlotID and SemesterID of the selected course
        $courseDetailsQuery = "SELECT TimeSlotID, SemesterID FROM coursesection WHERE CRN = '$selectedCRN'";
        $courseDetailsResult = mysqli_query($conn, $courseDetailsQuery);
        $courseDetailsRow = mysqli_fetch_assoc($courseDetailsResult);
        $selectedTimeSlotID = $courseDetailsRow['TimeSlotID'];
        $semesterID = $courseDetailsRow['SemesterID'];

    // Check for time slot conflict
$timeSlotConflict = false; // Default to no conflict
$conflictCheckQuery = "SELECT * FROM studenthistory WHERE StudentID = '$uid' AND SemesterID = '$semesterID' AND CRN IN (SELECT CRN FROM coursesection WHERE TimeSlotID = '$selectedTimeSlotID')";
$conflictCheckResult = mysqli_query($conn, $conflictCheckQuery);
if (mysqli_num_rows($conflictCheckResult) > 0) {
    $timeSlotConflict = true; // Conflict found
}

// Check for available seats
$seatsAvailable = false; // Default to seats not available
$seatsQuery = "SELECT AvailableSeats FROM coursesection WHERE CRN = '$selectedCRN'";
$seatsResult = mysqli_query($conn, $seatsQuery);
if ($seatsRow = mysqli_fetch_assoc($seatsResult)) {
    if ($seatsRow['AvailableSeats'] > 0) {
        $seatsAvailable = true; // Seats are available
    }
}

// If no time slot conflict and seats are available, proceed with enrollment
if (!$timeSlotConflict && $seatsAvailable) {
    // Enrollment logic
    // ...
}
    if (!$timeSlotConflict && $seatsAvailable) {
        mysqli_begin_transaction($conn);

        try {
            // Insert data into studenthistory table
            $insertHistoryQuery = "INSERT INTO studenthistory (StudentID, CRN, CourseID, SemesterID, Grade) VALUES (?, ?, ?, ?, ?)";
            $grade = 'In Progress'; // Set the initial grade
            $stmt = mysqli_prepare($conn, $insertHistoryQuery);
            mysqli_stmt_bind_param($stmt, "sssss", $uid, $selectedCRN, $courseID, $semesterID, $grade);
            mysqli_stmt_execute($stmt);

            // Update the available seats
            $updateSeatsQuery = "UPDATE coursesection SET AvailableSeats = AvailableSeats - 1 WHERE CRN = ?";
            $stmt = mysqli_prepare($conn, $updateSeatsQuery);
            mysqli_stmt_bind_param($stmt, "s", $selectedCRN);
            mysqli_stmt_execute($stmt);

            // Commit the transaction
            mysqli_commit($conn);
            echo "You have been successfully enrolled in the selected courses.";
        } catch (Exception $e) {
            mysqli_rollback($conn);
            echo "An error occurred: " . $e->getMessage();
        }
    }
}
} else {
echo "No courses were selected.";
}
?>

<!DOCTYPE html>
<html lang="en">
<head>

<div class="header">
      <h1>Academic Profile</h1>
      <a href="student_academic_profile1.php" class="back-button">Back</a>
   </div>

   <meta charset="UTF-8">
   <meta http-equiv="X-UA-Compatible" content="IE-edge">
   <title>Course Assignment</title>
   <!-- Add your CSS file here -->
   <style>
    .header {
         background: #000; 
         color: #fff; 
         padding: 20px;
         background-color: #000;
         text-align: left;
         margin-top: 20px;
         display: flex;
         justify-content: space-between;
         align-items: center;
      }

      .header h1 {
         font-size: 36px; 
         margin: 0;
      }

      .header .logo {
         width: 50px;
         height: 50px;
      }

      .button-container {
         display: flex;
         align-items: center;
      }

      .button-container .btn {
         display: inline-block;
         padding: 10px 30px;
         font-size: 20px;
         background: #000; 
         color: #fff; 
         margin: 0 20px; 
         text-transform: capitalize;
         text-decoration: none; 
         border-radius: 5px;
         background-color: #000;
      }

      .button-container .btn:hover {
         background: #333;
      }

      
     .welcome-statement {
         color: #333;
         font-size: 18px;
         padding: 40px;
         text-align: center;
         font-family: 'Poppins', cursive; 
         border: 2px solid #444; 
         box-shadow: 0 0 20px rgba(0, 0, 0, 0.1); 
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
       #searchInput {
           width: 300px;
           padding: 10px;
           margin-bottom: 20px;
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
           displayBox.textContent = "Selected Courses: " + selectedInfo.join(", ");
       }
   </script>
</head>
<body>
   <div id="selectedCoursesBox">Selected Courses: None</div>
   <div class="course-assignment-container">
      <h1>Assign Courses</h1>
      <input type="text" id="searchInput" onkeyup="searchTable()" placeholder="Search for courses...">
      <form action="" method="post">
         <table id="courseTable">
            <thead>
                <tr>
                    <th>CRN</th>
                    <th>Course Name</th>
                    <th>Day</th>
                    <th>Building</th>
                    <th>Time</th>
                    <th>Available Seats</th>
                    <th>Select</th>
                </tr>
            </thead>
            <tbody>
                <?php foreach ($courses as $course): ?>
                    <tr>
                        <td><?php echo $course['CRN']; ?></td>
                        <td><?php echo $course['CourseName']; ?></td>
                        <td><?php echo $course['Day']; ?></td>
                        <td><?php echo $course['Bldg']; ?></td>
                        <td><?php echo $course['StartTime'] . " to " . $course['EndTime']; ?></td>
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
