<?php
@include 'config1.php'; // Include your database configuration file

session_start();

// Check for user's session UID
if (!isset($_SESSION['UID'])) {
    echo "Please log in to manage Departments.";
    exit;
}

// Process delete request
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $DeptID = mysqli_real_escape_string($conn, $_POST['DeptID']);

    // Perform additional validation if necessary

    // Delete query
    $deleteQuery = "DELETE FROM coursesection WHERE DeptID = '$DeptID'";
    $deleteResult = mysqli_query($conn, $deleteQuery);

    if ($deleteResult) {
        echo "Course section with DeptID $DeptID deleted successfully.";
        // Redirect or other actions
    } else {
        echo "Error deleting Department: " . mysqli_error($conn);
    }
}
?>
