<?php
@include 'config1.php'; 

session_start();


if (!isset($_SESSION['UID'])) {
    echo "Please log in to manage course sections.";
    exit;
}


if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $CRN = mysqli_real_escape_string($conn, $_POST['CRN']);

    
    $semesterCheckQuery = "SELECT SemesterID FROM coursesection WHERE CRN = '$CRN'";
    $semesterResult = mysqli_query($conn, $semesterCheckQuery);
    $semesterRow = mysqli_fetch_assoc($semesterResult);

    if ($semesterRow['SemesterID'] == 0) {
        echo "Cannot delete course section with CRN $CRN.";
        exit;
    }

    
    $enrollmentCheckQuery = "SELECT COUNT(*) as enrolledCount FROM Enrollment WHERE CRN = '$CRN'";
    $enrollmentResult = mysqli_query($conn, $enrollmentCheckQuery);
    $enrollmentRow = mysqli_fetch_assoc($enrollmentResult);

    if ($enrollmentRow['enrolledCount'] > 0) {
        echo "Cannot delete course section with CRN $CRN as there are students currently enrolled.";
        exit;
    }

    

    
    $deleteQuery = "DELETE FROM coursesection WHERE CRN = '$CRN'";
    $deleteResult = mysqli_query($conn, $deleteQuery);

    if ($deleteResult) {
        echo "Course section with CRN $CRN deleted successfully.";
        
    } else {
        echo "Error deleting course section: " . mysqli_error($conn);
    }
}
?>
