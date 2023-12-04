<?php
@include 'config1.php';

// Fetching BIO depBIOment details
$BIODeptQuery = "SELECT * FROM dept WHERE DeptID = 'BIO'";
$BIODeptResult = mysqli_query($conn, $BIODeptQuery);
$BIODeptDetails = mysqli_fetch_assoc($BIODeptResult);

// Fetching BIO courses
$BIOCoursesQuery = "SELECT * FROM course WHERE DeptID = 'BIO'";
$BIOCoursesResult = mysqli_query($conn, $BIOCoursesQuery);
$BIOCourses = [];
while ($course = mysqli_fetch_assoc($BIOCoursesResult)) {
    $BIOCourses[] = $course;
}
// Fetching faculty in the BIOitics department including their emails from the logintable
$facultyQuery = "SELECT f.FacultyID, u.FirstName AS FacultyFirstName, u.LastName AS FacultyLastName, f.Position, f.Specialty, lt.Email AS FacultyEmail FROM faculty f
                JOIN facultydept fd ON f.FacultyID = fd.FacultyID
                JOIN user u ON f.FacultyID = u.UID
                JOIN logintable lt ON u.UID = lt.UID
                WHERE fd.DeptID = 'BIO'";
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
    <title>Biology Department - UA University</title>
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
      <h1>Welcome to the Bio Department</h1>
      <button class="back-button" onclick="goBack()">Back</button>
   </div>
    </header>

    <main>
        <section>
            <h2>Message from the Chair and Manager- Emily Jones - Chair and Josehp Adams - Manager</h2>
            <p>Welcome to the Biology Department at UA University! Our department is dedicated to exploring the wonders of the biological world and providing our students with a comprehensive and engaging learning experience. We offer a range of courses and research opportunities to help you delve into the fascinating world of biology.</p>
            <p>Contact Information:</p>
            <ul>
                <li>Email: <a href="mailto:emily.jones@UAuni.uni">emily.jones@UAuni.edu</a></li>
                <li>Phone: (555) 456-7890</li>
                <li>Office: Room 4C</li>
            </ul>

                <li>Email: <a href="mailto:JosephAdams400019@ua.uni">JosephAdams400019@ua.uni</a></li>
                <li>Phone: (555) 456-7890</li>
                <li>Office: Room 4C</li>
            </ul>
        </section> 

        <section>
            <h2>Faculty in the Biology Department</h2>
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
                    <th>Credits</th>
                    <th>Description</th>
                    <th>Course Type</th>
                </tr>
                <tr>
                    <td>BS1000</td>
                    <td>Plants and Society</td>
                    <td>4</td>
                    <td>A one semester lecture/laboratory course in general botany for non-science majors...</td>
                    <td>Undergraduate</td>
                </tr>
                <tr>
                    <td>BS2400</td>
                    <td>Basic Biology I</td>
                    <td>3</td>
                    <td>Lecture first semester of freshman biology courses...</td>
                    <td>Undergraduate</td>
                </tr>
                <tr>
                    <td>BS2401</td>
                    <td>Basic Biology I Lab</td>
                    <td>1</td>
                    <td>Laboratory first semester of freshman biology courses...</td>
                    <td>Undergraduate</td>
                </tr>
                <tr>
                    <td>BS2410</td>
                    <td>Basic Biology II</td>
                    <td>3</td>
                    <td>Lecture second semester of freshman biology courses...</td>
                    <td>Undergraduate</td>
                </tr>
                <tr>
                    <td>BS2411</td>
                    <td>Basic Biology II Lab</td>
                    <td>1</td>
                    <td>Laboratory second semester of freshman biology courses...</td>
                    <td>Undergraduate</td>
                </tr>
                <tr>
                    <td>BS2490</td>
                    <td>Environmental Science</td>
                    <td>4</td>
                    <td>The focus of this lecture course is on the interactions of humans with their environment...</td>
                    <td>Undergraduate</td>
                </tr>
                <tr>
                    <td>BS3400</td>
                    <td>Vertebrate Physiology</td>
                    <td>4</td>
                    <td>A regulatory systems approach to the principles of animal physiology...</td>
                    <td>Undergraduate</td>
                </tr>
                <tr>
                    <td>BS3450</td>
                    <td>Plant Biology</td>
                    <td>4</td>
                    <td>The study of plants as biological organisms...</td>
                    <td>Undergraduate</td>
                </tr>
                <tr>
                    <td>BS3810</td>
                    <td>Biological Aspects of Aging</td>
                    <td>4</td>
                    <td>Lecture/workshop course designed for science students...</td>
                    <td>Undergraduate</td>
                </tr>
                <tr>
                    <td>BS4400</td>
                    <td>Cell Biology</td>
                    <td>4</td>
                    <td>Lecture/discussion/laboratory course whose content is directed to the study of the molecular basis of cell activities...</td>
                    <td>Undergraduate</td>
                </tr>
                <tr>
                    <td>BS4420</td>
                    <td>Microbiology</td>
                    <td>4</td>
                    <td>Lecture/laboratory course concerned with structure-function relationships in various types of microorganisms...</td>
                    <td>Undergraduate</td>
                </tr>
                <tr>
                    <td>BS4460</td>
                    <td>Genetics</td>
                    <td>4</td>
                    <td>Lecture/laboratory course presenting the fundamental principles of genetics, the molecular biology of the gene...</td>
                    <td>Undergraduate</td>
                </tr>
                <tr>
                    <td>BS4461</td>
                    <td>Immunology</td>
                    <td>4</td>
                    <td>Lecture/laboratory. This course will introduce students to the essential concepts of how the immune system works...</td>
                    <td>Undergraduate</td>
                </tr>
                <tr>
                    <td>BS4470</td>
                    <td>Ecology</td>
                    <td>4</td>
                    <td>A general ecology course focused on the study of ecosystems...</td>
                    <td>Undergraduate</td>
                </tr>
                <tr>
                    <td>BS4560</td>
                    <td>Molecular Biology</td>
                    <td>4</td>
                    <td>Lecture/Laboratory course to introduce students to both the theoretical and practical aspects of molecular biology...</td>
                    <td>Undergraduate</td>
                </tr>
                <tr>
                    <td>BS5410</td>
                    <td>Seminar I: Reading in the Discipline</td>
                    <td>4</td>
                    <td>Designed to increase ability to read in the discipline. Students will survey scientific literature...</td>
                    <td>Undergraduate</td>
                </tr>
                <tr>
                    <td>BS5420</td>
                    <td>Seminar II: Writing in the Discipline</td>
                    <td>4</td>
                    <td>Designed to promote an in-depth consideration of special topics in current biological research...</td>
                    <td>Undergraduate</td>
                </tr>
                <tr>
                    <td>BS5590</td>
                    <td>Advanced Research</td>
                    <td>4</td>
                    <td>Research project carried out under the supervision of a faculty member...</td>
                    <td>Undergraduate</td>
                </tr>
                <tr>
                    <td>BS5591</td>
                    <td>Environmental Research</td>
                    <td>3</td>
                    <td>Research project in environmental science carried out under supervision of a faculty member...</td>
                    <td>Undergraduate</td>
                </tr>
                <tr>
                    <td>BS5592</td>
                    <td>Environmental Research Lab</td>
                    <td>1</td>
                    <td>Research project in environmental science carried out under supervision of a faculty member...</td>
                    <td>Undergraduate</td>
                </tr>
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
