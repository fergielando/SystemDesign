<?php
@include 'config1.php';
session_start();


$uid = '';
$user = [];
$userMajors = [];
$userMinors = [];

// Check if a UID is provided
if (isset($_GET['UID'])) {
    $uid = mysqli_real_escape_string($conn, $_GET['UID']);

    // Fetch Student Data
    $query = "SELECT * FROM user WHERE UID = '$uid'";
    $result = mysqli_query($conn, $query);
    if (mysqli_num_rows($result) > 0) {
        $user = mysqli_fetch_assoc($result);

    }
   }

   // Re-fetch user data
$query = "SELECT * FROM user WHERE UID = '$uid'";
$result = mysqli_query($conn, $query);
if (mysqli_num_rows($result) > 0) {
    $user = mysqli_fetch_assoc($result);
}


// Retrieve majors, minors, and enrolled courses
$selectedStudentType = "SELECT StudentType FROM student WHERE StudentID = '$uid'";
if($selectedStudentType = 'Undergraduate'){
$queryMajors = "SELECT * FROM major WHERE MajorID > 0 AND MajorID < 31";
$resultMajors = mysqli_query($conn, $queryMajors);
$majors = [];

while ($rowMajor = mysqli_fetch_assoc($resultMajors)) {
    $majors[] = $rowMajor;
}

$queryMinors = "SELECT * FROM minor WHERE MinorID > 0 AND MinorID < 31";
$resultMinors = mysqli_query($conn, $queryMinors);
$minors = [];

while ($rowMinor = mysqli_fetch_assoc($resultMinors)) {
    $minors[] = $rowMinor;
}
}
elseif($selectedStudentType = 'Masters' OR $selectedStudentType = 'PHD'){
$queryMajors = "SELECT * FROM major WHERE MajorID > 30";
$resultMajors = mysqli_query($conn, $queryMajors);
$majors = [];

while ($rowMajor = mysqli_fetch_assoc($resultMajors)) {
    $majors[] = $rowMajor;
}

$queryMinors = "SELECT * FROM minor WHERE MinorID > 30";
$resultMinors = mysqli_query($conn, $queryMinors);
$minors = [];

while ($rowMinor = mysqli_fetch_assoc($resultMinors)) {
    $minors[] = $rowMinor;
}
}

else{
$queryMajors = "SELECT * FROM major WHERE MajorID > 0";
$resultMajors = mysqli_query($conn, $queryMajors);
$majors = [];

while ($rowMajor = mysqli_fetch_assoc($resultMajors)) {
    $majors[] = $rowMajor;
}

$queryMinors = "SELECT * FROM minor WHERE MinorID > 0";
$resultMinors = mysqli_query($conn, $queryMinors);
$minors = [];

while ($rowMinor = mysqli_fetch_assoc($resultMinors)) {
    $minors[] = $rowMinor;
}
}

$queryUserMajors = "SELECT MajorName FROM studentmajor INNER JOIN major ON studentmajor.MajorID = major.MajorID WHERE StudentID = '$uid'";
$resultUserMajors = mysqli_query($conn, $queryUserMajors);
$userMajors = [];

while ($rowUserMajor = mysqli_fetch_assoc($resultUserMajors)) {
    $userMajors[] = $rowUserMajor['MajorName'];
}

$queryUserMinors = "SELECT MinorName FROM studentminor INNER JOIN minor ON studentminor.MinorID = minor.MinorID WHERE StudentID = '$uid'";
$resultUserMinors = mysqli_query($conn, $queryUserMinors);
$userMinors = [];

while ($rowUserMinor = mysqli_fetch_assoc($resultUserMinors)) {
    $userMinors[] = $rowUserMinor['MinorName'];
}


// Function to assign a major to a student
if (isset($_POST['assign_major'])) {
    $selectedMajorID = mysqli_real_escape_string($conn, $_POST['major']);

    // Check how many majors the student has declared
    $countUserMajorsQuery = "SELECT COUNT(*) as totalMajors FROM studentmajor WHERE StudentID = '$uid'";
    $countUserMajorsResult = mysqli_query($conn, $countUserMajorsQuery);
    $countUserMajors = mysqli_fetch_assoc($countUserMajorsResult);
	
    $countUserMinorsQuery = "SELECT COUNT(*) as totalMinors FROM studentminor WHERE StudentID = '$uid'";
    $countUserMinorsResult = mysqli_query($conn, $countUserMinorsQuery);
    $countUserMinors = mysqli_fetch_assoc($countUserMinorsResult);
	
	
        // If the student has declared less than (two majors OR one major + one minor), proceed to assign the major
    if (($countUserMajors['totalMajors'] < 2) && !($countUserMajors['totalMajors'] == 1 && $countUserMinors['totalMinors'] == 1)) {
        // Check if the assignment already exists
        $checkAssignmentQuery = "SELECT * FROM studentmajor WHERE StudentID = '$uid' AND MajorID = '$selectedMajorID'";
        $checkAssignmentResult = mysqli_query($conn, $checkAssignmentQuery);

        if (mysqli_num_rows($checkAssignmentResult) > 0) {
            // If the assignment exists, update it in the database
            $assignMajorQuery = "UPDATE studentmajor SET MajorID = '$selectedMajorID' WHERE StudentID = '$uid'";
            mysqli_query($conn, $assignMajorQuery);
        } else {
            // If the assignment doesn't exist, insert it into the database
			if($selectedMajorID > 0 AND $selectedMajorID < 31){
			   $queryDeptID = "SELECT DeptID FROM major WHERE MajorID = '$selectedMajorID'";
			   $resultDeptID = mysqli_query($conn, $queryDeptID);
			   $row = mysqli_fetch_assoc($resultDeptID);
			   $selectedDeptID = $row['DeptID'];
			   $assignDept = "UPDATE undergradstudent SET DeptID = '$selectedDeptID' WHERE StudentID = '$uid'";
                mysqli_query($conn, $assignDept);
			}
			elseif($selectedMajorID > 30){
			   $queryDeptID = "SELECT DeptID FROM major WHERE MajorID = '$selectedMajorID'";
			   $resultDeptID = mysqli_query($conn, $queryDeptID);
			   $row = mysqli_fetch_assoc($resultDeptID);
			   $selectedDeptID = $row['DeptID'];
			    $assignDept = "UPDATE gradstudent SET DeptID = '$selectedDeptID' WHERE StudentID = '$uid'";
                mysqli_query($conn, $assignDept);
			}
			elseif($selectedMajorID = 0){
			   $queryDeptID = "SELECT DeptID FROM major WHERE MajorID = '$selectedMajorID'";
			   $resultDeptID = mysqli_query($conn, $queryDeptID);
			   $row = mysqli_fetch_assoc($resultDeptID);
			   $selectedDeptID = $row['DeptID'];
				$assignDept = "UPDATE gradstudent SET DeptID = 'NULL' WHERE StudentID = '$uid'";
                mysqli_query($conn, $assignDept);
			}
            $assignMajorQuery = "INSERT INTO studentmajor (StudentID, MajorID) VALUES ('$uid', '$selectedMajorID')";
            mysqli_query($conn, $assignMajorQuery);
        }
         // Refresh the page to reflect the changes
        header("Location: view_academic_profile1.php");
        exit;
    } else {
        // The student has already declared two majors, show an error message or handle it as needed
        echo "You can only declare up to two majors or one major with one minor.";
    }
}

if (isset($_POST['assign_minor'])) {
    // Check how many majors the student has declared
    $countUserMajorsQuery = "SELECT COUNT(*) as totalMajors FROM studentmajor WHERE StudentID = '$uid'";
    $countUserMajorsResult = mysqli_query($conn, $countUserMajorsQuery);
    $countUserMajors = mysqli_fetch_assoc($countUserMajorsResult);
	
    $countUserMinorsQuery = "SELECT COUNT(*) as totalMinors FROM studentminor WHERE StudentID = '$uid'";
    $countUserMinorsResult = mysqli_query($conn, $countUserMinorsQuery);
    $countUserMinors = mysqli_fetch_assoc($countUserMinorsResult);

	if ($countUserMajors['totalMajors'] >= 2 || $countUserMinors['totalMinors'] >= 1) {
		if ($countUserMajors['totalMajors'] >= 2) {
			// The student has already declared two majors or one minor, show an error message or handle it as needed
			echo "You can only declare up to two majors. Minor assignment failed.";
			}
		else{
		echo "You can only declare one minor. Minor assignment failed.";
		}
		echo "Minor assignment failed.";
		}
	else {
        // Continue with the minor assignment process
        $selectedMinorID = mysqli_real_escape_string($conn, $_POST['minor']);
        
        // Check if the assignment already exists
        $checkAssignmentQuery = "SELECT * FROM studentminor WHERE StudentID = '$uid' AND MinorID = '$selectedMinorID'";
        $checkAssignmentResult = mysqli_query($conn, $checkAssignmentQuery);
        
        if (mysqli_num_rows($checkAssignmentResult) > 0) {
            echo "You are already assigned to this minor.";
        } else {
            // If the assignment doesn't exist, insert it into the database
            $assignMinorQuery = "INSERT INTO studentminor (StudentID, MinorID) VALUES ('$uid', '$selectedMinorID')";
            mysqli_query($conn, $assignMinorQuery);
            
            // Optionally, refresh the page to reflect the changes
            header("Location: view_academic_profile1.php");
            exit;
        }
    }
}



// Function to drop a major for a student
if (isset($_POST['drop_major_submit'])) {
    $selectedMajorToDrop = mysqli_real_escape_string($conn, $_POST['drop_major']);

    // Check if the selected major to drop exists in the user's declared majors
    if (in_array($selectedMajorToDrop, $userMajors)) {
        // Remove the selected major from the user's declared majors
        $key = array_search($selectedMajorToDrop, $userMajors);
        if ($key !== false) {
            unset($userMajors[$key]);
        }

        // Update the user's declared majors in the database
        $queryDeleteMajor = "DELETE FROM studentmajor WHERE StudentID = '$uid' AND MajorID = (SELECT MajorID FROM major WHERE MajorName = '$selectedMajorToDrop')";
        mysqli_query($conn, $queryDeleteMajor);

        // Optionally, you can add a success message or redirect the user
        echo "Major dropped successfully!";
    } else {
        // If the selected major doesn't exist in the user's declared majors, show an error message or handle it as needed
        echo "Selected major is not in your declared majors.";
    }
}

// Function to drop a minor for a student
if (isset($_POST['drop_minor_submit'])) {
    $selectedMinorToDrop = mysqli_real_escape_string($conn, $_POST['drop_minor']);

    // Check if the selected minor to drop exists in the user's declared minors
    if (in_array($selectedMinorToDrop, $userMinors)) {
        // Remove the selected minor from the user's declared minors
        $key = array_search($selectedMinorToDrop, $userMinors);
        if ($key !== false) {
            unset($userMinors[$key]);
        }

        // Update the user's declared minors in the database
        $queryDeleteMinor = "DELETE FROM studentminor WHERE StudentID = '$uid' AND MinorID = (SELECT MinorID FROM minor WHERE MinorName = '$selectedMinorToDrop')";
        mysqli_query($conn, $queryDeleteMinor);

        // Optionally, you can add a success message or redirect the user
        echo "Minor dropped successfully!";
    } else {
        // If the selected minor doesn't exist in the user's declared minors, show an error message or handle it as needed
        echo "Selected minor is not in your declared minors.";
    }
}



// Function to update user information
if (isset($_POST['update_user'])) {
    $newStreet = mysqli_real_escape_string($conn, $_POST['new_street']);
    $newCity = mysqli_real_escape_string($conn, $_POST['new_city']);
    $newState = mysqli_real_escape_string($conn, $_POST['new_state']);
    $newPassword = mysqli_real_escape_string($conn, $_POST['new_password']);

    // Check if the new password is not empty before updating
    $passwordUpdate = !empty($newPassword) ? ", Password = '$newPassword'" : "";

    // Update user information in the database
    $updateQuery = "UPDATE user SET Street = '$newStreet', City = '$newCity', State = '$newState'$passwordUpdate WHERE UID = '$uid'";
    mysqli_query($conn, $updateQuery);

    // Refresh the page to reflect the changes
    header("Location: view_academic_profile1.php?UID=someUserId");;
    exit;
}
$advisorQuery = "SELECT u.FirstName, u.LastName, l.Email 
                 FROM advisor a 
                 JOIN user u ON a.FacultyID = u.UID 
                 JOIN logintable l ON u.UID = l.UID 
                 WHERE a.StudentID = '$uid'";
$advisorResult = mysqli_query($conn, $advisorQuery);

?>

<!DOCTYPE html>
<html lang="en">
<head>
   <meta charset="UTF-8">
   <meta http-equiv="X-UA-Compatible" content="IE-edge">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <title>Academic Profile</title>


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
   <h1>Academic Profile</h1>
   <div class="button-container">
   <a href="faccreateschedule.php?UID=<?php echo $uid; ?>" class="btn">Create Schedule</a>
       <a href="facdegreeaudit.php?UID=<?php echo $uid; ?>" class="btn">Degree Audit</a>
       <a href="Update_a_user1.php" class="btn">Back</a>
       </div>
</div>

<div class="academic-profile-container">
   <h2>User Information</h2>
   <img src="profpic.jpg" alt="User Image" width="200">
   <p><strong>User ID:</strong> <?php echo $user['UID']; ?></p>
   <p><strong>Name:</strong> <?php echo $user['FirstName'] . ' ' . $user['LastName']; ?></p>
</div>


      <h2>Current Schedule</h2>
<table>
   <thead>
      <tr>
         <th>CRN</th>
         <th>Course Name</th>
         <th>Start Time</th>
         <th>End Time</th>
         <th>Faculty</th>
         <th>Section</th>
         <th>Room</th>
         <th>Building</th>
         <th>Day</th>
      </tr>
   </thead>
   <tbody>
      <?php
      $enrolledCoursesQuery = "SELECT 
      coursesection.CRN, 
      coursesection.CourseID, 
      coursesection.SectionNum, 
      timeslot.TimeSlotID, 
      day.Weekday, 
      course.CourseName, 
      room.RoomNum, 
      building.BuildingName, 
      periodd.StartTime, 
      periodd.EndTime,
      CONCAT(user.FirstName, ' ', user.LastName) AS FacultyName
  FROM studenthistory
  JOIN coursesection ON studenthistory.CRN = coursesection.CRN
  JOIN timeslot ON coursesection.TimeSlotID = timeslot.TimeSlotID
  JOIN day ON timeslot.DayID = day.DayID
  JOIN course ON coursesection.CourseID = course.CourseID
  JOIN periodd ON timeslot.PeriodID = periodd.PeriodID
  JOIN room ON coursesection.RoomID = room.RoomID
  JOIN building ON room.BuildingID = building.BuildingID
  JOIN user ON coursesection.FacultyID = user.UID
  WHERE studenthistory.StudentID = '$uid'";
  
$enrolledCoursesResult = mysqli_query($conn, $enrolledCoursesQuery);
      
      $enrolledCoursesResult = mysqli_query($conn, $enrolledCoursesQuery);

      while ($enrolledCourse = mysqli_fetch_assoc($enrolledCoursesResult)) {
         echo "<tr>";
         echo "<td>{$enrolledCourse['CRN']}</td>";
         echo "<td>{$enrolledCourse['CourseName']}</td>";
         echo "<td>{$enrolledCourse['StartTime']}</td>";
         echo "<td>{$enrolledCourse['EndTime']}</td>";
         echo "<td>{$enrolledCourse['FacultyName']}</td>";
         echo "<td>{$enrolledCourse['SectionNum']}</td>";
         echo "<td>{$enrolledCourse['RoomNum']}</td>";
         echo "<td>{$enrolledCourse['BuildingName']}</td>";
         echo "<td>{$enrolledCourse['Weekday']}</td>";
         echo "</tr>";
      }
      ?>
   </tbody>
</table>

<!-- Student Holds section -->
<div class="student-holds-container">
    <h2>Student Holds</h2>
    <table>
        <thead>
            <tr>
                <th>Hold ID</th>
                <th>Date Of Hold</th>
                <th>Hold Type</th>
            </tr>
        </thead>
        <tbody>
            <?php
            // Fetch and display the student's holds
            $studentHoldsQuery = "SELECT HoldID, DateOfHold, HoldType FROM hold WHERE StudentID = '$uid'";
            $studentHoldsResult = mysqli_query($conn, $studentHoldsQuery);

            while ($hold = mysqli_fetch_assoc($studentHoldsResult)) {
                echo "<tr>";
                echo "<td>{$hold['HoldID']}</td>";
                echo "<td>{$hold['DateOfHold']}</td>";
                echo "<td>{$hold['HoldType']}</td>";
                echo "</tr>";
            }
            ?>
        </tbody>
    </table>
</div>


      <h2>Current Major(s)</h2>
      <table>
         <thead>
            <tr>
               <th>Major Name</th>
            </tr>
         </thead>
         <tbody>
            <?php foreach ($userMajors as $userMajor) : ?>
               <tr>
                  <td><?php echo $userMajor; ?></td>
               </tr>
            <?php endforeach; ?>
         </tbody>
      </table>

      <h2>Current Minor(s)</h2>
      <table>
         <thead>
            <tr>
               <th>Minor Name</th>
            </tr>
         </thead>
         <tbody>
            <?php foreach ($userMinors as $userMinor) : ?>
               <tr>
                  <td><?php echo $userMinor; ?></td>
               </tr>
            <?php endforeach; ?>
         </tbody>
      </table>

      <h2>Assign Major</h2>
      <form action="" method="post">
         <select name="major">
            <option value="" disabled selected>Select a major</option>
            <?php foreach ($majors as $major) : ?>
               <option value="<?php echo $major['MajorID']; ?>"><?php echo $major['MajorName']; ?></option>
            <?php endforeach; ?>
         </select>
         <input type="submit" name="assign_major" value="Assign Major" class="create-button">
      </form>
      <h2>Assign Minor</h2>
      <form action="" method="post">
         <select name="minor">
            <option value="" disabled selected>Select a minor</option>
            <?php foreach ($minors as $minor) : ?>
               <option value="<?php echo $minor['MinorID']; ?>"><?php echo $minor['MinorName']; ?></option>
            <?php endforeach; ?>
         </select>
         <input type="submit" name="assign_minor" value="Assign Minor" class="create-button">
      </form>


      <h2>Drop Major</h2>
   <form action="" method="post">
      <select name="drop_major">
         <option value="" disabled selected>Select a major to drop</option>
         <?php foreach ($userMajors as $userMajor) : ?>
            <option value="<?php echo $userMajor; ?>"><?php echo $userMajor; ?></option>
         <?php endforeach; ?>
      </select>
      <input type="submit" name="drop_major_submit" value="Drop Major" class="create-button">
   </form>

   <h2>Drop Minor</h2>
<form action="" method="post">
   <select name="drop_minor">
      <option value="" disabled selected>Select a minor to drop</option>
      <?php foreach ($userMinors as $userMinor) : ?>
         <option value="<?php echo $userMinor; ?>"><?php echo $userMinor; ?></option>
      <?php endforeach; ?>
   </select>
   <input type="submit" name="drop_minor_submit" value="Drop Minor" class="create-button">
</form>




               <?php




               

               // Function to register a major for a student
if (isset($_POST['register_major_submit'])) {
    $selectedMajorID = mysqli_real_escape_string($conn, $_POST['register_major']);

    // Check if the registration already exists
    $checkRegistrationQuery = "SELECT * FROM studentmajor WHERE StudentID = '$uid' AND MajorID = '$selectedMajorID'";
    $checkRegistrationResult = mysqli_query($conn, $checkRegistrationQuery);

    if (mysqli_num_rows($checkRegistrationResult) > 0) {
        // If the registration exists, show a message or handle it as needed
        echo "You are already registered for this major.";
    } else {
        // If the registration doesn't exist, insert it into the database
        $registerMajorQuery = "INSERT INTO studentmajor (StudentID, MajorID) VALUES ('$uid', '$selectedMajorID')";
        mysqli_query($conn, $registerMajorQuery);

        // Optionally, you can add a success message or redirect the user
        echo "Major registered successfully!";
    }
}
               ?>
            </tbody>
         </table>
      </div>
   </div



<!-- Advisor section -->
<div class="advisor-container">
    <h2>Student Advisors</h2>
    <table>
        <thead>
            <tr>
                <th>Name</th>
                <th>Email</th>
            </tr>
        </thead>
        <tbody>
            <?php
            while ($advisor = mysqli_fetch_assoc($advisorResult)) {
                echo "<tr>";
                echo "<td>{$advisor['FirstName']} {$advisor['LastName']}</td>";
                echo "<td>{$advisor['Email']}</td>";
                echo "</tr>";
            }
            ?>
        </tbody>
    </table>
</div>
