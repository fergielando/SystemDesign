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

// Fetching faculty in the art department
$facultyQuery = "SELECT f.FacultyID, u.FirstName AS FacultyFirstName, u.LastName AS FacultyLastName, f.Position AS Position, f.Specialty AS Specialty FROM faculty f
                JOIN facultydept fd ON f.FacultyID = fd.FacultyID
                JOIN user u ON f.FacultyID = u.UID
                WHERE fd.DeptID = 'Art'";
$facultyResult = mysqli_query($conn, $facultyQuery);
$facultyList = [];
while ($faculty = mysqli_fetch_assoc($facultyResult)) {
    $facultyList[] = $faculty;
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
            <button class="back-button" onclick="goBack()">Back</button>
        </div>
    </header>

    <main>
    <main>
    <section>
            <h2>Message from the Chair and Manager - Linda Young - Chair and Samuel Parker - Manager</h2>
            <p>Welcome to the Art Department at UA University! Our department fosters creativity and critical thinking in the visual arts, and is committed to excellence in nurturing and challenging the artistic skills of our students.</p>
             <ul>
                <li>Department Email: <a href="mailto:artdepartment@ua.uni">artdepartment@ua.uni</a></li>
            </ul>
            <p>Contact Information for the Chair:</p>
            <ul>
                <li>Name: Linda Young</li>
                <li>Email: <a href="mailto:LindaYoung400012@ua.uni">LindaYoung400012@ua.uni</a></li>
                <li>Phone: (555) 234-5678</li>
                <li>Office: Room 12C</li>
            </ul>
            <p>Contact Information for the Manager:</p>
            <ul>
                <li>Name: Samuel Parker</li>
                <li>Email: <a href="mailto:SamuelParker400027@ua.uni">SamuelParker400027@ua.uni</a></li>
                <li>Phone: (555) 123-4134</li>
                <li>Office: Room 12C</li>
            </ul>
        </section>

        <section>
        <h2>Faculty in the Art Department</h2>
        <table>
            <tr>
                <th>Faculty Name</th>
                <th>Position</th>
                <th>Specialty</th>
            </tr>
            <?php foreach ($facultyList as $faculty): ?>
            <tr>
                <td><?php echo $faculty['FacultyFirstName'] . ' ' . $faculty['FacultyLastName']; ?></td>
                <td><?php echo $faculty['Position']; ?></td>
                <td><?php echo $faculty['Specialty']; ?></td>
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

    <script>
        function goBack() {
            window.history.back();
        }
    </script>
</body>
</html>
