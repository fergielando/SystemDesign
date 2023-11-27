<?php
// Include database configuration file and start session
@include 'config1.php';
session_start();

// Check if user is logged in
if (!isset($_SESSION['UID'])) {
    // Redirect to login page or display a login link
    echo "Please log in. <a href='login_page1.php'>Login Here</a>";
    exit;
}

$UID = $_SESSION['UID'];

// Fetch faculty details for the welcome message
$facultyQuery = "SELECT FirstName FROM user WHERE UID = '$UID'";
$facultyResult = mysqli_query($conn, $facultyQuery);
$facultyName = '';
if ($facultyRow = mysqli_fetch_assoc($facultyResult)) {
    $facultyName = $facultyRow['FirstName'];
} else {
    // Handle case where faculty details are not found
    echo "Faculty details not found.";
    exit;
}

// Fetch the courses assigned to the faculty
$scheduleQuery = "SELECT coursesection.CRN, coursesection.CourseID, coursesection.AvailableSeats, timeslot.TimeSlotID, day.Weekday, masterschedule.CourseName, room.RoomNum, building.BuildingName, periodd.StartTime, periodd.EndTime
                  FROM facultyhistory
                  JOIN coursesection ON facultyhistory.CourseID = coursesection.CourseID
                  JOIN timeslot ON coursesection.TimeSlotID = timeslot.TimeSlotID 
                  JOIN day ON timeslot.DayID = day.DayID
                  JOIN masterschedule ON coursesection.CourseID = masterschedule.CourseID 
                  JOIN periodd ON timeslot.PeriodID = periodd.PeriodID
                  JOIN room ON coursesection.RoomID = room.RoomID
                  JOIN building ON room.BuildingID = building.BuildingID
                  WHERE facultyhistory.FacultyID = '$UID'";
$scheduleResult = mysqli_query($conn, $scheduleQuery);

$courses = [];
while ($row = mysqli_fetch_assoc($scheduleResult)) {
    $courses[] = $row;
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
   <meta charset="UTF-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <!-- Add your CSS link here -->
   <link rel="stylesheet" href="path_to_your_stylesheet.css">

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

      /* Hover effect for rows */
      tr:hover {
         background-color: #e6ffe6; /* Lighter green on hover */
      }

      td, th {
         padding: 10px;
         border: 1px solid #ccc;
         text-align: center;
      }
      </style>
</head>
<body>
  <header class="header">
   <img src="ua.png" alt="U.A. Logo" class="logo">
      <h1>Welcome to U.A. University</h1>
      <div class="button-container">
         <a href="logout1.php" class="btn">Logout</a>
         <a href="student_majors1.php" class="btn">Majors</a>
         <a href="student_minors1.php" class="btn">Minors</a>
         <a href="student_departments1.php" class="btn">Departments</a>
         <a href="faculty_page1.php" class="btn">Master Schedule</a>
      </div>
   </header>

   <!-- Welcome message -->
   <div class="welcome-message">
      <h2>Welcome, <?php echo $facultyName; ?> (User ID: <?php echo $UID; ?>)</h2>
   </div>

   <!-- Schedule label -->
   <h2>Schedule</h2>

   <!-- Schedule table -->
   <table>
      <thead>
         <tr>
            <th>CRN</th>
            <th>Course Name</th>
            <th>Day</th>
            <th>Building</th>
            <th>Room</th>
            <th>Time</th>
            <th>Action</th>
         </tr>
      </thead>
      <tbody>
         <?php foreach ($courses as $course): ?>
            <tr>
               <td><?php echo $course['CRN']; ?></td>
               <td><?php echo $course['CourseName']; ?></td>
               <td><?php echo $course['Weekday']; ?></td>
               <td><?php echo $course['BuildingName']; ?></td>
               <td><?php echo $course['RoomNum']; ?></td>
               <td><?php echo $course['StartTime'] . " - " . $course['EndTime']; ?></td>
               <td><a href="class_roster.php?CRN=<?php echo $course['CRN']; ?>">Class Roster</a></td>
            </tr>
         <?php endforeach; ?>
      </tbody>
   </table>

</body>
</html>
 