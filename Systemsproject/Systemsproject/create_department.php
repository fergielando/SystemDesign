<?php
@include 'config1.php';

// Create a new department
if (isset($_POST['create'])) {
    $newDeptID = mysqli_real_escape_string($conn, $_POST['newDeptID']);
    $newDeptName = mysqli_real_escape_string($conn, $_POST['newDeptName']);
    $newChairId = mysqli_real_escape_string($conn, $_POST['newChairId']);
    $newDeptManager = mysqli_real_escape_string($conn, $_POST['newDeptManager']);
    $newEmail = mysqli_real_escape_string($conn, $_POST['newEmail']);
    $newPhoneNum = mysqli_real_escape_string($conn, $_POST['newPhoneNum']);
    $newRoomID = mysqli_real_escape_string($conn, $_POST['newRoomID']);

    // Your code to insert a new department into the database
    $insertQuery = "INSERT INTO dept (DeptID, DeptName, ChairID, DeptManager, Email, PhoneNum, RoomID) VALUES ('$newDeptID', '$newDeptName', '$newChairId', '$newDeptManager', '$newEmail', '$newPhoneNum', '$newRoomID')";
    if (mysqli_query($conn, $insertQuery)) {
        header('location:department_page.php');
    } else {
        echo "Department creation failed: " . mysqli_error($conn);
    }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
   <!-- Add your HTML head content here -->
</head>
<body>
   <div class="header">
      <h1>Create Department</h1>
      <a href="Departments_page1.php" class="back-button">Back to Department Page</a>
   </div>

   <!-- Add a form for creating a new department -->
   <div class="create-department-container">
      <h2>Create a New Department</h2>
      <form action="" method="post">
         <input type="text" name="newDeptID" placeholder="Department ID">
         <input type="text" name="newDeptName" placeholder="Department Name">
         <input type="text" name="newChairId" placeholder="Chair ID">
         <input type="text" name="newDeptManager" placeholder="Department Manager">
         <input type="text" name="newEmail" placeholder="Email">
         <input type="text" name="newPhoneNum" placeholder="Phone Number">
         <input type="text" name="newRoomID" placeholder="Room ID">
         <input type="submit" name="create" value="Create">
      </form>
   </div>
</body>
</html>