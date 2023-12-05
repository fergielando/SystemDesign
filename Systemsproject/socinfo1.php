<?php
@include 'config1.php';

// Fetching soc depsocment details
$socDeptQuery = "SELECT * FROM dept WHERE DeptID = 'SOC'";
$socDeptResult = mysqli_query($conn, $socDeptQuery);
$socDeptDetails = mysqli_fetch_assoc($socDeptResult);

// Fetching soc courses
$socCoursesQuery = "SELECT * FROM course WHERE DeptID = 'SOC'";
$socCoursesResult = mysqli_query($conn, $socCoursesQuery);
$socCourses = [];
while ($course = mysqli_fetch_assoc($socCoursesResult)) {
    $socCourses[] = $course;
}

// Fetching faculty in the Psychology department including their emails from the logintable
$facultyQuery = "SELECT f.FacultyID, u.FirstName AS FacultyFirstName, u.LastName AS FacultyLastName, f.Position, f.Specialty, lt.Email AS FacultyEmail FROM faculty f
                JOIN facultydept fd ON f.FacultyID = fd.FacultyID
                JOIN user u ON f.FacultyID = u.UID
                JOIN logintable lt ON u.UID = lt.UID
                WHERE fd.DeptID = 'SOC'";
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
    <title>Sociology Department - UA University</title>
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
            <h1>Welcome to the Sociology Department</h1>
            <button class="back-button" onclick="goBack()">Back</button>
        </div>
    </header>

    <main>
    <main>
    <section>
            <h2>Message from the Chair and Manager - Susan Clark - Chair and Kevin Cooper - Manager</h2>
            <p>Welcome to the Sociology Department at UA University! Our department is dedicated to the study of social behavior, society's structures, and the complex relationships within communities. We provide students with a deep understanding of sociological concepts and research methodologies.</p>
             <ul>
                <li>Department Email: <a href="mailto:sociologydepartment@ua.uni">sociologydepartment@ua.uni</a></li>
            </ul>
            <p>Contact Information for the Chair:</p>
            <ul>
                <li>Name: Susan Clark</li>
                <li>Email: <a href="mailto:SusanClark400010@ua.uni">SusanClark400010@ua.uni</a></li>
                <li>Phone: (555) 012-3456</li>
                <li>Office: Room 10C</li>
            </ul>
            <p>Contact Information for the Manager:</p>
            <ul>
                <li>Name: Kevin Cooper</li>
                <li>Email: <a href="mailto:KevinCooper400025@ua.uni">KevinCooper400025@ua.uni</a></li>
                <li>Phone: (555) 214-3214</li>
                <li>Office: Room 10C</li>
            </ul>
        </section>


        <section>
            <h2>Faculty in the <?php echo $socDeptDetails['DeptName']; ?> Department</h2>
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
                <?php foreach ($socCourses as $course): ?>
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