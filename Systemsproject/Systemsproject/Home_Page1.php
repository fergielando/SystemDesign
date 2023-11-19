

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
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   
   <!-- Add the styles for the table here or in a separate CSS file -->
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

         
      
   </style>
</head>
<body>
</head>
<body>
   <div class="header">
      <img src="ua.png" alt="U.A. Logo" class="logo">
      <h1>Welcome to U.A. University</h1>
      <div class="button-container">
         <a href="login_form1.php" class="btn">Login</a>
      </div>
   </div>

  
   <div class="welcome-statement">
      Welcome to U.A. University! We are delighted to extend a warm and enthusiastic welcome to all members of the U.A. University community. U.A. University is thrilled to have you as part of our academic family. Our dedicated faculty and staff are here to support and guide you every step of the way. We believe in your potential and are excited to see what you will achieve during your time at U.A. University.
   </div>

   <div class="container">
      <div class="content">
      </div>
   </div>
</body>
</html>
<body>
   <table>
      <thead>
         <tr>
            <th>CRN</th>
            <th>Course Name</th>
            <th>Day</th>
            <th>Building</th>
            <th>Room</th>
            <th>Time</th>
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
               <td><?php echo $course['StartTime'] . " to " . $course['EndTime']; ?></td>
            </tr>
         <?php endforeach; ?>
      </tbody>
   </table>
</body>
</html>
