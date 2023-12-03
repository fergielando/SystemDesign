
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
$query = "SELECT coursesection.CRN, coursesection.CourseID, coursesection.SectionNum, timeslot.TimeSlotID, day.Weekday, course.CourseName, course.Description, room.RoomNum, building.BuildingName, periodd.StartTime, periodd.EndTime, coursesection.AvailableSeats
          FROM coursesection 
          JOIN timeslot ON coursesection.TimeSlotID = timeslot.TimeSlotID 
          JOIN day ON timeslot.DayID = day.DayID
          JOIN periodd ON timeslot.PeriodID = periodd.PeriodID
          JOIN room ON coursesection.RoomID = room.RoomID
          JOIN building ON room.BuildingID = building.BuildingID
          JOIN course ON coursesection.CourseID = course.CourseID
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
   <title>Course List</title>
   <link rel="stylesheet" href="css/fatman1.css">

   
   <div class="header">
      <img src="ua.png" alt="U.A. Logo" class="logo">
      <h1>U.A. University Admin Page</h1>
      <div class="buttons">
         <a href="create_course1.php" class="btn">Create Course</a>
         <a href="#" class="btn">Drop Course</a>
         <a href="#" class="btn">Update Course</a>
      <a href="admin_page1.php" class="back-button">Back to Admin Page</a>
      </div>
   </div>


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
         font-size: 24px; /
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
      background-color: #ccffcc; /* Light green background */
   }

   </style>
</head>

<body>
   <h1>Course List</h1>

   <table>
       <thead>
           <tr>
               <th>CRN</th>
               <th>Course Name</th>
               <th>Section</th>
               <th>Day</th>
               <th>Building</th>
               <th>Room</th>
               <th>Time</th>
               <th>Available Seats</th>
               <th>Description</th>
           </tr>
       </thead>
       <tbody>
           <?php foreach ($courses as $course): ?>
               <tr>
                   <td><?php echo $course['CRN']; ?></td>
                   <td><?php echo $course['CourseName']; ?></td>
                   <td><?php echo $course['SectionNum']; ?></td>
                   <td><?php echo $course['Weekday']; ?></td>
                   <td><?php echo $course['BuildingName']; ?></td>
                   <td><?php echo $course['RoomNum']; ?></td>
                   <td><?php echo $course['StartTime'] . " to " . $course['EndTime']; ?></td>
                   <td><?php echo $course['AvailableSeats']; ?></td>
                   <td><?php echo $course['Description']; ?></td>
               </tr>
           <?php endforeach; ?>
       </tbody>
   </table>
</body>
</html>
