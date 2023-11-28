<?php
@include 'config1.php';

// Fetching bus department details
$busDeptQuery = "SELECT * FROM dept WHERE DeptID = 'BUS'";
$busDeptResult = mysqli_query($conn, $busDeptQuery);
$busDeptDetails = mysqli_fetch_assoc($busDeptResult);

// Fetching bus courses
$busCoursesQuery = "SELECT * FROM course WHERE DeptID = 'BUS'";
$busCoursesResult = mysqli_query($conn, $busCoursesQuery);
$busCourses = [];
while ($course = mysqli_fetch_assoc($busCoursesResult)) {
    $busCourses[] = $course;
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Business Department - UA University</title>
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
            <h1>Welcome to the Business Department</h1>
            <button class="back-button" onclick="goBack()">Back</button>
        </div>
    </header>

    <main>
    <main>
    <section>
            <h2>Message from the Chair and Manager - Olivia Lewis - Chair and Karen Turner - Manager</h2>
            <p>Welcome to the Business Department at UA University! Our department is committed to offering a comprehensive education in business theories and practices, preparing our students for success in the dynamic world of business and entrepreneurship.</p>
            <p>Contact Information for the Chair:</p>
            <ul>
                <li>Email: <a href="mailto:olivia.lewis@UAuni.edu">olivia.lewis@UAuni.edu</a></li>
                <li>Phone: (555) 567-8901</li>
                <li>Office: Room 15C</li>
            </ul>
            <p>Contact Information for the Manager:</p>
            <ul>
                <li>Email: <a href="mailto:KarenTurner400016@ua.uni">KarenTurner400016@ua.uni</a></li>
                <li>Phone: (555) 452-5637</li>
                <li>Office: Room 15C</li>
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
                <?php foreach ($busCourses as $course): ?>
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
