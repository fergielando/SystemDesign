
<?php
@include 'config1.php'; // Include your database configuration file

session_start();

// Check for user's session UID
if (!isset($_SESSION['UID'])) {
    echo "Please log in to assign courses.";
    exit;
}

$uid = $_SESSION['UID'];

// Fetch available courses with additional details, ordered by CRN
$query = "SELECT
    coursesection.CRN,
    coursesection.CourseID,
    coursesection.SectionNum,
    timeslot.TimeSlotID,
    day.Weekday,
    course.CourseName,
    course.Description,
    room.RoomNum,
    building.BuildingName,
    periodd.StartTime,
    periodd.EndTime,
    coursesection.AvailableSeats,
    CONCAT(user.FirstName, ' ', user.LastName) AS FacultyName,
    course.DeptID AS DepartmentID
FROM coursesection
JOIN timeslot ON coursesection.TimeSlotID = timeslot.TimeSlotID
JOIN day ON timeslot.DayID = day.DayID
JOIN periodd ON timeslot.PeriodID = periodd.PeriodID
JOIN room ON coursesection.RoomID = room.RoomID
JOIN building ON room.BuildingID = building.BuildingID
JOIN course ON coursesection.CourseID = course.CourseID
JOIN user ON coursesection.FacultyID = user.UID
ORDER BY coursesection.CRN ASC";


$result = mysqli_query($conn, $query);

$courses = [];
while ($row = mysqli_fetch_assoc($result)) {
    $courses[] = $row;
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
         <a href="create_course1.php" class="btn">Create Course</a>
         <a href="dropcourse.php" class="btn">Drop Course</a>
         <a href="#" class="btn">Update Course</a>
      <a href="admin_page1.php" class="back-button">Back to Admin Page</a>
      </div>
   </div>


   <style>
 body {
    margin: 0;
    padding: 0;
    font-family: Arial, sans-serif;
}

/* Overall page style */
body {
    background-color: #f0f0f0;
    font-size: 16px;
}

.container {
    max-width: 1200px;
    margin: 0 auto;
    padding: 20px;
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

.buttons a {
    margin: 0 10px;
    background: #333;
    color: #fff;
    padding: 10px 20px;
    text-decoration: none;
    border-radius: 5px;
}

.buttons a:hover {
    background: #000;
}

.back-button {
    margin-top: 20px;
    display: inline-block;
    text-decoration: none;
    color: #333;
    font-weight: bold;
}

/* Course List Table styles */
table {
    width: 100%;
    border-collapse: collapse;
    background-color: #fff;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
}

th, td {
    padding: 12px 15px;
    text-align: left;
    border-bottom: 1px solid #ddd;
}

th {
    background-color: #333;
    color: #fff;
    border-top: 2px solid #000; /* Add top border to header */
}

tr:nth-child(even) {
    background-color: #f2f2f2;
}

/* Add some spacing to the top heading */
h1 {
    margin-top: 20px;
}

/* Add lines to separate rows and columns */
table tbody tr td {
    border-right: 1px solid #ddd;
}

table tbody tr:last-child td {
    border-bottom: none;
}

/* Add a little bit of color for better separation */
table tbody tr:hover {
    background-color: #f5f5f5;
}

   </style>
</head>





<body>
   <h1>Course List</h1>

   <table>
   <thead>
    <tr>
        <th>CRN</th>
        <th>Course Name</th>
        <th>Section</th>
        <th>Day</th>
        <th>Building</th>
        <th>Room</th>
        <th>Time</th>
        <th>Available Seats</th>
        <th>Faculty Name</th>
        <th>Department ID</th> <!-- Change the header to Department ID -->
        <th>Description</th>
        <th>Delete</th>
        <th>Update</th>

    </tr>
</thead>

<tbody>
    <?php foreach ($courses as $course): ?>
        <tr>
            <td><?php echo $course['CRN']; ?></td>
            <td><?php echo $course['CourseName']; ?></td>
            <td><?php echo $course['SectionNum']; ?></td>
            <td><?php echo $course['Weekday']; ?></td>
            <td><?php echo $course['BuildingName']; ?></td>
            <td><?php echo $course['RoomNum']; ?></td>
            <td><?php echo $course['StartTime'] . " to " . $course['EndTime']; ?></td>
            <td><?php echo $course['AvailableSeats']; ?></td>
            <td><?php echo $course['FacultyName']; ?></td>
            <td><?php echo $course['DepartmentID']; ?></td>
            <td><?php echo $course['Description']; ?></td>
            <td><a href='delete_course.php?CRN=<?php echo $course['CRN']; ?>' onclick="return confirm('Are you sure you want to delete this course?')">Delete</a></td>
            <td><a href='update_course.php?CRN=<?php echo $course['CRN']; ?>'>Update</a></td>


        </tr>
    <?php endforeach; ?>
</tbody>
</html>
