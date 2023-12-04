<?php
@include 'config1.php'; // Include your database configuration file

session_start();

// Check for user's session UID
if (!isset($_SESSION['UID'])) {
    echo "Please log in to update courses.";
    exit;
}

$uid = $_SESSION['UID'];

// Check if CRN is provided via GET request
if (isset($_GET['CRN'])) {
    $crn = $_GET['CRN'];

    // Retrieve course details for the specified CRN
    $selectQuery = "SELECT * FROM coursesection WHERE CRN = $crn"; // Adjust the query to select the appropriate columns
    $selectResult = mysqli_query($conn, $selectQuery);

    if ($selectResult && $course = mysqli_fetch_assoc($selectResult)) {
        // Display a form to edit the course details
        // You can create a form with input fields to update the course information
        // Populate the input fields with the existing course details from $course array

        // Define variables for each field with default values in case they are undefined
        $courseName = isset($course['CourseName']) ? $course['CourseName'] : '';
        $sectionNum = isset($course['SectionNum']) ? $course['SectionNum'] : '';
        // Add more fields as needed

        // ...
    } else {
        echo "Course not found.";
    }
} else {
    echo "CRN not provided.";
}

// Handle form submissions to update the course details
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Retrieve updated course details from the form
    $updatedCourseName = isset($_POST['courseName']) ? $_POST['courseName'] : '';
    $updatedSectionNum = isset($_POST['sectionNum']) ? $_POST['sectionNum'] : '';
    // Add more fields as needed

    // Perform the database update query
    $updateQuery = "UPDATE coursesection SET CourseName = '$updatedCourseName', SectionNum = '$updatedSectionNum' WHERE CRN = $crn";
    $updateResult = mysqli_query($conn, $updateQuery);

    if ($updateResult) {
        echo "Course with CRN $crn has been updated successfully.";
    } else {
        echo "Error: Course update failed.";
    }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
   <meta charset="UTF-8">
   <meta http-equiv="X-UA-Compatible" content="IE-edge">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <title>Update Course</title>
   <link rel="stylesheet" href="css/fatman1.css">
</head>
<body>
   <h1>Update Course</h1>

   <!-- Display a form to edit the course details -->
   <form method="POST">
       <label for="courseName">Course Name:</label>
       <input type="text" id="courseName" name="courseName" value="<?php echo $courseName; ?>" required>
       
       <label for="sectionNum">Section:</label>
       <input type="text" id="sectionNum" name="sectionNum" value="<?php echo $sectionNum; ?>" required>
       
       <!-- Add more input fields for other course attributes as needed -->
       
       <input type="submit" value="Update Course">
   </form>
</body>
</html>
