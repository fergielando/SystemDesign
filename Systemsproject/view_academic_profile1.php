<?php
@include 'config1.php';

// Check if a UID is provided in the URL
if (isset($_GET['UID'])) {
    $uid = mysqli_real_escape_string($conn, $_GET['UID']);

    // Retrieve the user's information from the database based on the provided UID
    $query = "SELECT * FROM user WHERE UID = '$uid'";
    $result = mysqli_query($conn, $query);

    if (mysqli_num_rows($result) > 0) {
        $user = mysqli_fetch_assoc($result);
    } else {
        // Handle the case where the user with the given UID doesn't exist
        echo "User not found.";
        exit;
    }
} else {
    // Handle the case where no UID is provided in the URL
    echo "UID not provided.";
    exit;
}

// Retrieve a list of majors from the database
$queryMajors = "SELECT * FROM major";
$resultMajors = mysqli_query($conn, $queryMajors);
$majors = [];

while ($rowMajor = mysqli_fetch_assoc($resultMajors)) {
    $majors[] = $rowMajor;
}

// Retrieve a list of minors from the database
$queryMinors = "SELECT * FROM minor";
$resultMinors = mysqli_query($conn, $queryMinors);
$minors = [];

while ($rowMinor = mysqli_fetch_assoc($resultMinors)) {
    $minors[] = $rowMinor;
}

// Function to assign a major to a student
if (isset($_POST['assign_major'])) {
    $selectedMajorID = mysqli_real_escape_string($conn, $_POST['major']);
    
    // Check if the assignment already exists
    $checkAssignmentQuery = "SELECT * FROM studentmajor WHERE StudentID = '$uid' AND MajorID = '$selectedMajorID'";
    $checkAssignmentResult = mysqli_query($conn, $checkAssignmentQuery);

    if (mysqli_num_rows($checkAssignmentResult) == 0) {
        // If the assignment doesn't exist, insert it into the database
        $assignMajorQuery = "INSERT INTO studentmajor (StudentID, MajorID) VALUES ('$uid', '$selectedMajorID')";
        mysqli_query($conn, $assignMajorQuery);
    }
}

// Function to assign a minor to a student
if (isset($_POST['assign_minor'])) {
    $selectedMinorID = mysqli_real_escape_string($conn, $_POST['minor']);
    
    // Check if the assignment already exists
    $checkAssignmentQuery = "SELECT * FROM studentminor WHERE StudentID = '$uid' AND MinorID = '$selectedMinorID'";
    $checkAssignmentResult = mysqli_query($conn, $checkAssignmentQuery);

    if (mysqli_num_rows($checkAssignmentResult) == 0) {
        // If the assignment doesn't exist, insert it into the database
        $assignMinorQuery = "INSERT INTO studentminor (StudentID, MinorID) VALUES ('$uid', '$selectedMinorID')";
        mysqli_query($conn, $assignMinorQuery);
    }
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
      }

      .header .back-button {
         background: #000;
         color: #fff;
         padding: 10px 20px;
         text-decoration: none;
         border-radius: 5px;
         margin-right: 10px;
      }

      .department-container {
         padding: 20px;
      }

      table {
         width: 100%;
         border-collapse: collapse;
      }

      table, th, td {
         border: 1px solid #000;
      }

      th, td {
         padding: 8px;
         text-align: left;
      }

      .create-button {
        background: #000;
        color: #fff;
        padding: 10px 20px;
        text-decoration: none;
        border-radius: 5px;
        margin: 10px;
        display: inline-block;
    }
   </style>
</head>
<body>

   <div class="header">
      <h1>Academic Profile</h1>
      <a href="Update_a_user1.php" class="back-button">Back to User Page</a>
   </div>

   <div class="academic-profile-container">
      <h2>User Information</h2>
      <!-- Display user information here, such as UID, first name, last name, and other details -->

      <h2>Assign Major</h2>
      <form action="" method="post">
         <select name="major">
            <option value="" disabled selected>Select a major</option>
            <?php foreach ($majors as $major) : ?>
               <option value="<?php echo $major['MajorID']; ?>"><?php echo $major['MajorName']; ?></option>
            <?php endforeach; ?>
         </select>
         <input type="submit" name="assign_major" value="Assign Major">
      </form>

      <h2>Assign Minor</h2>
      <form action="" method="post">
         <select name="minor">
            <option value="" disabled selected>Select a minor</option>
            <?php foreach ($minors as $minor) : ?>
               <option value="<?php echo $minor['MinorID']; ?>"><?php echo $minor['MinorName']; ?></option>
            <?php endforeach; ?>
         </select>
         <input type="submit" name="assign_minor" value="Assign Minor">
      </form>
   </div>

   <!-- Add any other elements or styling as needed -->

</body>
</html>
