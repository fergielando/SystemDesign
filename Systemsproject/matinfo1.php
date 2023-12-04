<?php
@include 'config1.php';

// Fetching mat depmatment details
$matDeptQuery = "SELECT * FROM dept WHERE DeptID = 'MAT'";
$matDeptResult = mysqli_query($conn, $matDeptQuery);
$matDeptDetails = mysqli_fetch_assoc($matDeptResult);

// Fetching mat courses
$matCoursesQuery = "SELECT * FROM course WHERE DeptID = 'MAT'";
$matCoursesResult = mysqli_query($conn, $matCoursesQuery);
$matCourses = [];
while ($course = mysqli_fetch_assoc($matCoursesResult)) {
    $matCourses[] = $course;
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Math Department - UA University</title>
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
            <h1>Welcome to the Math Depmatment</h1>
            <button class="back-button" onclick="goBack()">Back</button>
        </div>
    </header>

    <main>
    <main>
    <section>
            <h2>Message from the Chair and Manager - Jennifer Hall - Chair and Thomas Turner - Manager</h2>
            <p>Welcome to the Mathematics Department at UA University! Our department is committed to excellence in mathematical education and research, offering a rigorous curriculum and fostering a dynamic environment for exploring the vast world of mathematics.</p>
            <p>Contact Information for the Chair:</p>
            <ul>
                <li>Email: <a href="mailto:jennifer.hall@UAuni.edu">jennifer.hall@UAuni.edu</a></li>
                <li>Phone: (555) 890-1234</li>
                <li>Office: Room 8C</li>
            </ul>
            <p>Contact Information for the Manager:</p>
            <ul>
                <li>Email: <a href="mailto:ThomasTurner400023@ua.uni">ThomasTurner400023@ua.uni</a></li>
                <li>Phone: (555) 546-1203</li>
                <li>Office: Room 8C</li>
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
                <?php foreach ($matCourses as $course): ?>
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