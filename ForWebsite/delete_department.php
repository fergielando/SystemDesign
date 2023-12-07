<?php
@include 'config1.php'; // Include your database configuration file

session_start();

// Check for user's session UID
if (!isset($_SESSION['UID'])) {
    echo "Please log in to manage Departments.";
    exit;
}

$uid = $_SESSION['UID'];

// Process delete request
if (isset($_GET['DeptID'])) {
    $deptid = $_GET['DeptID'];

    // Perform the course deletion based on the DeptID
    $deleteQuery = "DELETE FROM coursesection WHERE DeptID = $deptID";
    $deleteResult = mysqli_query($conn, $deleteQuery);

    if ($deleteResult) {
        echo "Department with DeptID $deptID has been deleted successfully.";
    } else {
        echo "Error: Department deletion failed.";
    }
} else {
    echo "DeptID not provided.";
}
?>
