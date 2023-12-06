<?php
@include 'config1.php';

// Retrieve the CRN from the URL parameter
if (isset($_GET['CRN'])) {
    $CRN = $_GET['CRN'];

    // Query to retrieve course and faculty information
    $courseQuery = "SELECT
        course.CourseName,
        user.FirstName AS FacultyFirstName,
        user.LastName AS FacultyLastName
        FROM coursesection
        JOIN course ON coursesection.CourseID = course.CourseID
        JOIN faculty ON coursesection.FacultyID = faculty.FacultyID
        JOIN user ON faculty.FacultyID = user.UID
        WHERE coursesection.CRN = '$CRN'";

    $courseResult = mysqli_query($conn, $courseQuery);

    if ($courseResult && mysqli_num_rows($courseResult) > 0) {
        $courseInfo = mysqli_fetch_assoc($courseResult);

        // Query to retrieve enrolled students and their grades
        $enrollmentQuery = "SELECT
            user.FirstName AS StudentFirstName,
            user.LastName AS StudentLastName,
            user.UID AS StudentID,  -- Add StudentID to the query
            enrollment.Grade
            FROM enrollment
            JOIN user ON enrollment.StudentID = user.UID
            WHERE enrollment.CRN = '$CRN'";

        $enrollmentResult = mysqli_query($conn, $enrollmentQuery);

        // Display the class roster page
        ?>
        <!DOCTYPE html>
        <html lang="en">
        <head>
            <meta charset="UTF-8">
            <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Class Roster</title>
            <style>
                body {
                    font-family: Arial, sans-serif;
                    margin: 20px;
                    padding: 0;
                }

                h1 {
                    color: #333;
                }

                h2, h3 {
                    color: #666;
                }

                table {
                    width: 100%;
                    border-collapse: collapse;
                    margin-top: 20px;
                }

                th, td {
                    padding: 10px;
                    text-align: left;
                }

                th {
                    background-color: #333;
                    color: #fff;
                }

                tr:nth-child(even) {
                    background-color: #f2f2f2;
                }

                form {
                    margin-top: 20px;
                }

                input[type="text"], input[type="submit"] {
                    padding: 5px;
                }

                input[type="submit"] {
                    background-color: #333;
                    color: #fff;
                    border: none;
                    cursor: pointer;
                }

                input[type="submit"]:hover {
                    background-color: #555;
                }
            </style>
        </head>
        <body>
            <h1>Class Roster</h1>
            <h2>Course: <?php echo $courseInfo['CourseName']; ?></h2>
            <h3>Faculty: <?php echo $courseInfo['FacultyFirstName'] . ' ' . $courseInfo['FacultyLastName']; ?></h3>

            <table>
                <thead>
                    <tr>
                        <th>Student Name</th>
                        <th>Grade</th>
                        <th>Attendance</th> <!-- Add a new column for Attendance -->
                    </tr>
                </thead>
                <tbody>
                    <?php while ($student = mysqli_fetch_assoc($enrollmentResult)): ?>
                        <tr>
                            <td><?php echo $student['StudentFirstName'] . ' ' . $student['StudentLastName']; ?></td>
                            <td>
                                <form method="post" action="updategrades.php">
                                    <input type="hidden" name="CRN" value="<?php echo $CRN; ?>">
                                    <input type="hidden" name="StudentID" value="<?php echo $student['StudentID']; ?>">
                                    <input type="text" name="Grade" value="<?php echo $student['Grade']; ?>">
                                    <input type="submit" value="Update Grade">
                                </form>
                            </td>
                            <td>
                                <form method="get" action="attendance.php">
                                    <input type="hidden" name="CRN" value="<?php echo $CRN; ?>">
                                    <input type="hidden" name="StudentID" value="<?php echo $student['StudentID']; ?>">
                                    <input type="submit" value="View Attendance">
                                </form>
                            </td>
                        </tr>
                    <?php endwhile; ?>
                </tbody>
            </table>

        </body>
        </html>
        <?php
    } else {
        echo "Course not found for CRN: $CRN";
    }
} else {
    echo "CRN parameter missing in the URL.";
}
?>
