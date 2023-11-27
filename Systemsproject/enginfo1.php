<?php
@include 'config1.php';

// Fetching eng depengment details
$engDeptQuery = "SELECT * FROM dept WHERE DeptID = 'ENG'";
$engDeptResult = mysqli_query($conn, $engDeptQuery);
$engDeptDetails = mysqli_fetch_assoc($engDeptResult);

// Fetching eng courses
$engCoursesQuery = "SELECT * FROM course WHERE DeptID = 'ENG'";
$engCoursesResult = mysqli_query($conn, $engCoursesQuery);
$engCourses = [];
while ($course = mysqli_fetch_assoc($engCoursesResult)) {
    $engCourses[] = $course;
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ENG Department - UA University</title>
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
            <h1>Welcome to the English Department</h1>
            <a href="student_departments1.php" class="back-button">Back to Departments</a>
        </div>
    </header>

    <main>
    <main>
    <section>
            <h2>Message from the Chair and Manager - Michael Williams - Chair and Cynthia Green - Manager</h2>
            <p>Welcome to the English Department at UA University! Our department is dedicated to exploring the depth and richness of English literature and language, encouraging critical thinking, and fostering a love for literary studies among our students.</p>
            <p>Contact Information for the Chair:</p>
            <ul>
                <li>Email: <a href="mailto:michael.williams@UAuni.edu">michael.williams@UAuni.edu</a></li>
                <li>Phone: (555) 345-6789</li>
                <li>Office: Room 3C</li>
            </ul>
            <p>Contact Information for the Manager:</p>
            <ul>
                <li>Email: <a href="mailto:CynthiaGreen400018@ua.uni">CynthiaGreen400018@ua.uni</a></li>
                <li>Phone: (555) 583-4324</li>
                <li>Office: Room 3C</li>
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
                <?php foreach ($engCourses as $course): ?>
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