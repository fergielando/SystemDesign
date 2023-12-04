<?php
@include 'config1.php';

// Fetching MIS department details
$misDeptQuery = "SELECT * FROM dept WHERE DeptID = 'MIS'";
$misDeptResult = mysqli_query($conn, $misDeptQuery);
$misDeptDetails = mysqli_fetch_assoc($misDeptResult);

// Fetching MIS courses
$misCoursesQuery = "SELECT * FROM course WHERE DeptID = 'MIS'";
$misCoursesResult = mysqli_query($conn, $misCoursesQuery);
$misCourses = [];
while ($course = mysqli_fetch_assoc($misCoursesResult)) {
    $misCourses[] = $course;
}
// Fetching faculty in the MIS department including their emails from the logintable
$misFacultyQuery = "SELECT f.FacultyID, u.FirstName AS FacultyFirstName, u.LastName AS FacultyLastName, f.Position, f.Specialty, lt.Email AS FacultyEmail FROM faculty f
                JOIN facultydept fd ON f.FacultyID = fd.FacultyID
                JOIN user u ON f.FacultyID = u.UID
                JOIN logintable lt ON u.UID = lt.UID
                WHERE fd.DeptID = 'MIS'";
$misFacultyResult = mysqli_query($conn, $misFacultyQuery);
$misFacultyList = [];
while ($faculty = mysqli_fetch_assoc($misFacultyResult)) {
    $misFacultyList[] = $faculty;
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
            <h1>Welcome to the MIS Department</h1>
            <button class="back-button" onclick="goBack()">Back</button>
        </div>
    </header>

    <main>
    <main>
        <section>
            <h2>Message from the Chair and Manager - Bryan Don - Chair and Joseph Adams - Manager</h2>
            <p>Welcome to the MIS Department at UA University! Our department is dedicated to exploring the dynamic and growing field of information systems, and providing a comprehensive education that prepares our students for the challenges of the modern technological landscape.</p>
            <p>Contact Information:</p>
            <ul>
                <li>Email: <a href="mailto:john.smith@UAuni.edu">john.smith@UAuni.edu</a></li>
                <li>Phone: (555) 123-4567</li>
                <li>Office: Room 1C</li>
            </ul>
            <ul>
                <li>Email: <a href="mailto:JosephAdams400019@ua.uni">JosephAdams400019@ua.uni</a></li>
                <li>Phone: (555) 347- 8790</li>
                <li>Office: Room 4C</li>
            </ul>
        </section>

        <section>
    <h2>Faculty in the <?php echo $misDeptDetails['DeptName']; ?> Department</h2>
    <table>
        <tr>
            <th>Faculty Name</th>
            <th>Position</th>
            <th>Specialty</th>
            <th>Email</th> <!-- Added Email column -->
        </tr>
        <?php foreach ($misFacultyList as $faculty): ?>
        <tr>
            <td><?php echo $faculty['FacultyFirstName'] . ' ' . $faculty['FacultyLastName']; ?></td>
            <td><?php echo $faculty['Position']; ?></td>
            <td><?php echo $faculty['Specialty']; ?></td>
            <td><?php echo $faculty['FacultyEmail']; ?></td> <!-- Displaying Faculty Email -->
        </tr>
        <?php endforeach; ?>
    </table>
</section>

        <section>
            <h2>Course Offerings</h2>
            <table>
                <tr>
                    <th>Course ID</th>
                    <th>Course Name</th>
                    <th>Description</th>
                </tr>
                <?php foreach ($misCourses as $course): ?>
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
    </footer>
</body>
</html>
