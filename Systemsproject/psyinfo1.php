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

// Fetching faculty in the Psychology department including their emails from the logintable
$facultyQuery = "SELECT f.FacultyID, u.FirstName AS FacultyFirstName, u.LastName AS FacultyLastName, f.Position, f.Specialty, lt.Email AS FacultyEmail FROM faculty f
                JOIN facultydept fd ON f.FacultyID = fd.FacultyID
                JOIN user u ON f.FacultyID = u.UID
                JOIN logintable lt ON u.UID = lt.UID
                WHERE fd.DeptID = 'psy'";
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
    <title>Psychology Department - UA University</title>
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
            <button class="back-button" onclick="goBack()">Back</button>
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
            <h2>Faculty in the <?php echo $psyDeptDetails['DeptName']; ?> Department</h2>
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
    <script>
    function goBack() {
        window.history.back();
    }
</script>
    </footer>
</body>
</html>