<?php
@include 'config1.php';

// Fetching MIS department details
$misDeptQuery = "SELECT * FROM dept WHERE DeptID = 'MIS'";
$misDeptResult = mysqli_query($conn, $misDeptQuery);
$misDeptDetails = mysqli_fetch_assoc($misDeptResult);

// Fetching MIS courses
$misCoursesQuery = "SELECT * FROM course WHERE DeptID = 'MIS'";
$misCoursesResult = mysqli_query($conn, $misCoursesQuery);
$misCourses = [];
while ($course = mysqli_fetch_assoc($misCoursesResult)) {
    $misCourses[] = $course;
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MIS Department - UA University</title>
    <style>
        body {
            font-family: Arial, sans-serif;
        }
        table {
            width: 100%;
            border-collapse: collapse;
        }
        table, th, td {
            border: 1px solid black;
        }
        th, td {
            padding: 8px;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
        }
    </style>
</head>
<body>
    <header>
        <div class="header">
            <h1>Welcome to the MIS Department</h1>
            <a href="student_departments1.php" class="back-button">Back to Departments</a>
        </div>
    </header>

    <main>
    <main>
        <section>
            <h2>Message from the Chair and Manager - Bryan Don - Chair and Joseph Adams - Manager</h2>
            <p>Welcome to the MIS Department at UA University! Our department is dedicated to exploring the dynamic and growing field of information systems, and providing a comprehensive education that prepares our students for the challenges of the modern technological landscape.</p>
            <p>Contact Information:</p>
            <ul>
                <li>Email: <a href="mailto:john.smith@UAuni.edu">john.smith@UAuni.edu</a></li>
                <li>Phone: (555) 123-4567</li>
                <li>Office: Room 1C</li>
            </ul>
            <ul>
                <li>Email: <a href="mailto:JosephAdams400019@ua.uni">JosephAdams400019@ua.uni</a></li>
                <li>Phone: (555) 347- 8790</li>
                <li>Office: Room 4C</li>
            </ul>
        </section>
        <section>
            <h2>Course Offerings</h2>
            <table>
                <tr>
                    <th>Course ID</th>
                    <th>Course Name</th>
                    <th>Description</th>
                </tr>
                <?php foreach ($misCourses as $course): ?>
                <tr>
                    <td><?php echo $course['CourseID']; ?></td>
                    <td><?php echo $course['CourseName']; ?></td>
                    <td><?php echo $course['Description']; ?></td>
                </tr>
                <?php endforeach; ?>
            </table>
        </section>
    </main>

    <footer>
        <!-- Footer content can be added here -->
    </footer>
</body>
</html>
