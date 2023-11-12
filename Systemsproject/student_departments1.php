<?php
@include 'config1.php';

// Retrieve department data from the database
$query = "SELECT * FROM dept";
$result = mysqli_query($conn, $query);
$departments = [];

while ($row = mysqli_fetch_assoc($result)) {
    $departments[] = $row;
}

?>

<!DOCTYPE html>
<html lang="en">
<head>
   <meta charset="UTF-8">
   <meta http-equiv="X-UA-Compatible" content="IE-edge">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <title>Department Page</title>

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

      .header .back-button {
         background: #000;
         color: #fff;
         padding: 10px 20px;
         text-decoration: none;
         border-radius: 5px;
         margin-right: 10px;
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

      .create-button {
        background: #000;
        color: #fff;
        padding: 10px 20px;
        text-decoration: none;
        border-radius: 5px;
        margin: 10px;
        display: inline-block;
    }
   </style>
</head>
<body>

   <div class="header">
      <h1>Department Management</h1>
      <a href="user_page1.php" class="back-button">Back to Student Portal</a>
   </div>

   <div class="department-container">
      <h2>List of Departments</h2>
      <table>
         <tr>
            <th>DeptID</th>
            <th>DeptName</th>
            <th>ChairId</th>
            <th>DeptManager</th>
            <th>Email</th>
            <th>PhoneNum</th>
            <th>RoomID</th>
         </tr>
         <?php foreach ($departments as $department) : ?>
            <tr>
               <td><?php echo $department['DeptID']; ?></td>
               <td><?php echo $department['DeptName']; ?></td>
               <td><?php echo $department['ChairID']; ?></td>
               <td><?php echo $department['DeptManager']; ?></td>
               <td><?php echo $department['Email']; ?></td>
               <td><?php echo $department['PhoneNum']; ?></td>
               <td><?php echo $department['RoomID']; ?></td>
               <td>
            </tr>
         <?php endforeach; ?>
      </table>
</div>
   

   <!-- Add any other elements, forms, or buttons for adding departments as needed -->

</body>
</html>
