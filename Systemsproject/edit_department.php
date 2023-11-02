<?php
@include 'config1.php';

// Check if a department ID is provided in the URL
if (isset($_GET['id'])) {
    $deptID = mysqli_real_escape_string($conn, $_GET['id']);

    // Retrieve the department information from the database based on the provided department ID
    $query = "SELECT * FROM dept WHERE DeptID = '$deptID'";
    $result = mysqli_query($conn, $query);

    if (mysqli_num_rows($result) > 0) {
        $department = mysqli_fetch_assoc($result);
    } else {
        // Handle the case where the department with the given ID doesn't exist
        echo "Department not found.";
        exit;
    }
} else {
    // Handle the case where no department ID is provided in the URL
    echo "Department ID not provided.";
    exit;
}

// Update department information
if (isset($_POST['update'])) {
    $newDeptName = mysqli_real_escape_string($conn, $_POST['newDeptName']);
    $newChairId = mysqli_real_escape_string($conn, $_POST['newChairId']);
    $newDeptManager = mysqli_real_escape_string($conn, $_POST['newDeptManager']);
    $newEmail = mysqli_real_escape_string($conn, $_POST['newEmail']);
    $newPhoneNum = mysqli_real_escape_string($conn, $_POST['newPhoneNum']);
    $newRoomID = mysqli_real_escape_string($conn, $_POST['newRoomID']);

    $updateQuery = "UPDATE dept SET DeptName = '$newDeptName', ChairId = '$newChairId', DeptManager = '$newDeptManager', Email = '$newEmail', PhoneNum = '$newPhoneNum', RoomID = '$newRoomID' WHERE DeptID = '$deptID'";

    if (mysqli_query($conn, $updateQuery)) {
        // Redirect back to the department list page after the update is successful
        header('location:Departments_page1.php');
    } else {
        // Handle the case where the update fails
        echo "Update failed. Please try again.";
    }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
   <meta charset="UTF-8">
   <meta http-equiv="X-UA-Compatible" content="IE-edge">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <title>Edit Department</title>

   <link rel="stylesheet" href="css/fatman1.css">

   <style>
      /* Add your custom styles here */
   </style>
</head>
<body>

   <div class="header">
      <h1>Edit Department</h1>
      <a href="Departments_page1.php" class="back-button">Back to Department List</a>
   </div>

   <div class="edit-department-container">
      <h2>Edit Department Information</h2>
      <form action="" method="post">
         <input type="text" name="newDeptName" placeholder="Department Name" value="<?php echo $department['DeptName']; ?>">
         <input type="text" name="newChairId" placeholder="Chair ID" value="<?php echo $department['ChairID']; ?>">
         <input type="text" name="newDeptManager" placeholder="Department Manager" value="<?php echo $department['DeptManager']; ?>">
         <input type="text" name="newEmail" placeholder="Email" value="<?php echo $department['Email']; ?>">
         <input type="text" name="newPhoneNum" placeholder="Phone Number" value="<?php echo $department['PhoneNum']; ?>">
         <input type="text" name="newRoomID" placeholder="Room ID" value="<?php echo $department['RoomID']; ?>"> 
         <input type="submit" name="update" value="Update">
      </form>
   </div>

   <!-- Add any other elements or styling as needed -->

</body>
</html>
