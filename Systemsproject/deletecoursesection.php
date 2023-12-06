<?php
@include 'config1.php'; // Include your database configuration file

session_start();

// Check for user's session UID
if (!isset($_SESSION['UID'])) {
    echo "Please log in to manage course sections.";
    exit;
}

// Process delete request
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $CRN = mysqli_real_escape_string($conn, $_POST['CRN']);

    // Perform additional validation if necessary

    // Delete query
    $deleteQuery = "DELETE FROM coursesection WHERE CRN = '$CRN'";
    $deleteResult = mysqli_query($conn, $deleteQuery);

    if ($deleteResult) {
        echo "Course section with CRN $CRN deleted successfully.";
        // Redirect or other actions
    } else {
        echo "Error deleting course section: " . mysqli_error($conn);
    }
}
?>
