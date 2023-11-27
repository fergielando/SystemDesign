<?php
@include 'config1.php';

// Fetching art department details
$artDeptQuery = "SELECT * FROM dept WHERE DeptID = 'Art'";
$artDeptResult = mysqli_query($conn, $artDeptQuery);
$artDeptDetails = mysqli_fetch_assoc($artDeptResult);

// Fetching art courses
$artCoursesQuery = "SELECT * FROM course WHERE DeptID = 'Art'";
$artCoursesResult = mysqli_query($conn, $artCoursesQuery);
$artCourses = [];
while ($course = mysqli_fetch_assoc($artCoursesResult)) {
    $artCourses[] = $course;
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
            <h1>Welcome to the Art Department</h1>
            <a href="student_departments1.php" class="back-button">Back to Departments</a>
        </div>
    </header>

    <main>
    <main>
    <section>
            <h2>Message from the Chair and Manager - Linda Young - Chair and Samuel Parker - Manager</h2>
            <p>Welcome to the Art Department at UA University! Our department fosters creativity and critical thinking in the visual arts, and is committed to excellence in nurturing and challenging the artistic skills of our students.</p>
            <p>Contact Information for the Chair:</p>
            <ul>
                <li>Email: <a href="mailto:linda.young@UAuni.edu">linda.young@UAuni.edu</a></li>
                <li>Phone: (555) 234-5678</li>
                <li>Office: Room 12C</li>
            </ul>
            <p>Contact Information for the Manager:</p>
            <ul>
                <li>Email: <a href="mailto:SamuelParker400027@ua.uni">SamuelParker400027@ua.uni</a></li>
                <li>Phone: (555) 123-4134</li>
                <li>Office: Room 12C</li>
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
                <?php foreach ($artCourses as $course): ?>
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
