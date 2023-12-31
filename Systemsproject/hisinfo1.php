<?php
@include 'config1.php';

// Fetching his department details
$hisDeptQuery = "SELECT * FROM dept WHERE DeptID = 'HIS'";
$hisDeptResult = mysqli_query($conn, $hisDeptQuery);
$hisDeptDetails = mysqli_fetch_assoc($hisDeptResult);

// Fetching his courses
$hisCoursesQuery = "SELECT * FROM course WHERE DeptID = 'HIS'";
$hisCoursesResult = mysqli_query($conn, $hisCoursesQuery);
$hisCourses = [];
while ($course = mysqli_fetch_assoc($hisCoursesResult)) {
    $hisCourses[] = $course;
}
// Fetching faculty in the History department including their emails from the logintable
$facultyQuery = "SELECT f.FacultyID, u.FirstName AS FacultyFirstName, u.LastName AS FacultyLastName, f.Position, f.Specialty, lt.Email AS FacultyEmail FROM faculty f
                JOIN facultydept fd ON f.FacultyID = fd.FacultyID
                JOIN user u ON f.FacultyID = u.UID
                JOIN logintable lt ON u.UID = lt.UID
                WHERE fd.DeptID = 'HIS'";
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
    <title>History Department - UA University</title>
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
            <h1>Welcome to the History Department</h1>
            <button class="back-button" onclick="goBack()">Back</button>
        </div>
    </header>

    <main>
    <main>
    <section>
            <h2>Message from the Chair and Manager - Robert Brown - Chair and Mary Hall - Manager</h2>
            <p>Welcome to the History Department at UA University! We are dedicated to exploring and understanding the complexities of the past, teaching our students how history shapes our present and future. Join us in uncovering the stories and events that have defined human experiences across time.</p>
            <ul>
                <li>Email: <a href="mailto:historydepartment@ua.uni">historydepartment@ua.uni</a></li>
            </ul>
            <p>Contact Information for the Chair:</p>
            <ul>
                <li>Name: Robert Brown</li>
                <li>Email: <a href="mailto:RobertBrown400005@ua.uni">RobertBrown400005@ua.uni</a></li>
                <li>Phone: (555) 567-8902</li>
                <li>Office: Room 5C</li>
            </ul>
            <p>Contact Information for the Manager:</p>
            <ul>
                <li>Name: Mary Hall</li>
                <li>Email: <a href="mailto:MaryHall400020@ua.uni">MaryHall400020@ua.uni</a></li>
                <li>Phone: (555) 890-2324</li>
                <li>Office: Room 5C</li>
            </ul>
        </section>

        <section>
            <h2>Faculty in the <?php echo $hisDeptDetails['DeptName']; ?> Department</h2>
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
                <?php foreach ($hisCourses as $course): ?>
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
