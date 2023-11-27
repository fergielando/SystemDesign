<?php
@include 'config1.php';

// Fetching phi depphiment details
$phiDeptQuery = "SELECT * FROM dept WHERE DeptID = 'PHI'";
$phiDeptResult = mysqli_query($conn, $phiDeptQuery);
$phiDeptDetails = mysqli_fetch_assoc($phiDeptResult);

// Fetching phi courses
$phiCoursesQuery = "SELECT * FROM course WHERE DeptID = 'PHI'";
$phiCoursesResult = mysqli_query($conn, $phiCoursesQuery);
$phiCourses = [];
while ($course = mysqli_fetch_assoc($phiCoursesResult)) {
    $phiCourses[] = $course;
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Philosophy Department - UA University</title>
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
            <h1>Welcome to the Philosophy Depphiment</h1>
            <a href="student_departments1.php" class="back-button">Back to Depphiments</a>
        </div>
    </header>

    <main>
    <main>
    <section>
            <h2>Message from the Chair and Manager - Patricia Scott - Chair and Andrew Lewis - Manager</h2>
            <p>Welcome to the Philosophy Department at UA University! Our department is dedicated to exploring the fundamental questions of existence, ethics, and knowledge. Join us in our pursuit of understanding the complexities of philosophical thought and its application in the modern world.</p>
            <p>Contact Information for the Chair:</p>
            <ul>
                <li>Email: <a href="mailto:patricia.scott@UAuni.edu">patricia.scott@UAuni.edu</a></li>
                <li>Phone: (555) 456-7890</li>
                <li>Office: Room 14C</li>
            </ul>
            <p>Contact Information for the Manager:</p>
            <ul>
                <li>Email: <a href="mailto:AndrewLewis400029@ua.uni">AndrewLewis400029@ua.uni</a></li>
                <li>Phone: (555) 901-7481</li>
                <li>Office: Room 14C</li>
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
                <?php foreach ($phiCourses as $course): ?>
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