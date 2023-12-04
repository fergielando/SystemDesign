<?php
@include 'config1.php';

// Fetching CIS department details
$cisDeptQuery = "SELECT * FROM dept WHERE DeptID = 'CIS'";
$cisDeptResult = mysqli_query($conn, $cisDeptQuery);
$cisDeptDetails = mysqli_fetch_assoc($cisDeptResult);

// Fetching CIS courses
$cisCoursesQuery = "SELECT * FROM course WHERE DeptID = 'CIS'";
$cisCoursesResult = mysqli_query($conn, $cisCoursesQuery);
$cisCourses = [];
while ($course = mysqli_fetch_assoc($cisCoursesResult)) {
    $cisCourses[] = $course;
}
// Fetching faculty in the CIS department including their emails from the logintable
$facultyQuery = "SELECT f.FacultyID, u.FirstName AS FacultyFirstName, u.LastName AS FacultyLastName, f.Position, f.Specialty, lt.Email AS FacultyEmail FROM faculty f
JOIN facultydept fd ON f.FacultyID = fd.FacultyID
JOIN user u ON f.FacultyID = u.UID
JOIN logintable lt ON u.UID = lt.UID
WHERE fd.DeptID = 'CIS'";
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
    <title>CIS Department - UA University</title>
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
            <h1>Welcome to the CIS Department</h1>
            <button class="back-button" onclick="goBack()">Back</button>
        </div>
    </header>

    <main>
    <main>
    <section>
            <h2>Message from the Chair and Manager - Sarah Johnson - Chair and Richard Baker - Manager</h2>
            <p>Welcome to the CIS Department at UA University! Our department is committed to excellence in the field of computer information systems and equips students with the necessary skills to succeed in a rapidly evolving digital world.</p>
            <p>Contact Information:</p>
            <ul>
                <li>Email: <a href="mailto:sarah.johnson@UAuni.edu">sarah.johnson@UAuni.edu</a></li>
                <li>Phone: (555) 234-5678</li>
                <li>Office: Room 2C</li>
            </ul>
            <ul>
                <li>Email: <a href="mailto:RichardBaker400017@ua.uni">RichardBaker400017@ua.uni</a></li>
                <li>Phone: (555) 123-0849</li>
                <li>Office: Room 2C</li>
            </ul>
        </section>


        <section>
            <h2>Faculty in the <?php echo $cisDeptDetails['DeptName']; ?> Department</h2>
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
                <?php foreach ($cisCourses as $course): ?>
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
