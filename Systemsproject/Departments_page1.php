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
      th {
      background-color: #f2f2f2; /* Gives a slight background color to the header */
   }

   /* Style for every other row */
   tr:nth-child(even) {
      background-color: #ccffcc; /* Light green background */
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
      <a href="admin_page1.php" class="back-button">Back to Admin Page</a>
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
            <th>Actions</th>
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
                  <!-- Add Edit and Delete buttons with links or forms as needed -->
                  <a href="edit_department.php?id=<?php echo $department['DeptID']; ?>">Edit</a>
                  <a href="delete_department.php?id=<?php echo $department['DeptID']; ?>">Delete</a>
               </td>
            </tr>
         <?php endforeach; ?>
      </table>
      <a href="create_department.php" class="create-button">Create</a>
</div>
   

   <!-- Add any other elements, forms, or buttons for adding departments as needed -->

</body>
</html>
