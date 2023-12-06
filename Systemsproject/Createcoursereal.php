<?php
@include 'config1.php'; // Include your database configuration file

session_start();

// Check for user's session UID
if (!isset($_SESSION['UID'])) {
    echo "Please log in to assign courses.";
    exit;
}

$uid = $_SESSION['UID'];
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE-edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Create Course</title>
    <style>
     body {
  font-family: Arial, sans-serif;
  background-color: #f4f4f4;
  margin: 0;
  padding: 20px;
}

h1 {
  color: #333;
}

form {
  background: #fff;
  padding: 20px;
  border-radius: 8px;
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
  max-width: 500px;
  margin: 20px auto;
}

label {
  display: block;
  margin-top: 10px;
  color: #666;
}

input[type="text"],
textarea,
select {
  width: 100%;
  padding: 10px;
  margin-top: 5px;
  border: 1px solid #ddd;
  border-radius: 4px;
  box-sizing: border-box; /* Makes sure padding doesn't affect overall width */
  display: block;
}

textarea {
  height: 100px;
}

input[type="submit"] {
  background-color: #5cb85c;
  color: white;
  padding: 10px 20px;
  border: none;
  border-radius: 4px;
  cursor: pointer;
  margin-top: 20px;
}

input[type="submit"]:hover {
  background-color: #4cae4c;
}
        </style>
</head>
<body>
    <h1>Create Course</h1>
    <form action="processcreatecoursereal.php" method="POST">
        <!-- Input field for course ID -->
        <label for="course_id">Course ID:</label>
        <input type="text" id="course_id" name="course_id" required><br>

        <!-- Input field for course name -->
        <label for="course_name">Course Name:</label>
        <input type="text" id="course_name" name="course_name" required><br>

        <!-- Dropdown list for department ID -->
        <label for="dept_id">Department ID:</label>
        <select id="dept_id" name="dept_id" required>
            <?php
            // Include your database configuration file
            @include 'config1.php';

            // Fetch existing department IDs from the database
            $deptQuery = "SELECT DeptID FROM dept";
            $deptResult = mysqli_query($conn, $deptQuery);

            if ($deptResult && mysqli_num_rows($deptResult) > 0) {
                while ($deptRow = mysqli_fetch_assoc($deptResult)) {
                    $deptID = $deptRow['DeptID'];
                    echo "<option value='$deptID'>$deptID</option>";
                }
            }
            ?>
        </select><br>

        <!-- Input field for course credits -->
        <label for="credits">Credits:</label>
        <input type="text" id="credits" name="credits" required><br>

        <!-- Input field for course description -->
        <label for="description">Description:</label>
        <textarea id="description" name="description" required></textarea><br>

        <!-- Input field for course type -->
        <label for="course_type">Course Type:</label>
        <input type="text" id="course_type" name="course_type" required><br>

        <!-- Input fields for course prerequisites -->
<label for="pr_course_id">Prerequisite Course ID:</label>
<input type="text" id="pr_course_id" name="pr_course_id"><br>

<label for="min_grade">Minimum Grade:</label>
<input type="text" id="min_grade" name="min_grade"><br>

<label for="dolu">DOLU:</label>
<input type="text" id="dolu" name="dolu"><br>
   <!-- Submit button -->
   <input type="submit" value="Create Course">
        </form>
</body>
</html>
