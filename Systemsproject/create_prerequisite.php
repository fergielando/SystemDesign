<?php
@include 'config1.php';

session_start();

if (!isset($_SESSION['admin_name'])) {
    header('location:login_form1.php');
}

// Fetch courses data for filtering
$query = "SELECT CourseID, CourseName, DeptID FROM course";
$result = mysqli_query($conn, $query);

$courses = [];
while ($row = mysqli_fetch_assoc($result)) {
    $courses[] = $row;
}

// Handle form submission
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $courseID = $_POST['courseID'];
    $prCourseID = $_POST['prCourseID'];
    $minGrade = $_POST['minGrade'];
    $dolu = $_POST['dolu'];

    // Perform database insertion for prerequisites
    $insertQuery = "INSERT INTO courseprerequisite (CourseID, PRcourseID, MinGrade, DOLU)
                    VALUES ('$courseID', '$prCourseID', '$minGrade', '$dolu')";
    if (mysqli_query($conn, $insertQuery)) {
        // Insertion successful, you can redirect or show a success message
        header('location: create_prerequisite.php'); // Redirect to the same page after insertion
    } else {
        // Insertion failed, handle the error
        echo "Error: " . mysqli_error($conn);
    }
}

// Filter courses by DeptID
if (isset($_GET['deptID'])) {
    $filteredDeptID = $_GET['deptID'];
    // Update the query to fetch courses for the specific department
    $deptQuery = "SELECT CourseID, CourseName FROM course WHERE DeptID = '$filteredDeptID'";
    $deptResult = mysqli_query($conn, $deptQuery);

    $filteredCourses = [];
    while ($row = mysqli_fetch_assoc($deptResult)) {
        $filteredCourses[] = $row;
    }
} else {
    $filteredCourses = $courses;
}

?>

<!DOCTYPE html>
<html lang="en">
<head>
  

</head>
<body>
<style>
  body {
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    background-color: #e9ecef;
    color: #212529;
    padding: 10px;
}

.container {
    background-color: #ffffff;
    padding: 20px;
    border-radius: 5px;
    box-shadow: 0 0.5rem 1rem rgba(0, 0, 0, 0.15);
    margin-bottom: 20px;
}

h2 {
    border-bottom: 2px solid #dee2e6;
    padding-bottom: 10px;
    margin-bottom: 20px;
}

form {
    margin-bottom: 30px;
}

label {
    display: block;
    margin-bottom: .5rem;
    color: #495057;
}

input, select {
    display: block;
    width: 100%;
    padding: .375rem .75rem;
    font-size: 1rem;
    line-height: 1.5;
    color: #495057;
    background-color: #fff;
    background-clip: padding-box;
    border: 1px solid #ced4da;
    border-radius: .25rem;
    margin-bottom: 20px;
    transition: border-color .15s ease-in-out, box-shadow .15s ease-in-out;
}

input:focus, select:focus {
    border-color: #80bdff;
    outline: 0;
    box-shadow: 0 0 0 0.2rem rgba(0, 123, 255, .25);
}

button {
    color: #fff;
    background-color: #007bff;
    border-color: #007bff;
    padding: .375rem .75rem;
    border-radius: .25rem;
    font-size: 1rem;
    line-height: 1.5;
    transition: color .15s ease-in-out, background-color .15s ease-in-out, border-color .15s ease-in-out;
}

button:hover {
    color: #fff;
    background-color: #0056b3;
    border-color: #0056b3;
}

.course-filter ul, .course-list ul {
    list-style-type: none;
    padding-left: 0;
}

.course-filter li, .course-list li {
    background-color: #f8f9fa;
    padding: .5rem 1rem;
    margin-bottom: .25rem;
    border: 1px solid #dee2e6;
    border-radius: .25rem;
}

.course-filter li a, .course-list li a {
    text-decoration: none;
    color: #007bff;
    display: block;
}

.course-filter li a:hover, .course-list li a:hover {
    text-decoration: underline;
}

/* Table styles */
table {
    width: 100%;
    border-collapse: collapse;
    margin-top: 1rem;
}

th, td {
    border: 1px solid #dee2e6;
    padding: .75rem;
    text-align: left;
}

th {
    background-color: #f8f9fa;
}

tr:nth-child(even) {
    background-color: #f2f2f2;
}

</style>


       
   <div class="container">
      <h2>Create Course Prerequisite</h2>
      <form method="POST" action="create_prerequisite.php">
         <div>
            <label for="courseID">Course ID:</label>
            <select name="courseID" id="courseID">
               <?php foreach ($courses as $course): ?>
                  <option value="<?php echo htmlspecialchars($course['CourseID']); ?>"><?php echo htmlspecialchars($course['CourseName']); ?></option>
               <?php endforeach; ?>
            </select>
         </div>
         <div>
            <label for="prCourseID">Prerequisite Course ID:</label>
            <input type="text" name="prCourseID" id="prCourseID" required>
         </div>
         <div>
            <label for="minGrade">Minimum Grade:</label>
            <input type="text" name="minGrade" id="minGrade" required>
         </div>
         <div>
            <label for="dolu">DOLU:</label>
            <input type="text" name="dolu" id="dolu" required>
         </div>
         <div>
            <button type="submit">Create Prerequisite</button>
         </div>
      </form>
   </div>
   <div class="container course-filter">
    <h3>Filter Courses by Department</h3>
    <ul>
        <li><a href="create_prerequisite.php">All Departments</a></li>
        <?php
        // Fetch distinct DeptID values from your courses table
        $query = "SELECT DISTINCT DeptID FROM course";
        $result = mysqli_query($conn, $query);

        while ($row = mysqli_fetch_assoc($result)) {
            $deptID = $row['DeptID'];
            echo '<li><a href="create_prerequisite.php?deptID=' . $deptID . '">Department ' . $deptID . '</a></li>';
        }
        ?>
    </ul>
</div>




<div class="course-list">
   <h3>Available Courses</h3>
   <ul>
      <?php foreach ($filteredCourses as $course): ?>
         <li><?php echo htmlspecialchars($course['CourseName']) . " (CourseID: " . htmlspecialchars($course['CourseID']) . ")"; ?></li>
      <?php endforeach; ?>
   </ul>
</div>


   <!-- Add your footer here -->
</body>
</html>
