<?php
@include 'config1.php';

session_start();

if (!isset($_SESSION['admin_name'])) {
    header('location:login_form1.php');
    exit;
}

// Check if the form has been submitted
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Retrieve and sanitize data from the form
    $original_CRN = mysqli_real_escape_string($conn, $_POST['original_CRN']);
    $new_CRN = mysqli_real_escape_string($conn, $_POST['CRN']);
    $courseID = mysqli_real_escape_string($conn, $_POST['courseID']);
    $availableSeats = mysqli_real_escape_string($conn, $_POST['availableSeats']);
    $timeSlotID = mysqli_real_escape_string($conn, $_POST['timeSlotID']);
    $roomID = mysqli_real_escape_string($conn, $_POST['roomID']);
    $facultyID = mysqli_real_escape_string($conn, $_POST['facultyID']); // Assuming you have a faculty ID field

    // Update query
    $updateQuery = "UPDATE coursesection 
                    SET CRN = '$new_CRN', 
                        CourseID = '$courseID', 
                        AvailableSeats = '$availableSeats', 
                        TimeSlotID = '$timeSlotID', 
                        RoomID = '$roomID', 
                        FacultyID = '$facultyID' 
                    WHERE CRN = '$original_CRN'";

    if (mysqli_query($conn, $updateQuery)) {
        echo "Course section updated successfully.";
        // Optionally redirect to another page or show success message
        // header("Location: somepage.php");
    } else {
        echo "Error updating course section: " . mysqli_error($conn);
    }
} else {
    echo "Invalid request.";
}
?>
