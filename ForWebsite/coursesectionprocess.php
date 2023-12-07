<?php
@include 'config1.php'; // Include your database configuration file

session_start();

// Check for user's session UID
if (!isset($_SESSION['UID'])) {
    echo "Please log in to manage course sections and faculty history.";
    exit;
}

$uid = $_SESSION['UID'];

// Process form submission
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

    // Additional fields for coursesection
    $sectionNum = mysqli_real_escape_string($conn, $_POST['section_num']);
    $semesterID = mysqli_real_escape_string($conn, $_POST['semester_id']);
    $availableSeats = mysqli_real_escape_string($conn, $_POST['available_seats']);

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
?>
