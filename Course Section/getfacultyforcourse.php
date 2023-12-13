<?php
@include 'config1.php';

$courseId = $_GET['course_id'] ?? '';


$deptIdQuery = "SELECT DeptID FROM course WHERE CourseID = '$courseId'";
$deptIdResult = mysqli_query($conn, $deptIdQuery);
$deptRow = mysqli_fetch_assoc($deptIdResult);
$deptId = $deptRow['DeptID'] ?? '';



$facultyQuery = "
SELECT f.FacultyID, u.FirstName, u.LastName 
FROM faculty f 
JOIN facultydept fd ON f.FacultyID = fd.FacultyID 
JOIN user u ON f.UID = u.UID 
WHERE fd.DeptID = '$deptId'";

$facultyResult = mysqli_query($conn, $facultyQuery);

$facultyList = [];
while ($facultyRow = mysqli_fetch_assoc($facultyResult)) {
    $facultyList[] = $facultyRow;
}

// ... rest of your code


header('Content-Type: application/json');
echo json_encode($facultyList);
?>
