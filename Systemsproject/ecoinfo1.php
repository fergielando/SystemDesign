<?php
@include 'config1.php';

// Fetching eco department details
$ecoDeptQuery = "SELECT * FROM dept WHERE DeptID = 'ECO'";
$ecoDeptResult = mysqli_query($conn, $ecoDeptQuery);
$ecoDeptDetails = mysqli_fetch_assoc($ecoDeptResult);

// Fetching eco courses
$ecoCoursesQuery = "SELECT * FROM course WHERE DeptID = 'ECO'";
$ecoCoursesResult = mysqli_query($conn, $ecoCoursesQuery);
$ecoCourses = [];
while ($course = mysqli_fetch_assoc($ecoCoursesResult)) {
    $ecoCourses[] = $course;
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Economics Department - UA University</title>
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
            <h1>Welcome to the Economics Department</h1>
            <a href="student_departments1.php" class="back-button">Back to Departments</a>
        </div>
    </header>

    <main>
    <main>
    <section>
            <h2>Message from the Chair and Manager - David Lee - Chair and Amanda Carter - Manager</h2>
            <p>Welcome to the Economics Department at UA University! Our department is committed to providing a deep understanding of economic theories and practices, equipping our students with the analytical skills needed to excel in the global economic landscape.</p>
            <p>Contact Information for the Chair:</p>
            <ul>
                <li>Email: <a href="mailto:david.lee@UAuni.edu">david.lee@UAuni.edu</a></li>
                <li>Phone: (555) 789-0123</li>
                <li>Office: Room 7C</li>
            </ul>
            <p>Contact Information for the Manager:</p>
            <ul>
                <li>Email: <a href="mailto:AmandaCarter400022@ua.uni">AmandaCarter400022@ua.uni</a></li>
                <li>Phone: (555) 543-7647</li>
                <li>Office: Room 7C</li>
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
                <?php foreach ($ecoCourses as $course): ?>
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
