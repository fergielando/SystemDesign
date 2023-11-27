<?php
// Include database configuration file and start session
@include 'config1.php';
session_start();

// Check if user is logged in
if (!isset($_SESSION['UID'])) {
    // Redirect to login page or display a login link
    echo "Please log in. <a href='login_page1.php'>Login Here</a>";
    exit;
}

// Check if CRN parameter is provided
if (!isset($_GET['CRN'])) {
    echo "CRN parameter is missing.";
    exit;
}

$CRN = $_GET['CRN'];

// Fetch the class roster for the specified CRN
$query = "SELECT student.StudentID, student.FirstName, student.LastName, student.Email
          FROM enrollment
          JOIN student ON enrollment.StudentID = student.StudentID
          WHERE enrollment.CRN = '$CRN'";
$result = mysqli_query($conn, $query);

$students = [];
while ($row = mysqli_fetch_assoc($result)) {
    $students[] = $row;
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
   <meta charset="UTF-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <title>Class Roster</title>
   <!-- Add your CSS link here -->
   <link rel="stylesheet" href="path_to_your_stylesheet.css">

   <style>
      /* Your CSS styles for the page can be added here */
   </style>
</head>
<body>
   <!-- Header and navigation can be similar to your previous page -->

   <!-- Class Roster -->
   <h2>Class Roster for CRN: <?php echo $CRN; ?></h2>

   <table>
      <thead>
         <tr>
            <th>Student ID</th>
            <th>First Name</th>
            <th>Last Name</th>
            <th>Email</th>
         </tr>
      </thead>
      <tbody>
         <?php foreach ($students as $student): ?>
            <tr>
               <td><?php echo $student['StudentID']; ?></td>
               <td><?php echo $student['FirstName']; ?></td>
               <td><?php echo $student['LastName']; ?></td>
               <td><?php echo $student['Email']; ?></td>
            </tr>
         <?php endforeach; ?>
      </tbody>
   </table>

   <!-- Add any additional content or styling as needed -->

</body>
</html>
