<?php
@include 'config1.php';

session_start();

// Check if a UID is stored in the session
if (isset($_SESSION['UID'])) {
    $uid = $_SESSION['UID'];

// Replace your existing query to fetch user information with the new query
$query = "SELECT u.*, s.UnderGradStudentType FROM user u
          JOIN undergradstudent s ON u.UID = s.StudentID
          WHERE u.UID = '$uid'";
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

    if ($countUserMajors['totalMajors'] < 2) {
        // If the student has declared less than two majors, proceed to assign the major
        // Check if the assignment already exists
        $checkAssignmentQuery = "SELECT * FROM studentmajor WHERE StudentID = '$uid' AND MajorID = '$selectedMajorID'";
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
    } else {
        // The student has already declared two majors, show an error message or handle it as needed
        echo "You can only declare up to two majors.";
    }
}
// Function to assign a minor to a student
if (isset($_POST['assign_minor'])) {
    // Check how many minors the student has declared
    $countUserMinorsQuery = "SELECT COUNT(*) as totalMinors FROM studentminor WHERE StudentID = '$uid'";
    $countUserMinorsResult = mysqli_query($conn, $countUserMinorsQuery);
    $countUserMinors = mysqli_fetch_assoc($countUserMinorsResult);

    if ($countUserMinors['totalMinors'] >= 1) {
        // The student has already declared a minor, show an error message or handle it as needed
        echo "You can only declare one minor.";
    } else {
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
            header("Location: student_academic_profile1.php");
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
        // Update the user's declared minors in the database
        $queryDeleteMinor = "DELETE FROM studentminor WHERE StudentID = '$uid' AND MinorID = (SELECT MinorID FROM minor WHERE MinorName = '$selectedMinorToDrop' LIMIT 1)";

        // Perform the query and handle errors
        $result = mysqli_query($conn, $queryDeleteMinor);

        if ($result) {
            // Remove the selected minor from the user's declared minors
            $key = array_search($selectedMinorToDrop, $userMinors);
            if ($key !== false) {
                unset($userMinors[$key]);
            }

            // Optionally, you can add a success message or redirect the user
            echo "Minor dropped successfully!";
        } else {
            // Display the specific error message
            echo "Query failed: " . mysqli_error($conn);
        }
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
    $updateQuery = "UPDATE logintable, user SET Street = '$newStreet', City = '$newCity', State = '$newState' $passwordUpdate WHERE UID = '$uid'";

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

// Retrieve holds for the student
$queryHolds = "SELECT HoldID, DateOfHold, HoldType FROM hold WHERE StudentID = '$uid'";
$resultHolds = mysqli_query($conn, $queryHolds);
$holds = [];

while ($rowHold = mysqli_fetch_assoc($resultHolds)) {
    $holds[] = $rowHold;
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

   <link rel="stylesheet" href="css/fatman1.css">

   <style>
       body {
        font-family: Arial, sans-serif;
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
        background-color: #fff; /* White table background color */
    }

    table, th, td {
        border: 1px solid #000;
    }

    th, td {
        padding: 12px;
        text-align: left;
        color: #000; /* Black text color */
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

      .back-button {
        background: #000;
        color: #fff;
        padding: 10px 20px;
        text-decoration: none;
        border-radius: 5px;
        margin-right: 10px;
        transition: background-color 0.3s; /* Smooth transition for background color change */
    }

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

.advisor-container {
    position: absolute;
    bottom: 10px;
    right: 90px;
    background-color: #fff;
    padding: 10px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    max-width: 300px; /* Adjust the width as needed */
}
    </style>
</head>
<body>



   <div class="header">
      <h1>Academic Profile</h1>
      <div class="button-container">
      <a href="Create Schedule1.php" class="back-button">Create Schedule</a>
      <a href="DegreeAudit1.php" class="back-button">Degree Audit</a>
      <a href="user_page1.php" class="back-button">Back</a>
   </div>
   </head>
   </div>

   <div class="academic-profile-container">
    
   <h2>User Information</h2>
<img src="profpic.jpg" alt="User Image" width="200">
<p><strong>User ID:</strong> <?php echo $user['UID']; ?></p>
<p><strong>Name:</strong> <?php echo $user['FirstName'] . ' ' . $user['LastName']; ?></p>
<p><strong>Student Status:</strong> <?php echo $user['UnderGradStudentType']; ?></p>

      

      <div class="student-holds-container">
      <h2>Holds</h2>
<table>
    <thead>
        <tr>
            <th>Hold ID</th>
            <th>Date of Hold</th>
            <th>Hold Type</th>
        </tr>
    </thead>
    <tbody>
        <?php foreach ($holds as $hold) : ?>
            <tr>
                <td><?php echo $hold['HoldID']; ?></td>
                <td><?php echo $hold['DateOfHold']; ?></td>
                <td><?php echo $hold['HoldType']; ?></td>
            </tr>
        <?php endforeach; ?>
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

      <form action="" method="post">
    <label for="student_status">Student Status:</label>
    <select name="student_status" id="student_status">
        <option value="full-time" <?php echo ($user['UnderGradStudentType'] == 'Full-Time') ? 'selected' : ''; ?>>Full-Time</option>
        <option value="part-time" <?php echo ($user['UnderGradStudentType'] == 'Part-Time') ? 'selected' : ''; ?>>Part-Time</option>
    </select>
    <input type="submit" name="update_student_status" value="Update Status" class="create-button">
</form>
<?php if (isset($_POST['update_student_status'])) {
    $selectedStatus = mysqli_real_escape_string($conn, $_POST['student_status']);

    // Update the student's status in the undergradstudent table
    $updateStatusQuery = "UPDATE undergradstudent SET UnderGradStudentType = '$selectedStatus' WHERE StudentID = '$uid'";
    $updateStatusResult = mysqli_query($conn, $updateStatusQuery);

    if ($updateStatusResult) {
        // Successfully updated student status
        echo "Student status updated successfully!";
        // Optionally, you can redirect the user or perform other actions
    } else {
        // Failed to update student status
        echo "Error updating student status. Please try again.";
    }
}
 ?>



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
            <!-- <label for="new_password">New Password:</label>
            <input type="password" name="new_password" id="new_password"><br> --> 
            <input type="submit" name="update_user" value="Update User" class="create-button">
         </form>
      </div>
      <!-- Add this section in your HTML form -->
<h2>Change Password</h2>
<form action="" method="post">
   <label for="current_password">Current Password:</label>
   <input type="password" name="current_password" id="current_password" required><br>
   <label for="new_password">New Password:</label>
   <input type="password" name="new_password" id="new_password" required><br>
   <label for="confirm_new_password">Confirm New Password:</label>
   <input type="password" name="confirm_new_password" id="confirm_new_password" required><br>
   <input type="submit" name="change_password" value="Change Password" class="create-button">
</form>

   </div>
   <script>
   function goBack() {
            window.history.back();
        }
        </script>
</body>
</html>

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