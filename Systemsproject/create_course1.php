<?php
@include 'config1.php'; // Include your database configuration file

session_start();

if (!isset($_SESSION['UID'])) {
    echo "Please log in to create a course section.";
    exit;
}

// Check if the courseID is passed in the URL
if (!isset($_GET['courseID'])) {
    echo "Course ID is missing.";
    exit;
}

$courseID = $_GET['courseID'];

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Process the form data for creating a course section
    $crn = $_POST['crn'];
    $sectionNum = $_POST['sectionNum'];
    $facultyID = $_POST['facultyID'];
    $timeSlotID = $_POST['timeSlotID'];
    $roomID = $_POST['roomID'];
    $semesterID = $_POST['semesterID'];
    $availableSeats = $_POST['availableSeats'];

    // Insert the course section into the 'coursesection' table
    $insertSectionQuery = "INSERT INTO coursesection (CRN, SectionNum, FacultyID, TimeSlotID, RoomID, SemesterID, AvailableSeats, CourseID) 
                          VALUES ('$crn', '$sectionNum', '$facultyID', '$timeSlotID', '$roomID', '$semesterID', '$availableSeats', '$courseID')";
    mysqli_query($conn, $insertSectionQuery);

    // Redirect to a success page or display a success message
    header("Location: success_page.php");
    exit;
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
   <meta charset="UTF-8">
   <meta http-equiv="X-UA-Compatible" content="IE-edge">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <title>Create Course Section</title>
   <link rel="stylesheet" href="css/fatman1.css">
</head>
<body>
   <h1>Create Course Section</h1>
   <form method="POST" action="">
       <!-- Input fields for CRN, SectionNum, FacultyID, TimeSlotID, RoomID, SemesterID, and AvailableSeats -->
       <input type="number" name="crn" placeholder="CRN" required>
       <input type="text" name="sectionNum" placeholder="Section Number" required>
       <input type="number" name="facultyID" placeholder="Faculty ID" required>
       <input type="number" name="timeSlotID" placeholder="Time Slot ID" required>
       <input type="number" name="roomID" placeholder="Room ID" required>
       <input type="number" name="semesterID" placeholder="Semester ID" required>
       <input type="number" name="availableSeats" placeholder="Available Seats" required>
       <!-- ... (other input fields) ... -->
       <button type="submit">Create Course Section</button>
   </form>
</body>
</html>