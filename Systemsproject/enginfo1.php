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

// Fetching faculty in the English department including their emails from the logintable
$facultyQuery = "SELECT f.FacultyID, u.FirstName AS FacultyFirstName, u.LastName AS FacultyLastName, f.Position, f.Specialty, lt.Email AS FacultyEmail FROM faculty f
                JOIN facultydept fd ON f.FacultyID = fd.FacultyID
                JOIN user u ON f.FacultyID = u.UID
                JOIN logintable lt ON u.UID = lt.UID
                WHERE fd.DeptID = 'ENG'";
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
            <button class="back-button" onclick="goBack()">Back</button>
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
            <h2>Faculty in the <?php echo $engDeptDetails['DeptName']; ?> Department</h2>
            <table>
                <tr>
                    <th>Faculty Name</th>
                    <th>Position</th>
                    <th>Specialty</th>
                    <th>Email</th> <!-- Added Email column -->
                </tr>
                <?php foreach ($facultyList as $faculty): ?>
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
    <script>
    function goBack() {
        window.history.back();
    }
</script>
    </footer>
</body>
</html>