<!DOCTYPE html>
<html lang="en">
<head>
   <meta charset="UTF-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <title>User Page - Master Schedule</title>
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
</head>
<body>
   <div class="header">
      <img src="ua.png" alt="U.A. Logo" class="logo">
      <h1>Welcome to U.A. University</h1>
      <div class="button-container">
      <a href="logout1.php" class="btn">Logout</a>
      </div>
   </div>

   <div class="welcome-statement">
      Welcome to the User Dashboard! Here you can view the master schedule for U.A. University.
   </div>

   <!-- Master Schedule Table Section -->
   <div class="container">
      <h2>Master Schedule</h2>
      <div class="content">
         <!-- The Master Schedule Table -->
         <table class="master-schedule-table">
            <thead>
               <tr>
                  <th>Schedule ID</th>
                  <th>Course Name</th>
                  <th>Day</th>
                  <th>Time</th>
                  <th>Building</th>
                  <th>Room</th>
               </tr>
            </thead>
            <tbody>
               <!-- PHP code to fetch data from the database and display rows -->
               <?php
               // Include your database configuration file
               @include 'config1.php';

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
                  echo "<tr><td colspan='6'>No schedule available</td></tr>";
               }
               ?>
            </tbody>
         </table>
      </div>
   </div>

</body>
</html>
