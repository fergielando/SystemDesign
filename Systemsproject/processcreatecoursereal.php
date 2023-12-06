<?php
@include 'config1.php'; // Include your database configuration file

session_start();

// Check for user's session UID
if (!isset($_SESSION['UID'])) {
    echo "Please log in to create a course.";
    exit;
}

$uid = $_SESSION['UID'];

// Process form submission
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Get input data from the form
    $courseID = mysqli_real_escape_string($conn, $_POST['course_id']);
    $courseName = mysqli_real_escape_string($conn, $_POST['course_name']);
    $deptID = mysqli_real_escape_string($conn, $_POST['dept_id']);
    $credits = mysqli_real_escape_string($conn, $_POST['credits']);
    $description = mysqli_real_escape_string($conn, $_POST['description']);
    $courseType = mysqli_real_escape_string($conn, $_POST['course_type']);

    // Insert data into the course table
    $courseQuery = "INSERT INTO course (CourseID, CourseName, DeptID, Credits, Description, CourseType) 
                    VALUES ('$courseID', '$courseName', '$deptID', '$credits', '$description', '$courseType')";
    $courseResult = mysqli_query($conn, $courseQuery);

    if ($courseResult) {
        // Insert course prerequisites if provided
        if (isset($_POST['prerequisites'])) {
            // Assuming prerequisites are submitted as an array of course IDs
            foreach ($_POST['prerequisites'] as $prerequisite) {
                $prerequisiteID = mysqli_real_escape_string($conn, $prerequisite);

                // Insert into courseprerequisite table
                $prerequisiteQuery = "INSERT INTO courseprerequisite (CourseID, PrerequisiteID) 
                                      VALUES ('$courseID', '$prerequisiteID')";
                $prerequisiteResult = mysqli_query($conn, $prerequisiteQuery);

                if (!$prerequisiteResult) {
                    echo "Error creating course prerequisite for $prerequisiteID: " . mysqli_error($conn);
                    // Decide if you want to continue or exit the loop
                }
            }
        }

        echo "Course created successfully!";
        // Redirect or perform other actions as needed
    } else {
        echo "Error creating course: " . mysqli_error($conn);
    }
}
?>
