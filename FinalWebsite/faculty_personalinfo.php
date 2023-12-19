<?php
error_reporting(E_ALL);
ini_set('display_errors', 1);
@include 'config1.php';
session_start();


$uid = '';
$user = [];

if (!isset($_SESSION['faculty_name'])) {
   header('location:login_form1.php');
}

// Check if a UID is provided
if (isset($_SESSION['UID'])) {
    $uid = $_SESSION['UID'];

    // Fetch Faculty Data
    $query = "SELECT 
	user.*,
	logintable.*,
	faculty.*
	FROM user 
	JOIN logintable ON user.UID = logintable.UID
	JOIN faculty ON user.UID = faculty.FacultyID
	WHERE user.UID = '$uid'";
    $result = mysqli_query($conn, $query);
    if (mysqli_num_rows($result) > 0) {
        $user = mysqli_fetch_assoc($result);

    }
   }

   // Re-fetch user data
    $query = "SELECT 
	user.*,
	logintable.*,
	faculty.*
	FROM user 
	JOIN logintable ON user.UID = logintable.UID
	JOIN faculty ON user.UID = faculty.FacultyID
	WHERE user.UID = '$uid'";
    $result = mysqli_query($conn, $query);
if (mysqli_num_rows($result) > 0) {
    $user = mysqli_fetch_assoc($result);
}

// Separate query to fetch department information
$deptQuery = "SELECT 
    facultydept.DeptID,
    facultydept.PercentTime,
    facultydept.DOA
    FROM facultydept
    WHERE facultydept.FacultyID = '$uid'";
$deptResult = mysqli_query($conn, $deptQuery);

// Separate query to fetch course sections taught by the faculty member
$courseQuery = "SELECT 
    coursesection.CRN,
    coursesection.CourseID,
    coursesection.SectionNum,
    GROUP_CONCAT(day.Weekday SEPARATOR '/') AS Days,
    timeslot.PeriodID,
    coursesection.RoomID,
    semester.SemesterName,
	CONCAT(DATE_FORMAT(periodd.StartTime, '%h:%i %p'), ' to ', DATE_FORMAT(periodd.EndTime, '%h:%i %p')) AS TimePeriod
    FROM coursesection
	JOIN semester ON coursesection.SemesterID = semester.SemesterID
	JOIN timeslot ON coursesection.TimeSlotID = timeslot.TimeSlotID
    JOIN day ON timeslot.DayID = day.DayID
    JOIN periodd ON timeslot.PeriodID = periodd.PeriodID
    WHERE coursesection.FacultyID = '$uid'
	GROUP BY coursesection.CRN";
$courseResult = mysqli_query($conn, $courseQuery);

// Function to update user information
if (isset($_POST['update_user'])) {
    $newStreet = mysqli_real_escape_string($conn, $_POST['new_street']);
    $newCity = mysqli_real_escape_string($conn, $_POST['new_city']);
    $newState = mysqli_real_escape_string($conn, $_POST['new_state']);
    $newPassword = mysqli_real_escape_string($conn, $_POST['new_password']);

    // Check if the new password is not empty before updating
    $passwordUpdate = !empty($newPassword) ? "Password = '" . md5($newPassword) . "'" : "";

    // Update user information in the database
    $updateQuery = "UPDATE user SET Street = '$newStreet', City = '$newCity', State = '$newState' WHERE UID = '$uid'";
    mysqli_query($conn, $updateQuery);
	if(!empty($newPassword)){
	$updatePasswordQuery = "UPDATE logintable SET $passwordUpdate WHERE UID = '$uid'";
	mysqli_query($conn, $updatePasswordQuery);
	}

     // Perform the query and handle errors
    $updateResult = mysqli_query($conn, $updateQuery);

    if ($updateResult) {
        // Successfully updated user information
        $updateMessage = "User information updated successfully!";
    } else {
        // Failed to update user information
        $updateMessage = "Error updating user information. Please try again.";
    }

    // Display the message
    echo '<p>' . $updateMessage . '</p>';
}

?>

<!DOCTYPE html>
<html lang="en">
<head>
   <meta charset="UTF-8">
   <meta http-equiv="X-UA-Compatible" content="IE-edge">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <title>Personal Information</title>


   <style>

.button-container {
   background-color: #000; /* Black background for the container */
   padding: 10px;
   text-align: center;
}

.button-container .btn {
   background-color: transparent; /* Transparent background for buttons */
   color: #fff; /* White text */
   padding: 10px 20px;
   margin: 5px;
   border: 2px solid #fff; /* White border */
   border-radius: 5px;
   text-decoration: none; /* Remove underline from links */
   font-size: 16px;
   transition: background-color 0.3s, color 0.3s; /* Smooth transition for hover effect */
}

.button-container .btn:hover {
   background-color: #90ee90; /* Light green background on hover */
   color: #000; /* Black text on hover */
}

    /* General style resets */
html, body {
    margin: 0;
    padding: 0;
    box-sizing: border-box; /* Include padding and border in the width */
    font-family: Arial, sans-serif; /* Standard font for better readability */
}

/* Header styles */
.header {
    background: #000;
    color: #fff;
    padding: 20px;
    text-align: center;
    display: flex;
    justify-content: space-between;
}

.header h1 {
    font-size: 36px;
    margin: 0;
}

/* Back button styles */
.back-button {
    background: #000;
    color: #fff;
    padding: 10px 20px;
    text-decoration: none;
    border-radius: 5px;
    margin-right: 10px;
    transition: background-color 0.3s; /* Smooth transition for background color change */
}

.back-button:hover {
    background-color: #4caf50; /* Green color when hovered */
}

/* Table styles */
table {
    width: 100%;
    border-collapse: collapse;
    margin-bottom: 20px;
}

table, th, td {
    border: 1px solid #000;
    padding: 12px;
    text-align: left;
}

/* Alternating row colors */
table tr:nth-child(even) {
    background-color: #fff; /* White for odd rows */
}

table tr:nth-child(odd) {
    background-color: #e6f7ff; /* Light blue for even rows */
}

/* Create button styles */
.create-button {
    background: #000;
    color: #fff;
    padding: 10px 20px;
    text-decoration: none;
    border-radius: 5px;
    margin-top: 10px;
    display: inline-block;
    cursor: pointer;
}

/* Hold section */
.student-holds-container {
    position: absolute;
    top: 140px;
    right: 70px;
    width: 300px; /* Adjust width as needed */
    background-color: #fff;
    padding: 10px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* Add shadow for box effect */
}

/* Assignment section styles */
.assignment-section {
    border: 1px solid #ccc; /* Border color */
    padding: 20px;
    margin-bottom: 20px; /* Space between sections */
    background-color: #f9f9f9; /* Light background for the box */
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* Optional: shadow for box effect */
}
.advisor-container {
    position: fixed;
    bottom: 10px;
    right: 10px;
    background-color: #fff;
    padding: 10px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    max-width: 300px; /* Adjust the width as needed */
}

.advisor-container table {
    width: 100%;
    border-collapse: collapse;
}

.advisor-container th, .advisor-container td {
    border: 1px solid #000;
    padding: 8px;
    text-align: left;
}


    </style>
</head>
<body>

<div class="header">
   <h1>Personal Information</h1>
   <div class="button-container">
       <a href="fac_newhome1.php" class="btn">Back</a>
       </div>
</div>

<div class="academic-profile-container">
   <h2>User Information</h2>
   <img src="profpic.jpg" alt="User Image" width="200">
      <p><strong>User ID:</strong> <?php echo $user['UID']; ?></p>
      <p><strong>Name:</strong> <?php echo $user['FirstName'] . ' ' . $user['LastName']; ?></p>
	  <p><strong>Email:</strong> <?php echo $user['Email']?></p>
	  <p><strong>Gender:</strong> <?php echo $user['Gender']; ?></p>
	  <p><strong>Date of Birth:</strong> <?php echo $user['DOB']; ?></p>
	  <p><strong>Street:</strong> <?php echo $user['Street']; ?></p>
	  <p><strong>City:</strong> <?php echo $user['City']; ?></p>
	  <p><strong>State:</strong> <?php echo $user['State']; ?></p>
	  <p><strong>Zip Code:</strong> <?php echo $user['ZipCode']; ?></p>
	  <p><strong>Position:</strong> <?php echo $user['Position']; ?></p>
	  <p><strong>Specialty:</strong> <?php echo $user['Specialty']; ?></p>
	  <p><strong>Faculty Type:</strong> <?php echo $user['FacultyType']; ?></p>
</div>

<div class="academic-profile-container">
<h2>Current Departments</h2>
<?php
if (mysqli_num_rows($deptResult) > 0) {
    while ($deptRow = mysqli_fetch_assoc($deptResult)) {
        echo "<p><strong>Department ID:</strong> " . $deptRow['DeptID'] . "</p>";
        echo "<p><strong>Percent Time:</strong> " . $deptRow['PercentTime'] . "</p>";
        echo "<p><strong>Date of Association:</strong> " . $deptRow['DOA'] . "</p>";
        // Add additional fields as needed
    }
} else {
    echo "<p>No department information available for this faculty member.</p>";
}
?>
</div>

<div class="academic-profile-container">
<h2>Course Sections Taught</h2>
<?php
if (mysqli_num_rows($courseResult) > 0) {
    echo '<table>';
    echo '<tr>';
    echo '<th>CRN</th>';
    echo '<th>Course ID</th>';
    echo '<th>Section Number</th>';
    echo '<th>Days</th>';
    echo '<th>Time Period</th>';
    echo '<th>Room ID</th>';
    echo '<th>Semester Name</th>';
    echo '</tr>';

    while ($courseRow = mysqli_fetch_assoc($courseResult)) {
        echo '<tr>';
        echo '<td>' . $courseRow['CRN'] . '</td>';
        echo '<td>' . $courseRow['CourseID'] . '</td>';
        echo '<td>' . $courseRow['SectionNum'] . '</td>';
        echo '<td>' . $courseRow['Days'] . '</td>';
        echo '<td>' . $courseRow['TimePeriod'] . '</td>';
        echo '<td>' . $courseRow['RoomID'] . '</td>';
        echo '<td>' . $courseRow['SemesterName'] . '</td>';
        echo '</tr>';
    }

    echo '</table>';
} else {
    echo "<p>No course sections currently taught by this faculty member.</p>";
}
?>
</div>

      <!-- User options section -->
      <div class="user-options-container">
         <h2>User Options</h2>
         <form action="" method="post">
            <label for="new_street">New Street:</label>
            <input type="text" name="new_street" id="new_street" value="<?php echo $user['Street']; ?>"><br>
            <label for="new_city">New City:</label>
            <input type="text" name="new_city" id="new_city" value="<?php echo $user['City']; ?>"><br>
            <label for="new_state">New State:</label>
            <input type="text" name="new_state" id="new_state" value="<?php echo $user['State']; ?>"><br>
            <label for="new_password">New Password:</label>
            <input type="password" name="new_password" id="new_password"><br>
            <input type="submit" name="update_user" value="Update User" class="create-button">
         </form>
      </div>
   </div>
   <script>
   function goBack() {
            window.history.back();
        }
        </script>

</body>

</html>
