<?php
@include 'config1.php';

session_start();

if (!isset($_SESSION['admin_name'])) {
    header('location:login_form1.php');
}

// Fetch courses data
$query = "SELECT CourseID, CourseName, DeptID, Credits, Description, CourseType FROM course";
$result = mysqli_query($conn, $query);

$courses = [];
while ($row = mysqli_fetch_assoc($result)) {
    $courses[] = $row;
}

// Fetch distinct department IDs for the filter
$query = "SELECT DISTINCT course.deptID FROM course";
$result = mysqli_query($conn, $query);

$departmentIDs = [];
while ($row = mysqli_fetch_assoc($result)) {
    $departmentIDs[] = $row['deptID'];
}

// Fetch distinct credits for the filter
$query = "SELECT DISTINCT course.Credits FROM course";
$result = mysqli_query($conn, $query);

$credit = [];
while ($row = mysqli_fetch_assoc($result)) {
    $credit[] = $row['Credits'];
}

// Fetch distinct course type for the filter
$query = "SELECT DISTINCT course.CourseType FROM course";
$result = mysqli_query($conn, $query);

$coursetype = [];
while ($row = mysqli_fetch_assoc($result)) {
    $coursetype[] = $row['CourseType'];
}

?>


<!DOCTYPE html>
<html lang="en">
<head>
   <meta charset="UTF-8">
   <meta http-equiv="X-UA-Compatible" content="IE-edge">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <title>Course List</title>
   <link rel="stylesheet" href="css/fatman1.css">

   
   <div class="header">
      <img src="ua.png" alt="U.A. Logo" class="logo">
      <h1>U.A. University Admin Page</h1>
      <div class="buttons">
         <a href="createcoursereal.php" class="btn">Create Course</a>
         <a href="deletecourse.php" class="btn">Delete Course</a>
         <a href="create_prerequisite.php" class="btn">Create Course Prerequisite</a>
      <a href="admin_page1.php" class="btn">Back to Admin Page</a>
      </div>
   </div>


<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f4f4f4;
        margin: 0;
        padding: 0;
    }
    /* Header styles */
.header {
    background: #000;
    color: #fff;
    padding: 20px;
    text-align: center;
}

.header h1 {
    font-size: 36px;
    margin: 0;
}

.logo {
    width: 50px;
    height: 50px;
}

.buttons {
    display: flex;
    justify-content: center;
    margin-top: 20px;
}

.container {
    max-width: 1200px;
    margin: 0 auto;
    padding: 20px;
}

.update-btn {
    background-color: #4CAF50; /* Green */
    color: white;
    padding: 6px 12px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 14px;
    margin: 4px 2px;
    cursor: pointer;
    border-radius: 4px;
}


    
    table {
        width: 100%;
        margin: 20px 0;
        border-collapse: collapse;
    }
    table, th, td {
        border: 1px solid #ddd;
    }
    th, td {
        padding: 8px;
        text-align: left;
    }
    th {
        background-color: #f2f2f2;
    }
    tr:nth-child(even) {
        background-color: #f9f9f9;
    }
    tr:hover {
        background-color: #e9e9e9;
    }
</style>

</head>
<body>

<div class="header">
    <h1>Course Management</h1>
</div>

   <div class="search-container">
      <input type="text" id="searchInput" placeholder="Search...">
      <button onclick="searchTable()">Search</button>
      <button onclick="resetTable()">Reset</button>
   </div>
   
   <!-- Filter container for Department -->
   <div class="filter-container">
   <label for="deptFilter">Department:</label>
   <select id="deptFilter" onchange="filterTable('deptFilter', 'Department ID')">
      <option value="">All</option>
      <?php foreach ($departmentIDs as $deptID): ?>
         <option value="<?php echo $deptID; ?>"><?php echo $deptID; ?></option>
      <?php endforeach; ?>
   </select>
</div>

   <!-- Filter container for Credits -->
   <div class="filter-container">
   <label for="creditsFilter">Credits:</label>
   <select id="creditsFilter" onchange="filterTable('creditsFilter', 'Credits')">
      <option value="">All</option>
      <?php foreach ($credit as $Credits): ?>
         <option value="<?php echo $Credits; ?>"><?php echo $Credits; ?></option>
      <?php endforeach; ?>
   </select>
</div>

   <!-- Filter container for Course Type -->
   <div class="filter-container">
   <label for="coursetypeFilter">Course Type:</label>
   <select id="coursetypeFilter" onchange="filterTable('coursetypeFilter', 'CourseType')">
      <option value="">All</option>
      <?php foreach ($coursetype as $CourseType): ?>
         <option value="<?php echo $CourseType; ?>"><?php echo $CourseType; ?></option>
      <?php endforeach; ?>
   </select>
</div>

<div class="container">
    <table>
    <thead>
    <tr>
        <th>Course ID</th>
        <th>Course Name</th>
        <th>Department ID</th>
        <th>Credits</th>
        <th>Description</th>
        <th>Course Type</th>
        <th>Actions</th> <!-- New column for actions -->
    </tr>
</thead>
<tbody>
    <?php foreach ($courses as $course): ?>
        <tr>
            <td><?php echo htmlspecialchars($course['CourseID']); ?></td>
            <td><?php echo htmlspecialchars($course['CourseName']); ?></td>
            <td><?php echo htmlspecialchars($course['DeptID']); ?></td>
            <td><?php echo htmlspecialchars($course['Credits']); ?></td>
            <td><?php echo htmlspecialchars($course['Description']); ?></td>
            <td><?php echo htmlspecialchars($course['CourseType']); ?></td>
            <td>
                <!-- Update button -->
                <a href="update_course.php?id=<?php echo $course['CourseID']; ?>" class="update-btn">Update</a>
            </td>
        </tr>
    <?php endforeach; ?>
</tbody>

</div>

</body>
</html>