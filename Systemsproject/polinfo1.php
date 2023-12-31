<?php
@include 'config1.php';

// Fetching pol deppolment details
$polDeptQuery = "SELECT * FROM dept WHERE DeptID = 'POL'";
$polDeptResult = mysqli_query($conn, $polDeptQuery);
$polDeptDetails = mysqli_fetch_assoc($polDeptResult);

// Fetching pol courses
$polCoursesQuery = "SELECT * FROM course WHERE DeptID = 'POL'";
$polCoursesResult = mysqli_query($conn, $polCoursesQuery);
$polCourses = [];
while ($course = mysqli_fetch_assoc($polCoursesResult)) {
    $polCourses[] = $course;
}
// Fetching faculty in the Politics department including their emails from the logintable
$facultyQuery = "SELECT f.FacultyID, u.FirstName AS FacultyFirstName, u.LastName AS FacultyLastName, f.Position, f.Specialty, lt.Email AS FacultyEmail FROM faculty f
                JOIN facultydept fd ON f.FacultyID = fd.FacultyID
                JOIN user u ON f.FacultyID = u.UID
                JOIN logintable lt ON u.UID = lt.UID
                WHERE fd.DeptID = 'POL'";
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
    <title>pollosopol Department - UA University</title>
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
            <h1>Welcome to the Politics Department</h1>
            <button class="back-button" onclick="goBack()">Back</button>
        </div>
    </header>

    <main>
    <main>
    <section>
    <section>
            <h2>Message from the Chair and Manager - Christopher Allen - Chair and Elizabeth Morris - Manager</h2>
            <p>Welcome to the Politics Department at UA University! Our department is dedicated to the study of political systems, public policy, and governmental structures, providing our students with a deep understanding of the complexities of political processes and their impact on societies worldwide.</p>
             <ul>
                <li>Department Email: <a href="mailto:politicsdepartment@ua.uni">politicsdepartment@ua.uni</a></li>
            </ul>
            <p>Contact Information for the Chair:</p>
            <ul>
                <li>Name: Christopher Allen</li>
                <li>Email: <a href="mailto:ChristopherAllen400013@ua.uni">ChristopherAllen400013@ua.uni</a></li>
                <li>Phone: (555) 345-6789</li>
                <li>Office: Room 13C</li>
            </ul>
            <p>Contact Information for the Manager:</p>
            <ul>
                <li>Name: Elizabeth Morris</li>
                <li>Email: <a href="mailto:ElizabethMorris400028@ua.uni">ElizabethMorris400028@ua.uni</a></li>
                <li>Phone: (555) 710-8062</li>
                <li>Office: Room 13C</li>
            </ul>
        </section>

        <section>
            <h2>Faculty in the <?php echo $polDeptDetails['DeptName']; ?> Department</h2>
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
            <h2>Faculty in the <?php echo $polDeptDetails['DeptName']; ?> Department</h2>
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
                <?php foreach ($polCourses as $course): ?>
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