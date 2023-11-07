<?php
@include 'config1.php';

session_start();

if (!isset($_SESSION['admin_name'])) {
    header('location: login_form1.php');
    exit;
}

// Enable error reporting and display errors during development
error_reporting(E_ALL);
ini_set('display_errors', 1);

// Create a new course
if (isset($_POST['create'])) {
    $newCourseID = mysqli_real_escape_string($conn, $_POST['newCourseID']);
    $newCourseName = mysqli_real_escape_string($conn, $_POST['newCourseName']);
    $newDeptId = mysqli_real_escape_string($conn, $_POST['newDeptId']);
    $newCredits = mysqli_real_escape_string($conn, $_POST['newCredits']);
    $newDescription = mysqli_real_escape_string($conn, $_POST['newDescription']);
    $newCourseType = mysqli_real_escape_string($conn, $_POST['newCourseType']);

    // Your code to insert a new course into the database
    $insertQuery = "INSERT INTO `Course` (`CourseID`, `CourseName`, `DeptID`, `Credits`, `Description`, `CourseType`) VALUES ('$newCourseID', '$newCourseName', '$newDeptId', '$newCredits', '$newDescription', '$newCourseType')";

    if (mysqli_query($conn, $insertQuery)) {
        header('location: course_catalog1.php');
        exit;
    } else {
        echo "Course creation failed: " . mysqli_error($conn);
    }
}

// Retrieve course data from the database
$query = "SELECT * FROM `Course`"; // Adjust the SQL query to match your database schema
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
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Create Course</title>
</head>
<body>
    <h2>Create a New Course</h2>
    <form action="create_course1.php" method="POST">
        <label for="newCourseID">Course ID:</label>
        <input type="text" name="newCourseID" id="newCourseID" required><br>
        
        <label for="newCourseName">Course Name:</label>
        <input type="text" name="newCourseName" id="newCourseName" required><br>
        
        <label for="newDeptId">Department ID:</label>
        <input type="text" name="newDeptId" id="newDeptId" required><br>
        
        <label for="newCredits">Credits:</label>
        <input type="text" name="newCredits" id="newCredits" required><br>
        
        <label for="newDescription">Description:</label>
        <textarea name="newDescription" id="newDescription" required></textarea><br>
        
        <label for="newCourseType">Course Type:</label>
        <input type="text" name="newCourseType" id="newCourseType" required><br>
        
        <button type="submit" name="create">Create Course</button>
    </form>
</body>
</html>
