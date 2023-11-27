<?php
@include 'config1.php';

// Fetching psy deppsyment details
$psyDeptQuery = "SELECT * FROM dept WHERE DeptID = 'psy'";
$psyDeptResult = mysqli_query($conn, $psyDeptQuery);
$psyDeptDetails = mysqli_fetch_assoc($psyDeptResult);

// Fetching psy courses
$psyCoursesQuery = "SELECT * FROM course WHERE DeptID = 'psy'";
$psyCoursesResult = mysqli_query($conn, $psyCoursesQuery);
$psyCourses = [];
while ($course = mysqli_fetch_assoc($psyCoursesResult)) {
    $psyCourses[] = $course;
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>psylosopsy Department - UA University</title>
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
            <h1>Welcome to the Psychology Department</h1>
            <a href="student_departments1.php" class="back-button">Back to Deppsyments</a>
        </div>
    </header>

    <main>
    <main>
    <section>
            <h2>Message from the Chair and Manager - Maria Davis - Chair and Charles Mitchell - Manager</h2>
            <p>Welcome to the Psychology Department at UA University! Our department is focused on exploring the complexities of human behavior and mental processes, offering students a rich and diverse understanding of psychological theories and practices.</p>
            <p>Contact Information for the Chair:</p>
            <ul>
                <li>Email: <a href="mailto:maria.davis@UAuni.edu">maria.davis@UAuni.edu</a></li>
                <li>Phone: (555) 678-9012</li>
                <li>Office: Room 6C</li>
            </ul>
            <p>Contact Information for the Manager:</p>
            <ul>
                <li>Email: <a href="mailto:CharlesMitchell400021@ua.uni">CharlesMitchell400021@ua.uni</a></li>
                <li>Phone: (555) 323-4243</li>
                <li>Office: Room 6C</li>
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
                <?php foreach ($psyCourses as $course): ?>
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