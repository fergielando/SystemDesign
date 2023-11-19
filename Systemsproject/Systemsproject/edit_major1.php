<?php
@include 'config1.php';

// Check if a major ID is provided in the URL
if (isset($_GET['id'])) {
    $majorID = mysqli_real_escape_string($conn, $_GET['id']);

    // Retrieve the major information from the database based on the provided major ID
    $query = "SELECT * FROM major WHERE MajorID = '$majorID'";
    $result = mysqli_query($conn, $query);

    if (mysqli_num_rows($result) > 0) {
        $major = mysqli_fetch_assoc($result);
    } else {
        // Handle the case where the major with the given ID doesn't exist
        echo "Major not found.";
        exit;
    }
} else {
    // Handle the case where no major ID is provided in the URL
    echo "Major ID not provided.";
    exit;
}

// Update major information
if (isset($_POST['update'])) {
    $newDeptID = mysqli_real_escape_string($conn, $_POST['newDeptID']);
    $newMajorName = mysqli_real_escape_string($conn, $_POST['newMajorName']);

    $updateQuery = "UPDATE major SET DeptID = '$newDeptID', MajorName = '$newMajorName' WHERE MajorID = '$majorID'";

    if (mysqli_query($conn, $updateQuery)) {
        // Redirect back to the majors list page after the update is successful
        header('location:Majors1.php');
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
   <title>Edit Major</title>

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

      .major-container {
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

      .edit-button {
         background: #000;
         color: #fff;
         padding: 10px 20px;
         text-decoration: none;
         border-radius: 5px;
         margin: 5px;
         display: inline-block;
      }
      </style>
<body>

   <div class="header">
      <h1>Edit Major</h1>
      <a href="majors1.php" class="back-button">Back to Majors List</a>
   </div>

   <div class="edit-major-container">
      <h2>Edit Major Information</h2>
      <form action="" method="post">
    <input type="text" name="newDeptID" placeholder="Department ID" value="<?php echo $major['DeptID']; ?>">
    <input type="text" name="newMajorName" placeholder="MajorName" value="<?php echo $major['MajorName']; ?>">
    <input type="submit" name="update" value="Update">
       </form>

   </div>

   <!-- Add any other elements or styling as needed -->

</body>
</html>
