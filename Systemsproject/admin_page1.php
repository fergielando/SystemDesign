<?php
@include 'config1.php';

session_start();

if (!isset($_SESSION['admin_name'])) {
   header('location:login_form1.php');
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
   <meta charset="UTF-8">
   <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
   <meta name="viewport" content="width device-width, initial-scale=1.0">
   <title>Admin Panel</title>

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
    <style>
   /* ... [Your existing styles] ... */
   
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

   </style>
</head>


   <div class="header">
      <img src="ua.png" alt="U.A. Logo" class="logo">
      <h1>U.A. University Admin Page</h1>
      <div class="buttons">
         <a href="logout1.php" class="btn">Logout</a>
         <a href="Update_a_user1.php" class="btn">Update a user</a>
         <a href="course_catalog1.php" class="btn">Course Catalog</a>
         <a href="Departments_page1.php" class="btn">Departments</a>
         <a href="master_schedule1.php" class="btn">Master Schedule</a>
         <a href="#" class="btn">Academic Calendar</a>
         <a href="majors1.php" class="btn">Majors</a> <!-- Added Majors button -->
      <a href="minors1.php" class="btn">Minors</a> <!-- Added Minors button -->
      </div>
   </div>
   <div class="welcome-message">
      <p>Welcome, <?php echo $_SESSION['admin_name']; ?>, This is the U.A. University Admin Page!</p>
   <div class="container">
      <div class="content">
</html>


<div class="container">
   <div class="content">
      <!-- Master Schedule Table -->
      <h2>Master Schedule</h2>
      <table border="1">
         <tr>
            <th>Schedule ID</th>
            <th>Course Name</th>
            <th>Day</th>
            <th>Time</th>
            <th>Building</th>
            <th>Room</th>
         </tr>

         <?php
         // SQL query to select data from the master schedule table
         $query = "SELECT ScheduleID, CourseName, Day, Time, Bldg, Room FROM masterschedule";
         $result = mysqli_query($conn, $query);

         // Check if the query returns any rows
         if (mysqli_num_rows($result) > 0) {
            // Output data of each row
            while($row = mysqli_fetch_assoc($result)) {
               echo "<tr>";
               echo "<td>" . htmlspecialchars($row["ScheduleID"]) . "</td>";
               echo "<td>" . htmlspecialchars($row["CourseName"]) . "</td>";
               echo "<td>" . htmlspecialchars($row["Day"]) . "</td>";
               echo "<td>" . htmlspecialchars($row["Time"]) . "</td>";
               echo "<td>" . htmlspecialchars($row["Bldg"]) . "</td>";
               echo "<td>" . htmlspecialchars($row["Room"]) . "</td>";
               echo "</tr>";
            }
         } else {
            echo "<tr><td colspan='5'>No schedule available</td></tr>";
         }
         ?>
      </table>
   </div>
</div>


