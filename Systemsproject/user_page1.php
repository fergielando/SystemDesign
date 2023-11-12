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

      .welcome-statement {
         text-align: center;
         padding: 20px;
         font-size: 24px;
         margin-bottom: 10px;
      }

      .search-container {
         margin-top: 20px;
         text-align: center;
      }

      .search-container input[type=text] {
         padding: 10px;
         margin: 8px 0;
         box-sizing: border-box;
      }

      .search-container input[type=submit] {
         background-color: #000;
         color: white;
         padding: 10px 20px;
         border: none;
         border-radius: 5px;
         cursor: pointer;
      }

      table {
         width: 100%;
         max-width: 100%;
         border-collapse: collapse;
         table-layout: auto;
      }

      th, td {
         border: 1px solid #000;
         padding: 15px;
         text-align: left;
         font-size: 14px;
         word-wrap: break-word;
      }

      th {
         background-color: #f2f2f2;
      }

      tr:nth-child(even) {
         background-color: #ccffcc;
      }
   </style>
</head>
<body>
   <div class="header">
      <img src="ua.png" alt="U.A. Logo" class="logo">
      <h1>Welcome to U.A. University</h1>
      <div class="button-container">
         <a href="logout1.php" class="btn">Logout</a>
         <a href="student_academic_profile1.php" class="btn">Academic Profile</a>
         <a href="student_course_catalog1.php" class="btn">Course Catalog</a>
         <a href="student_majors1.php" class="btn">Majors</a>
         <a href="student_minors1.php" class="btn">Minors</a>
         <a href="student_departments1.php" class="btn">Departments</a>
      </div>
   </div>

   <?php
      // Assuming you have stored the student's name in the session
      session_start();
      $studentName = isset($_SESSION['student_name']) ? $_SESSION['student_name'] : "Brian";
   ?>

   <div class="welcome-statement">
      Welcome, <?php echo $studentName; ?>, to the Student Dashboard! Here you can view the master schedule for U.A. University.
   </div>

   <!-- Search functionality -->
   <div class="search-container">
      <form action="" method="get">
         <input type="text" placeholder="Search for a course..." name="search">
         <input type="submit" value="Search">
      </form>
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
