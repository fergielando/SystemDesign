<?php
@include 'config1.php'; // Include your database configuration file

session_start();

// Check for user's session UID
if (!isset($_SESSION['UID'])) {
    echo "Please log in to manage course sections and faculty history.";
    exit;
}

$uid = $_SESSION['UID'];

// Function to check faculty type
function getFacultyType($conn, $faculty_id) {
    $query = "SELECT FacultyType FROM faculty WHERE FacultyID = '$faculty_id'";
    $result = mysqli_query($conn, $query);
    if ($row = mysqli_fetch_assoc($result)) {
        return $row['FacultyType'];
    }
    return null; // Faculty not found
}

// Function to count the number of classes taught by a faculty member in the specified semester
function countFacultyClasses($conn, $faculty_id, $semester_id) {
    $query = "SELECT COUNT(*) AS classCount FROM facultyhistory WHERE FacultyID = '$faculty_id' AND SemesterID = '$semester_id'";
    $result = mysqli_query($conn, $query);
    if ($row = mysqli_fetch_assoc($result)) {
        return $row['classCount'];
    }
    return 0; // No classes found
}


// Function to get the department ID of a course
function getCourseDeptId($conn, $course_id) {
    $query = "SELECT DeptID FROM course WHERE CourseID = ?";
    $stmt = mysqli_prepare($conn, $query);
    mysqli_stmt_bind_param($stmt, "s", $course_id);
    mysqli_stmt_execute($stmt);
    $result = mysqli_stmt_get_result($stmt);
    if ($row = mysqli_fetch_assoc($result)) {
        mysqli_stmt_close($stmt);
        return $row['DeptID'];
    }
    mysqli_stmt_close($stmt);
    return null;
}

// Function to get the department ID of a faculty member
function getFacultyDeptId($conn, $faculty_id) {
    $query = "SELECT DeptID FROM facultydept WHERE FacultyID = ?";
    $stmt = mysqli_prepare($conn, $query);
    mysqli_stmt_bind_param($stmt, "s", $faculty_id);
    mysqli_stmt_execute($stmt);
    $result = mysqli_stmt_get_result($stmt);
    if ($row = mysqli_fetch_assoc($result)) {
        mysqli_stmt_close($stmt);
        return $row['DeptID'];
    }
    mysqli_stmt_close($stmt);
    return null;
}

// Check if form is submitted
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Assuming courseID, CRN, and facultyID are part of the form submission
    $courseID = mysqli_real_escape_string($conn, $_POST['course_id']);
    $CRN = mysqli_real_escape_string($conn, $_POST['CRN']);
    $facultyID = mysqli_real_escape_string($conn, $_POST['faculty_id']);

    // Parse timeslot and room from the selected option
    $timeslotParts = explode('_', mysqli_real_escape_string($conn, $_POST['timeslot']));
    if (count($timeslotParts) == 2) {
        list($timeSlotID, $roomID) = $timeslotParts;
    } else {
        echo "Invalid timeslot selected.";
        exit;
    }

    // Department validation
    $courseDeptId = getCourseDeptId($conn, $courseID);
    $facultyDeptId = getFacultyDeptId($conn, $facultyID);
    if ($courseDeptId !== $facultyDeptId) {
        echo "Error: Faculty member is not part of the department offering this course.";
        exit;
    }

    // Additional fields for coursesection
    $sectionNum = mysqli_real_escape_string($conn, $_POST['section_num']);
    $semesterID = mysqli_real_escape_string($conn, $_POST['semester_id']);
    $availableSeats = mysqli_real_escape_string($conn, $_POST['available_seats']);

    // Check if the course section already exists
    $checkQuery = "SELECT COUNT(*) AS sectionCount FROM coursesection WHERE CourseID = '$courseID' AND SectionNum = '$sectionNum'";
    $checkResult = mysqli_query($conn, $checkQuery);

    if ($checkResult) {
        $row = mysqli_fetch_assoc($checkResult);
        $sectionCount = $row['sectionCount'];
        if ($sectionCount > 0) {
            echo "Error: Course section with the same CourseID and SectionNum already exists.";
            header("refresh:5;url=createcoursesection.php"); // Redirect to createcoursesection.php after 5 seconds
            exit;
        }
    } else {
        echo "Error checking for an existing course section: " . mysqli_error($conn);
        header("refresh:5;url=createcoursesection.php"); // Redirect to createcoursesection.php after 5 seconds
        exit;
    }

    // Check faculty restrictions
    $facultyType = getFacultyType($conn, $facultyID);
    $numClasses = countFacultyClasses($conn, $facultyID, $semesterID);
    if (($facultyType == 'Full-time' && $numClasses >= 2) || ($facultyType == 'Part-time' && $numClasses >= 1)) {
        echo "<p style='font-size: 20px; color: red;'>Error: Faculty member cannot be assigned more classes.</p>";
        exit;
    }

    // Increment the NumOfClass for the faculty member
    $facultyTable = ($facultyType == 'Full-time') ? 'facultyft' : 'facultypt';
    $incrementQuery = "UPDATE $facultyTable SET NumOfClass = NumOfClass + 1 WHERE FacultyID = '$facultyID'";
    $incrementResult = mysqli_query($conn, $incrementQuery);

    if (!$incrementResult) {
        echo "Error incrementing NumOfClass: " . mysqli_error($conn);
        exit;
    }

    // Insert data into coursesection table
    $sectionQuery = "INSERT INTO coursesection (CRN, CourseID, SectionNum, FacultyID, TimeSlotID, RoomID, SemesterID, AvailableSeats) 
                     VALUES ('$CRN', '$courseID', '$sectionNum', '$facultyID', '$timeSlotID', '$roomID', '$semesterID', '$availableSeats')";
    $sectionResult = mysqli_query($conn, $sectionQuery);

    if ($sectionResult) {
        // Insert data into facultyhistory table
        $facultyHistoryInsertQuery = "INSERT INTO facultyhistory (FacultyID, CourseID, CRN, SemesterID) 
                                      VALUES ('$facultyID', '$courseID', '$CRN', '$semesterID')";
        $facultyHistoryInsertResult = mysqli_query($conn, $facultyHistoryInsertQuery);

        if ($facultyHistoryInsertResult) {
            echo "Coursesection and faculty history created successfully!";
            // Redirect or perform other actions as needed
        } else {
            echo "Error inserting data into faculty history table: " . mysqli_error($conn);
        }
    } else {
        echo "Error creating course section: " . mysqli_error($conn);
    }
}

// Rest of your code...
?>
