<?php
error_reporting(E_ALL);
ini_set("display_errors", 1);
@include 'config1.php';

// Retrieve course data from the database
$query = "SELECT * FROM course WHERE CourseID <> 'NULL'";
$result = mysqli_query($conn, $query);
$course = [];

while ($row = mysqli_fetch_assoc($result)) {
    $course[] = $row;
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
   <meta charset="UTF-8">
   <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <title>Course Catalog</title>

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

   <div class="header">
      <img src="ua.png" alt="U.A. Logo" class="logo">
      <h1>U.A. University Course Catalog</h1>
      <div class="buttons">
         <a href="statsoffice_page1.php" class="btn">Back to Home Page</a>
      </div>
   </div>

   <div class="welcome-message">
      <p>Welcome, Visitor. This is the Course Catalog Page!</p>
   </div>

   <div class="department-container">
      <h2>Courses</h2>
      <table>
         <tr>
            <th>CourseID</th>
            <th>CourseName</th>
            <th>DeptID</th>
            <th>Credits</th>
            <th>Description</th>
            <th>CourseType</th>
         </tr>
         <?php foreach ($course as $course) : ?>
            <tr>
               <td><?php echo $course['CourseID']; ?></td>
               <td><?php echo $course['CourseName']; ?></td>
               <td><?php echo $course['DeptID']; ?></td>
               <td><?php echo $course['Credits']; ?></td>
               <td><?php echo $course['Description']; ?></td>
               <td><?php echo $course['CourseType']; ?></td>
            </tr>
         <?php endforeach; ?>
      </table>
   </div>

</body>
</html>
`