<?php
@include 'config1.php';

// Fetching phy depphyment details
$phyDeptQuery = "SELECT * FROM dept WHERE DeptID = 'PHY'";
$phyDeptResult = mysqli_query($conn, $phyDeptQuery);
$phyDeptDetails = mysqli_fetch_assoc($phyDeptResult);

// Fetching phy courses
$phyCoursesQuery = "SELECT * FROM course WHERE DeptID = 'PHY'";
$phyCoursesResult = mysqli_query($conn, $phyCoursesQuery);
$phyCourses = [];
while ($course = mysqli_fetch_assoc($phyCoursesResult)) {
    $phyCourses[] = $course;
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>phylosophy Department - UA University</title>
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
            <h1>Welcome to the physics Department</h1>
            <button class="back-button" onclick="goBack()">Back</button>
        </div>
    </header>

    <main>
    <main>
    <section>
            <h2>Message from the Chair and Manager - James Harris - Chair and Laura Harris - Manager</h2>
            <p>Welcome to the Physics Department at UA University! Our department is dedicated to the study of the fundamental laws of nature, fostering a deep understanding of the physical world through rigorous coursework, innovative research, and collaborative learning.</p>
            <p>Contact Information for the Chair:</p>
            <ul>
                <li>Email: <a href="mailto:james.harris@UAuni.edu">james.harris@UAuni.edu</a></li>
                <li>Phone: (555) 123-4567</li>
                <li>Office: Room 11C</li>
            </ul>
            <p>Contact Information for the Manager:</p>
            <ul>
                <li>Email: <a href="mailto:LauraHarris400026@ua.uni">LauraHarris400026@ua.uni</a></li>
                <li>Phone: (555) 413-5134</li>
                <li>Office: Room 11C</li>
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
                <?php foreach ($phyCourses as $course): ?>
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