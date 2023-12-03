<?php
@include 'config1.php';

// Fetching che department details
$cheDeptQuery = "SELECT * FROM dept WHERE DeptID = 'CHE'";
$cheDeptResult = mysqli_query($conn, $cheDeptQuery);
$cheDeptDetails = mysqli_fetch_assoc($cheDeptResult);

// Fetching che courses
$cheCoursesQuery = "SELECT * FROM course WHERE DeptID = 'CHE'";
$cheCoursesResult = mysqli_query($conn, $cheCoursesQuery);
$cheCourses = [];
while ($course = mysqli_fetch_assoc($cheCoursesResult)) {
    $cheCourses[] = $course;
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>cheiness Department - UA University</title>
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
            <h1>Welcome to the Chemistry Department</h1>
            <button class="back-button" onclick="goBack()">Back</button>
        </div>
    </header>

    <main>
    <main>
    <section>
            <h2>Message from the Chair and Manager - William White - Chair and Jessica Ward - Manager</h2>
            <p>Welcome to the Chemistry Department at UA University! Our department is dedicated to advancing the understanding of chemical sciences through innovative research and comprehensive teaching, preparing our students to become leaders in scientific discovery and application.</p>
            <p>Contact Information for the Chair:</p>
            <ul>
                <li>Email: <a href="mailto:william.white@UAuni.edu">william.white@UAuni.edu</a></li>
                <li>Phone: (555) 901-2345</li>
                <li>Office: Room 9C</li>
            </ul>
            <p>Contact Information for the Manager:</p>
            <ul>
                <li>Email: <a href="mailto:JessicaWard400024@ua.uni">JessicaWard400024@ua.uni</a></li>
                <li>Phone: (555) 098-3132</li>
                <li>Office: Room 9C</li>
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
                <?php foreach ($cheCourses as $course): ?>
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
    <script>
    function goBack() {
        window.history.back();
    }
</script>
    </footer>
</body>
</html>
