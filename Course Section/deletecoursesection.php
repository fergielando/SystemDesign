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

    // First, check the SemesterID of the course section
    $semesterCheckQuery = "SELECT SemesterID FROM coursesection WHERE CRN = '$CRN'";
    $semesterResult = mysqli_query($conn, $semesterCheckQuery);
    $semesterRow = mysqli_fetch_assoc($semesterResult);

    if ($semesterRow['SemesterID'] == 0) {
        echo "Cannot delete course section with CRN $CRN.";
        exit;
    }

    // Check for enrolled students
    $enrollmentCheckQuery = "SELECT COUNT(*) as enrolledCount FROM Enrollment WHERE CRN = '$CRN'";
    $enrollmentResult = mysqli_query($conn, $enrollmentCheckQuery);
    $enrollmentRow = mysqli_fetch_assoc($enrollmentResult);

    if ($enrollmentRow['enrolledCount'] > 0) {
        echo "Cannot delete course section with CRN $CRN as there are students currently enrolled.";
        exit;
    }

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
