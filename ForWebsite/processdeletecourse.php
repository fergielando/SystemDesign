<?php
@include 'config1.php'; // Include your database configuration file

session_start();

// Check if the user is logged in
if (!isset($_SESSION['UID'])) {
    echo "Please log in to continue.";
    exit;
}

// Check if the course_id is set in the POST request
if (isset($_POST['course_id'])) {
    $course_id = $_POST['course_id'];

    // Create a prepared statement
    if ($stmt = $conn->prepare("DELETE FROM course WHERE CourseID = ?")) {
        
        // Bind the course_id parameter, 's' specifies the type: 'string'
        $stmt->bind_param("s", $course_id);

        // Execute the query
        $stmt->execute();

        // Check if the course was successfully deleted
        if ($stmt->affected_rows > 0) {
            echo "Course successfully deleted.";
        } else {
            echo "No course found with the given ID, or deletion failed.";
        }

        // Close statement
        $stmt->close();
    } else {
        echo "Error preparing statement: " . $conn->error;
    }
} else {
    echo "Course ID not provided.";
}

// Close connection
$conn->close();
?>
