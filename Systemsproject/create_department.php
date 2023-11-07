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
<html>
<head>
    <title>Create Department</title>
</head>
<body>
    <h2>Create a New Department</h2>
    <form method="post" action="create_department.php">
        <label for="newDeptID">Department ID:</label>
        <input type="text" name="newDeptID" id="newDeptID" required><br><br>

        <label for="newDeptName">Department Name:</label>
        <input type="text" name="newDeptName" id="newDeptName" required><br><br>

        <label for="newChairId">Chair ID:</label>
        <input type="text" name="newChairId" id="newChairId" required><br><br>

        <label for="newDeptManager">Department Manager:</label>
        <input type="text" name="newDeptManager" id="newDeptManager" required><br><br>

        <label for="newEmail">Email:</label>
        <input type="email" name="newEmail" id="newEmail" required><br><br>

        <label for="newPhoneNum">Phone Number:</label>
        <input type="tel" name="newPhoneNum" id="newPhoneNum" required><br><br>

        <label for="newRoomID">Room ID:</label>
        <input type="text" name="newRoomID" id="newRoomID" required><br><br>

        <input type="submit" name="create" value="Create Department">
    </form>
</body>
</html>

