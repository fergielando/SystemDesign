<?php
@include 'config1.php';

// Fetching eco department details
$ecoDeptQuery = "SELECT * FROM dept WHERE DeptID = 'ECO'";
$ecoDeptResult = mysqli_query($conn, $ecoDeptQuery);
$ecoDeptDetails = mysqli_fetch_assoc($ecoDeptResult);

// Fetching eco courses
$ecoCoursesQuery = "SELECT * FROM course WHERE DeptID = 'ECO'";
$ecoCoursesResult = mysqli_query($conn, $ecoCoursesQuery);
$ecoCourses = [];
while ($course = mysqli_fetch_assoc($ecoCoursesResult)) {
    $ecoCourses[] = $course;
}

// Fetching faculty in the Economics department including their emails from the logintable
$facultyQuery = "SELECT f.FacultyID, u.FirstName AS FacultyFirstName, u.LastName AS FacultyLastName, f.Position, f.Specialty, lt.Email AS FacultyEmail FROM faculty f
                JOIN facultydept fd ON f.FacultyID = fd.FacultyID
                JOIN user u ON f.FacultyID = u.UID
                JOIN logintable lt ON u.UID = lt.UID
                WHERE fd.DeptID = 'ECO'";
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
    <title>Economics Department - UA University</title>
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
            <h1>Welcome to the Economics Department</h1>
            <button class="back-button" onclick="goBack()">Back</button>
        </div>
    </header>

    <main>
    <main>
    <section>
            <h2>Message from the Chair and Manager - David Lee - Chair and Amanda Carter - Manager</h2>
            <p>Welcome to the Economics Department at UA University! Our department is committed to providing a deep understanding of economic theories and practices, equipping our students with the analytical skills needed to excel in the global economic landscape.</p>
            <ul>
                <li>Department Email: <a href="mailto:economicsdepartment@ua.uni">economicsdepartment@ua.uni</a></li>
            </ul>
            <p>Contact Information for the Chair:</p>
            <ul>
                <li>Name: David Lee</li>
                <li>Email: <a href="mailto:DavidLee400007@ua.uni">DavidLee400007@ua.uni</a></li>
                <li>Phone: (555) 789-0123</li>
                <li>Office: Room 7C</li>
            </ul>
            <p>Contact Information for the Manager:</p>
            <ul>
                <li>Name: Amanda Carter</li>
                <li>Email: <a href="mailto:AmandaCarter400022@ua.uni">AmandaCarter400022@ua.uni</a></li>
                <li>Phone: (555) 543-7647</li>
                <li>Office: Room 7C</li>
            </ul>
        </section>


        <section>
            <h2>Faculty in the <?php echo $ecoDeptDetails['DeptName']; ?> Department</h2>
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
                <?php foreach ($ecoCourses as $course): ?>
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
