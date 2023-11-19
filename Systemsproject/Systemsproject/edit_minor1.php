<?php
@include 'config1.php';

// Check if a minor ID is provided in the URL
if (isset($_GET['id'])) {
    $minorID = mysqli_real_escape_string($conn, $_GET['id']);

    // Retrieve the minor information from the database based on the provided minor ID
    $query = "SELECT * FROM minor WHERE MinorID = '$minorID'";
    $result = mysqli_query($conn, $query);

    if (mysqli_num_rows($result) > 0) {
        $minor = mysqli_fetch_assoc($result);
    } else {
        // Handle the case where the minor with the given ID doesn't exist
        echo "Minor not found.";
        exit;
    }
} else {
    // Handle the case where no minor ID is provided in the URL
    echo "Minor ID not provided.";
    exit;
}

// Update minor information
if (isset($_POST['update'])) {
    $newDeptID = mysqli_real_escape_string($conn, $_POST['newDeptID']);
    $newMinorName = mysqli_real_escape_string($conn, $_POST['newMinorName']);

    $updateQuery = "UPDATE minor SET DeptID = '$newDeptID', MinorName = '$newMinorName' WHERE MinorID = '$minorID'";

    if (mysqli_query($conn, $updateQuery)) {
        // Redirect back to the minors list page after the update is successful
        header('location:minors1.php');
    } else {
        // Handle the case where the update fails
        echo "Update failed. Please try again.";
    }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
   <meta charset="UTF-8">
   <meta http-equiv="X-UA-Compatible" content="IE-edge">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <title>Edit Minor</title>

   <link rel="stylesheet" href="css/fatman1.css">

   <style>
      /* Add your custom styles here */
   </style>
</head>
<body>

   <div class "header">
      <h1>Edit Minor</h1>
      <a href="minors1.php" class="back-button">Back to Minors List</a>
   </div>

   <div class="edit-minor-container">
      <h2>Edit Minor Information</h2>
      <form action="" method="post">
         <input type="text" name="newDeptID" placeholder="Dept ID" value="<?php echo $minor['DeptID']; ?>">
         <input type="text" name="newMinorName" placeholder="MinorName" value="<?php echo $minor['MinorName']; ?>">
         <input type="submit" name="update" value="Update">
      </form>
   </div>

   <!-- Add any other elements or styling as needed -->

</body>
</html>








