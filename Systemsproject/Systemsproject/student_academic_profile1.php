<?php
@include 'config1.php';

session_start();

// Check if a UID is stored in the session
if (isset($_SESSION['UID'])) {
    $uid = $_SESSION['UID'];

    // Retrieve the user's information from the database
    $query = "SELECT * FROM user WHERE UID = '$uid'";
    $result = mysqli_query($conn, $query);

    if (mysqli_num_rows($result) > 0) {
        $user = mysqli_fetch_assoc($result);
    } else {
        echo "User not found.";
        exit;
    }
} else {
    echo "UID not found in the session.";
    exit;
}

// Retrieve majors, minors, and enrolled courses
$queryMajors = "SELECT * FROM major";
$resultMajors = mysqli_query($conn, $queryMajors);
$majors = [];

while ($rowMajor = mysqli_fetch_assoc($resultMajors)) {
    $majors[] = $rowMajor;
}

$queryMinors = "SELECT * FROM minor";
$resultMinors = mysqli_query($conn, $queryMinors);
$minors = [];

while ($rowMinor = mysqli_fetch_assoc($resultMinors)) {
    $minors[] = $rowMinor;
}

$queryUserMajor = "SELECT MajorName FROM studentmajor INNER JOIN major ON studentmajor.MajorID = major.MajorID WHERE StudentID = '$uid'";
$resultUserMajor = mysqli_query($conn, $queryUserMajor);
$userMajor = mysqli_fetch_assoc($resultUserMajor);

$queryUserMinor = "SELECT MinorName FROM studentminor INNER JOIN minor ON studentminor.MinorID = minor.MinorID WHERE StudentID = '$uid'";
$resultUserMinor = mysqli_query($conn, $queryUserMinor);
$userMinor = mysqli_fetch_assoc($resultUserMinor);



// Function to assign a major to a student
if (isset($_POST['assign_major'])) {
    $selectedMajorID = mysqli_real_escape_string($conn, $_POST['major']);
    
    // Check if the assignment already exists
    $checkAssignmentQuery = "SELECT * FROM studentmajor WHERE StudentID = '$uid'";
    $checkAssignmentResult = mysqli_query($conn, $checkAssignmentQuery);

    if (mysqli_num_rows($checkAssignmentResult) > 0) {
        // If the assignment exists, update it in the database
        $assignMajorQuery = "UPDATE studentmajor SET MajorID = '$selectedMajorID' WHERE StudentID = '$uid'";
        mysqli_query($conn, $assignMajorQuery);
    } else {
        // If the assignment doesn't exist, insert it into the database
        $assignMajorQuery = "INSERT INTO studentmajor (StudentID, MajorID) VALUES ('$uid', '$selectedMajorID')";
        mysqli_query($conn, $assignMajorQuery);
    }
    // Refresh the page to reflect the changes
    header("Location: student_academic_profile1.php");
    exit;
}

// Function to assign a minor to a student
if (isset($_POST['assign_minor'])) {
    $selectedMinorID = mysqli_real_escape_string($conn, $_POST['minor']);
    
    // Check if the assignment already exists
    $checkAssignmentQuery = "SELECT * FROM studentminor WHERE StudentID = '$uid'";
    $checkAssignmentResult = mysqli_query($conn, $checkAssignmentQuery);

    if (mysqli_num_rows($checkAssignmentResult) > 0) {
        // If the assignment exists, update it in the database
        $assignMinorQuery = "UPDATE studentminor SET MinorID = '$selectedMinorID' WHERE StudentID = '$uid'";
        mysqli_query($conn, $assignMinorQuery);
    } else {
        // If the assignment doesn't exist, insert it into the database
        $assignMinorQuery = "INSERT INTO studentminor (StudentID, MinorID) VALUES ('$uid', '$selectedMinorID')";
        mysqli_query($conn, $assignMinorQuery);
    }
    // Refresh the page to reflect the changes
    header("Location: student_academic_profile1.php");
    exit;
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
    header("Location: student_academic_profile1.php");
    exit;

    
}
?>


<!DOCTYPE html>
<html lang="en">
<head>
   <meta charset="UTF-8">
   <meta http-equiv="X-UA-Compatible" content="IE-edge">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <title>Academic Profile</title>

   <link rel="stylesheet" href="css/fatman1.css">

   <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
            margin: 0;
            padding: 0;
        }

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

        .header .back-button {
            background: #000;
            color: #fff;
            padding: 10px 20px;
            text-decoration: none;
            border-radius: 5px;
            margin-right: 10px;
        }

        .academic-profile-container {
            padding: 20px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }

        table, th, td {
            border: 1px solid #000;
        }

        th, td {
            padding: 12px;
            text-align: left;
        }

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

        select, input {
            padding: 8px;
            margin-right: 10px;
        }

        h2 {
            margin-top: 20px;
            margin-bottom: 10px;
        }

        /* Updated styles for user information */
        h2, p {
            font-size: 18px;
            margin-bottom: 5px;
        }

        p strong {
            font-size: 20px;
        }

        /* Updated styles for user options */
        .user-options-container {
            margin-top: 20px;
        }

        .user-options-container input {
            margin-bottom: 10px;
        }

        .top-right-container {
         position: absolute;
         top: 100px;
         right: 0;
         width: 50%; /* Set the width to occupy half of the page */
         box-sizing: border-box; /* Include padding and border in the width */
         padding: 20px;
      }

      /* Style the table within the top-right container */
      .enrolled-courses-table {
         width: 100%;
         border-collapse: collapse;
         margin-bottom: 20px;
      }

      .enrolled-courses-table, th, td {
         border: 1px solid #000;
      }
    </style>
</head>
<body>

   <div class="header">
      <h1>Academic Profile</h1>
      <a href="user_page1.php" class="back-button">Back to Student Portal</a>
      <a href="Create Schedule1.php" class="back-button">Create Schedule</a>
   </div>

   <div class="academic-profile-container">
      <h2>User Information</h2>
      <img src="profpic.jpg" alt="User Image" width="200">
      <p><strong>User ID:</strong> <?php echo $user['UID']; ?></p>
      <p><strong>Name:</strong> <?php echo $user['FirstName'] . ' ' . $user['LastName']; ?></p>

      <h2>Current Major</h2>
      <p><?php echo (!empty($userMajor['MajorName'])) ? $userMajor['MajorName'] : 'Not assigned'; ?></p>

      <h2>Current Minor</h2>
      <p><?php echo (!empty($userMinor['MinorName'])) ? $userMinor['MinorName'] : 'Not assigned'; ?></p>

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

      <div class="top-right-container">
      <h2>Course History</h2>
      <table class="enrolled-courses-table">
            <thead>
               <tr>
                  <th>CRN</th>
                  <th>Course Name</th>
                  <th>Day</th>
                  <th>Building</th>
                  <th>Room</th>
                  <th>Section</th>
                  <th>Time</th>
               </tr>
            </thead>
            <tbody>
               <?php
               // Fetch and display currently enrolled courses
               $enrolledCoursesQuery = "SELECT coursesection.CRN, coursesection.CourseID, coursesection.SectionNum, timeslot.TimeSlotID, day.Weekday, masterschedule.CourseName, room.RoomNum, building.BuildingName, periodd.StartTime, periodd.EndTime 
                                       FROM studenthistory
                                       JOIN coursesection ON studenthistory.CRN = coursesection.CRN
                                       JOIN timeslot ON coursesection.TimeSlotID = timeslot.TimeSlotID
                                       JOIN day ON timeslot.DayID = day.DayID
                                       JOIN masterschedule ON coursesection.CourseID = masterschedule.CourseID
                                       JOIN periodd ON timeslot.PeriodID = periodd.PeriodID
                                       JOIN room ON coursesection.RoomID = room.RoomID
                                       JOIN building ON room.BuildingID = building.BuildingID
                                       WHERE studenthistory.StudentID = '$uid'";
               $enrolledCoursesResult = mysqli_query($conn, $enrolledCoursesQuery);

               while ($enrolledCourse = mysqli_fetch_assoc($enrolledCoursesResult)) {
                  echo "<tr>";
                  echo "<td>{$enrolledCourse['CRN']}</td>";
                  echo "<td>{$enrolledCourse['CourseName']}</td>";
                  echo "<td>{$enrolledCourse['Weekday']}</td>";
                  echo "<td>{$enrolledCourse['BuildingName']}</td>";
                  echo "<td>{$enrolledCourse['RoomNum']}</td>";
                  echo "<td>{$enrolledCourse['SectionNum']}</td>";
                  echo "<td>{$enrolledCourse['StartTime']} to {$enrolledCourse['EndTime']}</td>";
                  echo "</tr>";
               }
               ?>
            </tbody>
         </table>
      </div>
   </div


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

   <!-- Add any other elements or styling as needed -->

</body>
</html>






