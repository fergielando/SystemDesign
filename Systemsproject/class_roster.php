<?php
// Include database configuration and start session
@include 'config1.php';
session_start();

// Check if CRN is provided
if (!isset($_GET['CRN'])) {
    echo "No course selected.";
    exit;
}

$CRN = $_GET['CRN'];

// Fetch course details
$courseInfoQuery = "SELECT coursesection.CourseID, course.CourseName 
                    FROM coursesection
                    JOIN course ON coursesection.CourseID = course.CourseID
                    WHERE CRN = '$CRN'";
$courseInfoResult = mysqli_query($conn, $courseInfoQuery);
$courseID = '';
$courseName = '';


if ($courseRow = mysqli_fetch_assoc($courseInfoResult)) {
    $courseID = $courseRow['CourseID'];
    $courseName = $courseRow['CourseName'];
} else {
    echo "Course details not found.";
    exit;
}

// Fetch course days
$courseDaysQuery = "SELECT day.Weekday
                    FROM coursesection
                    JOIN timeslot ON coursesection.TimeSlotID = timeslot.TimeSlotID
                    JOIN day ON timeslot.DayID = day.DayID
                    WHERE coursesection.CRN = '$CRN'";
$courseDaysResult = mysqli_query($conn, $courseDaysQuery);
$courseDays = [];
while ($dayRow = mysqli_fetch_assoc($courseDaysResult)) {
    $courseDays[] = strtolower($dayRow['Weekday']);
}

// Check if today is a course day
$currentWeekday = strtolower(date('l')); // e.g., 'monday'
$isCourseDay = in_array($currentWeekday, $courseDays);

// Fetch students, majors, and minors
$rosterQuery = "SELECT student.StudentID, user.FirstName, user.LastName, enrollment.Grade,
                       GROUP_CONCAT(DISTINCT major.MajorName SEPARATOR ', ') AS Majors,
                       GROUP_CONCAT(DISTINCT minor.MinorName SEPARATOR ', ') AS Minors
                FROM enrollment
                INNER JOIN student ON enrollment.StudentID = student.StudentID
                INNER JOIN user ON student.StudentID = user.UID
                LEFT JOIN studentmajor ON student.StudentID = studentmajor.StudentID
                LEFT JOIN major ON studentmajor.MajorID = major.MajorID
                LEFT JOIN studentminor ON student.StudentID = studentminor.StudentID
                LEFT JOIN minor ON studentminor.MinorID = minor.MinorID
                WHERE enrollment.CRN = '$CRN'
                GROUP BY student.StudentID";
$rosterResult = mysqli_query($conn, $rosterQuery);
$students = mysqli_fetch_all($rosterResult, MYSQLI_ASSOC);

// Function to handle grade assignment
function assignGrade($conn, $studentID, $CRN, $grade) {
    mysqli_begin_transaction($conn);

    try {
        // Update grade in enrollment table
        $updateEnrollment = "UPDATE enrollment SET Grade = '$grade' WHERE StudentID = '$studentID' AND CRN = '$CRN'";
        mysqli_query($conn, $updateEnrollment);

        // Update or insert grade in studenthistory table
        // Check if a record already exists
        $checkHistory = "SELECT * FROM studenthistory WHERE StudentID = '$studentID' AND CRN = '$CRN'";
        $historyResult = mysqli_query($conn, $checkHistory);

        if (mysqli_num_rows($historyResult) > 0) {
            // Update existing record
            $updateHistory = "UPDATE studenthistory SET Grade = '$grade' WHERE StudentID = '$studentID' AND CRN = '$CRN'";
            mysqli_query($conn, $updateHistory);
        } else {
            // Insert new record
            $insertHistory = "INSERT INTO studenthistory (StudentID, CRN, Grade) VALUES ('$studentID', '$CRN', '$grade')";
            mysqli_query($conn, $insertHistory);
        }

        // Commit transaction
        mysqli_commit($conn);
    } catch (Exception $e) {
        mysqli_rollback($conn); // Rollback transaction on error
        echo "Error updating grade: " . $e->getMessage();
    }
}

// Check if the form has been submitted for grade assignment
if ($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_POST['assignGrade'])) {
    assignGrade($conn, $_POST['StudentID'], $_POST['CRN'], $_POST['Grade']);
}

?>

<!DOCTYPE html>
<html lang="en">
<head>
   <meta charset="UTF-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <title>Class Roster for Course <?php echo htmlspecialchars($CRN); ?> - Course ID: <?php echo htmlspecialchars($courseID); ?></title>


   <style>
       /* Styles for the header */
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
      .department-container {
         padding: 20px;
      }

      table {
         width: 100%;
         border-collapse: collapse;
      }

      table, th, td {
         border: 1px solid #000;
      }

      th, td {
         padding: 8px;
         text-align: left;
      }
      th {
      background-color: #f2f2f2; /* Gives a slight background color to the header */
   }

   /* Style for every other row */
   tr:nth-child(even) {
      background: linear-gradient(90deg, #87CEEB, #FFFFFF); /* Light blue to white gradient */
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

   </style>
</head>
<body>
<header class="header">
      <img src="ua.png" alt="U.A. Logo" class="logo">
      <h1>Welcome to U.A. University</h1>
      <div class="button-container">
         <a href="fac_newhome1.php" class="btn">Back</a>
      </div>
   </header>
  

   <h1>Class Roster for Course: <?php echo htmlspecialchars($courseName); ?> (CRN: <?php echo htmlspecialchars($CRN); ?>)</h1>

   <table>
    <thead>
        <tr>
            <th>Student ID</th>
            <th>First Name</th>
            <th>Last Name</th>
            <th>Major(s)</th>
            <th>Minor</th>
            <th>Grade</th>
            <th>Assign Grade</th>
            <th>Attendance</th> <!-- New column for Attendance -->
        </tr>
    </thead>
    <tbody>
        <?php foreach ($students as $student): ?>
            <tr>
                <td><?php echo htmlspecialchars($student['StudentID']); ?></td>
                <td><?php echo htmlspecialchars($student['FirstName']); ?></td>
                <td><?php echo htmlspecialchars($student['LastName']); ?></td>
                <td><?php echo htmlspecialchars($student['Majors']); ?></td>
                <td><?php echo htmlspecialchars($student['Minors']); ?></td>
                <td><?php echo htmlspecialchars($student['Grade']); ?></td>
                <td>
                    <form action="class_roster.php?CRN=<?php echo htmlspecialchars($CRN); ?>" method="post">
                        <input type="hidden" name="StudentID" value="<?php echo htmlspecialchars($student['StudentID']); ?>">
                        <input type="hidden" name="CRN" value="<?php echo htmlspecialchars($CRN); ?>">
                        <input type="text" name="Grade" placeholder="Enter grade">
                        <button type="submit" name="assignGrade">Assign</button>
                    </form>
                </td>
                <td>
                    <?php if ($isCourseDay): ?>
                        <form action="record_attendance.php" method="post">
                            <input type="hidden" name="StudentID" value="<?php echo htmlspecialchars($student['StudentID']); ?>">
                            <input type="hidden" name="CRN" value="<?php echo htmlspecialchars($CRN); ?>">
                            <!-- Create a dropdown calendar for attendance -->
                            <select name="attendance_date">
                                <?php
                                // Fetch attendance dates for the current date only
                                $currentDate = date('Y-m-d'); // Get the current date
                                $attendanceDatesQuery = "SELECT DISTINCT ClassDate, Present FROM attendance WHERE StudentID = '" . $student['StudentID'] . "' AND CRN = '$CRN' AND ClassDate = '$currentDate'";
                                $attendanceDatesResult = mysqli_query($conn, $attendanceDatesQuery);

                                // Check if there are any attendance records for the current date
                                if (mysqli_num_rows($attendanceDatesResult) > 0) {
                                    // There are attendance records for the current date
                                    $attendanceDateRow = mysqli_fetch_assoc($attendanceDatesResult);
                                    $currentDate = $attendanceDateRow['ClassDate'];
                                    $currentAttendanceStatus = $attendanceDateRow['Present'];
                                } else {
                                    // No attendance records for the current date
                                    $currentDate = date('Y-m-d'); // Get the current date
                                    $currentAttendanceStatus = ''; // No attendance status
                                }

                                echo "<option value='$currentDate'>$currentDate</option>";
                                ?>
                            </select>
                            <select name="attendance">
                                <option value="present" <?php if ($currentAttendanceStatus === 'present') echo 'selected'; ?>>Present</option>
                                <option value="absent" <?php if ($currentAttendanceStatus === 'absent') echo 'selected'; ?>>Absent</option>
                            </select>
                            <button type="submit" name="recordAttendance">Record</button>
                        </form>
                    <?php else: ?>
                        <span>Not a course day</span>
                    <?php endif; ?>
                </td>
            </tr>
        <?php endforeach; ?>
    </tbody>
</table>

</body>
</html>

