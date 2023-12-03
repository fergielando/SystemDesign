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
            <p>Contact Information for the Chair:</p>
            <ul>
                <li>Email: <a href="mailto:robert.brown@UAuni.edu">robert.brown@UAuni.edu</a></li>
                <li>Phone: (555) 567-8902</li>
                <li>Office: Room 5C</li>
            </ul>
            <p>Contact Information for the Manager:</p>
            <ul>
                <li>Email: <a href="mailto:MaryHall400020@ua.uni">MaryHall400020@ua.uni</a></li>
                <li>Phone: (555) 890-2324</li>
                <li>Office: Room 5C</li>
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
