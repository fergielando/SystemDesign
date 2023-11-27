<?php
@include 'config1.php';

// Fetching soc depsocment details
$socDeptQuery = "SELECT * FROM dept WHERE DeptID = 'SOC'";
$socDeptResult = mysqli_query($conn, $socDeptQuery);
$socDeptDetails = mysqli_fetch_assoc($socDeptResult);

// Fetching soc courses
$socCoursesQuery = "SELECT * FROM course WHERE DeptID = 'SOC'";
$socCoursesResult = mysqli_query($conn, $socCoursesQuery);
$socCourses = [];
while ($course = mysqli_fetch_assoc($socCoursesResult)) {
    $socCourses[] = $course;
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>soclososoc Department - UA University</title>
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
            <h1>Welcome to the Sociology Department</h1>
            <a href="student_departments1.php" class="back-button">Back to Depsocments</a>
        </div>
    </header>

    <main>
    <main>
    <section>
            <h2>Message from the Chair and Manager - Susan Clark - Chair and Kevin Cooper - Manager</h2>
            <p>Welcome to the Sociology Department at UA University! Our department is dedicated to the study of social behavior, society's structures, and the complex relationships within communities. We provide students with a deep understanding of sociological concepts and research methodologies.</p>
            <p>Contact Information for the Chair:</p>
            <ul>
                <li>Email: <a href="mailto:susan.clark@UAuni.edu">susan.clark@UAuni.edu</a></li>
                <li>Phone: (555) 012-3456</li>
                <li>Office: Room 10C</li>
            </ul>
            <p>Contact Information for the Manager:</p>
            <ul>
                <li>Email: <a href="mailto:KevinCooper400025@ua.uni">KevinCooper400025@ua.uni</a></li>
                <li>Phone: (555) 214-3214</li>
                <li>Office: Room 10C</li>
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
                <?php foreach ($socCourses as $course): ?>
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