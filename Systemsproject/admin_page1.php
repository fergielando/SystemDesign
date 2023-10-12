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
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
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
   </style>
</head>
<body>
   <div class="header">
      <h1>Welcome to U.A. University Admin Page</h1>
      <div class="buttons">
         <a href="logout1.php" class="btn">Logout</a>
         <a href="Create_a_user1.php" class="btn">Create a user</a>
         <a href="#" class="btn">Course Catalog</a>
         <a href="#" class="btn">Departments</a>
         <a href="#" class="btn">Master Schedule</a>
         <a href="#" class="btn">Academic Calendar</a>
      </div>
   </div>

   <div class="container">
      <div class="content">
      </div>
   </div>
</body>
</html>
