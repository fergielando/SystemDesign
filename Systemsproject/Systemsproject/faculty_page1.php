<?php
// Include your database configuration file and session start if needed
@include 'config1.php';
session_start();

// Fetch available courses with additional details, ordered by CRN (Include this part only)
$query = "SELECT coursesection.CRN, coursesection.CourseID, coursesection.AvailableSeats, timeslot.TimeSlotID, day.Weekday, masterschedule.CourseName, room.RoomNum, building.BuildingName, periodd.StartTime, periodd.EndTime 
          FROM coursesection 
          JOIN timeslot ON coursesection.TimeSlotID = timeslot.TimeSlotID 
          JOIN day ON timeslot.DayID = day.DayID
          JOIN masterschedule ON coursesection.CourseID = masterschedule.CourseID 
          JOIN periodd ON timeslot.PeriodID = periodd.PeriodID
          JOIN room ON coursesection.RoomID = room.RoomID
          JOIN building ON room.BuildingID = building.BuildingID
          ORDER BY coursesection.CRN ASC";
$result = mysqli_query($conn, $query);

$courses = [];
while ($row = mysqli_fetch_assoc($result)) {
    $courses[] = $row;
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
   <meta charset="UTF-8">
   <meta http-equiv="X-UA-Compatible" content="IE-edge">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <link rel="stylesheet" href="css/fatman1.css">

   <div class="header">
      <img src="ua.png" alt="U.A. Logo" class="logo">
      <h1>Welcome to U.A. University</h1>
      <div class="button-container">
         <a href="logout1.php" class="btn">Logout</a>
         <a href="student_majors1.php" class="btn">Majors</a>
         <a href="student_minors1.php" class="btn">Minors</a>
         <a href="student_departments1.php" class="btn">Departments</a>
      </div>
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

      .header h1 {
         font-size: 36px; 
      }

      .container {
         margin-top: 20px;
      }

      .buttons {
         display: flex;
         align-items: center;
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
      .header .logo {
         width: 50px; 
         height: 50px; 
      }
      
      .welcome-message {
         text-align: center;
         padding: 20px;
         font-size: 24px; 
         margin-bottom: 10px;
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

   
</style>
</head>
<body>
   <table>
        
   
   <div class="content">
      <!-- Master Schedule Table -->
      <h2>Master Schedule</h2>
      <table border="1">
         <tr>
            <th>CRN</th>
            <th>Course Name</th>
            <th>Day</th>
            <th>Building</th>
            <th>Room</th>
            <th>Time</th>
            <th>Available Seats</th>
         </tr>
         <?php foreach ($courses as $course): ?>
            <tr>
               <td><?php echo $course['CRN']; ?></td>
               <td><?php echo $course['CourseName']; ?></td>
               <td><?php echo $course['Weekday']; ?></td>
               <td><?php echo $course['BuildingName']; ?></td>
               <td><?php echo $course['RoomNum']; ?></td>
               <td><?php echo $course['StartTime'] . " to " . $course['EndTime']; ?></td>
               <td><?php echo $course['AvailableSeats']; ?></td>
            </tr>
         <?php endforeach; ?>
   </table>
</body>
</html>
