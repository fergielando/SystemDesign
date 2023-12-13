<?php
@include 'config1.php';


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
      background-color: #f2f2f2; 
   }

  
   tr:nth-child(even) {
      background-color: #ccffcc; 
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
      <a href="editdepartment.php" class="back-button">Edit Departments</a>
      <a href="facultyinformation.php" class="back-button">Edit Faculty</a>
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
                    <td>
                        <?php 
                         // Check for MIS department
                         if ($department['DeptID'] === 'MIS') {
                           echo '<a href="mis_departmentinfo1.php">' . htmlspecialchars($department['DeptName']) . '</a>';
                       }
                       // Check for CIS department
                       elseif ($department['DeptID'] === 'CIS') {
                           echo '<a href="cisinfo1.php">' . htmlspecialchars($department['DeptName']) . '</a>';
                       }
                       // Check for ENG department
                       elseif ($department['DeptID'] === 'ENG') {
                        echo '<a href="enginfo1.php">' . htmlspecialchars($department['DeptName']) . '</a>';
                    }
                       // Check for Art department
                       elseif ($department['DeptID'] === 'ART') {
                           echo '<a href="artinfo1.php">' . htmlspecialchars($department['DeptName']) . '</a>';
                       }
                        // Check for BUS department
                        elseif ($department['DeptID'] === 'BUS') {
                           echo '<a href="businfo1.php">' . htmlspecialchars($department['DeptName']) . '</a>';
                       }
                        // Check for CHE department
                        elseif ($department['DeptID'] === 'CHE') {
                           echo '<a href="cheinfo1.php">' . htmlspecialchars($department['DeptName']) . '</a>';
                       }
                        // Check for CHE department
                        elseif ($department['DeptID'] === 'ECO') {
                           echo '<a href="ecoinfo1.php">' . htmlspecialchars($department['DeptName']) . '</a>';
                       }
                       elseif ($department['DeptID'] === 'HIS') {
                        echo '<a href="hisinfo1.php">' . htmlspecialchars($department['DeptName']) . '</a>';
                       }
                    elseif ($department['DeptID'] === 'MAT') {
                     echo '<a href="matinfo1.php">' . htmlspecialchars($department['DeptName']) . '</a>';
                       }
                   elseif ($department['DeptID'] === 'PHI') {
                  echo '<a href="phiinfo1.php">' . htmlspecialchars($department['DeptName']) . '</a>';
                       }
                     elseif ($department['DeptID'] === 'PHY') {
                    echo '<a href="phyinfo1.php">' . htmlspecialchars($department['DeptName']) . '</a>';
                         }
                         elseif ($department['DeptID'] === 'POL') {
                           echo '<a href="polinfo1.php">' . htmlspecialchars($department['DeptName']) . '</a>';
                                }
                                elseif ($department['DeptID'] === 'PSY') {
                                 echo '<a href="psyinfo1.php">' . htmlspecialchars($department['DeptName']) . '</a>';
                                      }
                                      elseif ($department['DeptID'] === 'SOC') {
                                       echo '<a href="socinfo1.php">' . htmlspecialchars($department['DeptName']) . '</a>';
                                            }
                       // Fallback for all other departments
                       else {
                           echo '<a href="department_info1.php?DeptID=' . urlencode($department['DeptID']) . '">' . htmlspecialchars($department['DeptName']) . '</a>';
                       }
                       ?>
                    </td>
                    <td><?php echo $department['ChairID']; ?></td>
                    <td><?php echo $department['DeptManager']; ?></td>
                    <td><?php echo $department['Email']; ?></td>
                    <td><?php echo $department['PhoneNum']; ?></td>
                    <td><?php echo $department['RoomID']; ?></td>
                </tr>
            <?php endforeach; ?>
      </table>
      <a href="create_department.php" class="create-button">Create</a>
</div>
   


</body>
</html>
