<?php
// Include your database configuration file and session start if needed
@include 'config1.php';
session_start();

// Fetch enrolled courses for the current student
$uid = $_SESSION['UID'];
$enrolledCoursesQuery = "SELECT coursesection.CRN, coursesection.CourseID, coursesection.AvailableSeats, timeslot.TimeSlotID, day.Weekday, masterschedule.CourseName, room.RoomNum, building.BuildingName, periodd.StartTime, periodd.EndTime 
          FROM enrollment
          JOIN coursesection ON enrollment.CRN = coursesection.CRN
          JOIN timeslot ON coursesection.TimeSlotID = timeslot.TimeSlotID 
          JOIN day ON timeslot.DayID = day.DayID
          JOIN masterschedule ON coursesection.CourseID = masterschedule.CourseID 
          JOIN periodd ON timeslot.PeriodID = periodd.PeriodID
          JOIN room ON coursesection.RoomID = room.RoomID
          JOIN building ON room.BuildingID = building.BuildingID
          WHERE enrollment.StudentID = '$uid'";
$enrolledCoursesResult = mysqli_query($conn, $enrolledCoursesQuery);

// Check if the student has any enrolled courses
if (mysqli_num_rows($enrolledCoursesResult) > 0) {
    $enrolledCourses = [];
    while ($row = mysqli_fetch_assoc($enrolledCoursesResult)) {
        $enrolledCourses[] = $row;
    }
} else {
    $enrolledCourses = false; // No enrolled courses
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <!-- Add your head content here -->
    <meta charset="UTF-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <title>User Page - Master Schedule</title>
   <link rel="stylesheet" href="css/fatman1.css">
   <style>
       body {
            margin: 0;
            padding: 0;
            background-image: url('School.jpg'); /* Replace 'background_image.jpg' with your image file */
            background-size: cover;
            background-position: center;
            font-family: Arial, sans-serif; /* Add a generic font family */
            color: #fff; /* Set text color to white */
            height: 100vh; /* Set the body height to full viewport height */
        }

        .overlay {
            background: rgba(0, 0, 0, 0.5); /* Add a semi-transparent black overlay */
            height: 100%; /* Set the overlay height to full viewport height */
            overflow: auto; /* Allow scrolling if the content overflows */
        }

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

      table {
         width: 100%;
         max-width: 100%;
         border-collapse: collapse;
         table-layout: auto;
         margin: 0 auto;
      }

      th, td {
         border: 1px solid #000;
         padding: 15px;
         text-align: left;
         font-size: 14px;
         word-wrap: break-word;
         border-radius: 10px; 
      }

      th {
         background-color: #f2f2f2;
      }

      tr:nth-child(even) {
         background-color: #ccffcc;
      }

   </style>
<link rel="stylesheet" href="userPage.css">
</head>
<body>
   <div class = "overlay">
   <div class="header">
      <img src="ua.png" alt="U.A. Logo" class="logo">
      <h1>Welcome to U.A. University</h1>
      <div class="button-container">
         <a href="logout1.php" class="btn">Logout</a>
      </div>
   </div>
   

   <div class="welcome-message">
      <p>Welcome, <?php echo $_SESSION['user_name']; ?>. Welcome, this is UA University!</p>
   </div>

   <?php if ($enrolledCourses !== false): ?>
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
            <?php foreach ($enrolledCourses as $course): ?>
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
   <?php else: ?>
      <p>No courses registered for this semester.</p>
   <?php endif; ?>

   <div class="button-container">
         <a href="student_academic_profile1.php" class="btn">Academic Profile</a>
         <a href="student_course_catalog1.php" class="btn">Course Catalog</a>
         <a href="student_majors1.php" class="btn">Majors</a>
         <a href="student_minor1.php" class="btn">Minors</a>
         <a href="student_departments1.php" class="btn">Departments</a>
      </div>
</body>
</html>


