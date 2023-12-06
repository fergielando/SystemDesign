<?php
@include 'config1.php';

session_start();

if (!isset($_SESSION['admin_name'])) {
    header('location:login_form1.php');
    exit;
}

// Check if a CRN is provided
if (isset($_GET['CRN'])) {
    $CRN = mysqli_real_escape_string($conn, $_GET['CRN']);

    // Fetch the course section details
    $query = "SELECT * FROM coursesection WHERE CRN = '$CRN'";
    $result = mysqli_query($conn, $query);

    if ($row = mysqli_fetch_assoc($result)) {
        // The course section details are now in $row
    } else {
        echo "Course section not found.";
        exit;
    }
} else {
    echo "No CRN provided.";
    exit;
}

// Query to get available time slots
$availableSlotsQuery = "
SELECT 
    t.TimeSlotID, 
    d.Weekday, 
    p.StartTime, 
    p.EndTime, 
    b.BuildingName, 
    r.RoomNum, 
    r.RoomID,
    r.RoomType  -- Add this line to fetch RoomType
FROM timeslot t
JOIN day d ON t.DayID = d.DayID
JOIN periodd p ON t.PeriodID = p.PeriodID
JOIN room r ON 1 = 1
JOIN building b ON r.BuildingID = b.BuildingID
LEFT JOIN coursesection cs ON t.TimeSlotID = cs.TimeSlotID AND r.RoomID = cs.RoomID
WHERE cs.CRN IS NULL
AND r.RoomType <> 'office'
ORDER BY d.Weekday, p.StartTime, r.RoomNum;";

$availableSlotsResult = mysqli_query($conn, $availableSlotsQuery);
$availableSlots = [];

while ($slotRow = mysqli_fetch_assoc($availableSlotsResult)) {
    $availableSlots[] = $slotRow;
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Edit Course Section</title>
    <!-- Include any additional CSS or meta tags here -->
</head>
<body>
    <h1>Edit Course Section</h1>
    <form action="updatecoursesection.php" method="POST">
        <input type="hidden" name="original_CRN" value="<?php echo htmlspecialchars($row['CRN']); ?>">
        
        <label for="CRN">CRN:</label>
        <input type="text" id="CRN" name="CRN" value="<?php echo htmlspecialchars($row['CRN']); ?>" required>

        <label for="courseID">Course ID:</label>
        <input type="text" id="courseID" name="courseID" value="<?php echo htmlspecialchars($row['CourseID']); ?>" required>

        <label for="availableSeats">Available Seats:</label>
        <input type="number" id="availableSeats" name="availableSeats" value="<?php echo htmlspecialchars($row['AvailableSeats']); ?>" required>

        <!-- Dropdown for selecting a time slot -->
        <label for="timeSlotID">Select Time Slot:</label>
        <select id="timeSlotID" name="timeSlotID" required>
            <?php foreach ($availableSlots as $slot): ?>
                <option value="<?php echo $slot['TimeSlotID'] . '_' . $slot['RoomID']; ?>">
                    <?php echo $slot['Weekday'] . ', ' . $slot['StartTime'] . '-' . $slot['EndTime'] . ', ' . $slot['BuildingName'] . ' - Room ' . $slot['RoomNum'] . ' (' . $slot['RoomType'] . ')'; ?>
                </option>
            <?php endforeach; ?>
        </select>

        <label for="roomID">Room ID:</label>
        <input type="text" id="roomID" name="roomID" value="<?php echo htmlspecialchars($row['RoomID']); ?>" required>

        <label for="facultyID">Faculty ID:</label>
        <input type="text" id="facultyID" name="facultyID" value="<?php echo htmlspecialchars($row['FacultyID']); ?>" required>

        <input type="submit" value="Update Course Section">
    </form>
</body>
</html>
