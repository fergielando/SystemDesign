<?php
@include 'config1.php';

// Check if the course ID is set in the query string
if (isset($_GET['id'])) {
    $course_id = $_GET['id'];

    // Fetch course details from the database
    $query = "SELECT * FROM course WHERE CourseID = '$course_id'";
    $result = mysqli_query($conn, $query);

    if ($result && mysqli_num_rows($result) > 0) {
        $course = mysqli_fetch_assoc($result);
    } else {
        die("Course not found.");
    }
} else {
    die("Invalid request.");
}

// Handle form submission to update course details
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $course_name = $_POST['course_name'];
    $dept_id = $_POST['dept_id'];
    $credits = $_POST['credits'];
    $description = $_POST['description'];
    $course_type = $_POST['course_type'];

    // Update query
    $update_query = "UPDATE course SET CourseName='$course_name', DeptID='$dept_id', Credits='$credits', Description='$description', CourseType='$course_type' WHERE CourseID='$course_id'";
    
    if (mysqli_query($conn, $update_query)) {
        echo "<p>Course updated successfully. You will be redirected in 5 seconds...</p>";
        // JavaScript for redirecting after 5 seconds
        echo "<script>
                setTimeout(function(){
                    window.location.href = 'course_catalog1.php'; // Replace with your desired redirect location
                }, 5000);
              </script>";
    } else {
        echo "Error updating course: " . mysqli_error($conn);
    }
}    
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Update Course</title>
    <!-- Add your CSS styles here -->
</head>
<body>
    <h2>Update Course</h2>
    <form method="post" action="">
        <label for="course_name">Course Name:</label>
        <input type="text" name="course_name" id="course_name" value="<?php echo $course['CourseName']; ?>"><br>

        <label for="dept_id">Department ID:</label>
        <input type="text" name="dept_id" id="dept_id" value="<?php echo $course['DeptID']; ?>"><br>

        <label for="credits">Credits:</label>
        <input type="number" name="credits" id="credits" value="<?php echo $course['Credits']; ?>"><br>

        <label for="description">Description:</label>
        <textarea name="description" id="description"><?php echo $course['Description']; ?></textarea><br>

        <label for="course_type">Course Type:</label>
        <input type="text" name="course_type" id="course_type" value="<?php echo $course['CourseType']; ?>"><br>

        <input type="submit" value="Update Course">
    </form>
</body>
</html>
