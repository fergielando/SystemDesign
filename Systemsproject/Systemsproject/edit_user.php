<?php
@include 'config1.php';

// Check if a UID has been passed to the script
if (isset($_GET['UID'])) {
    $uid = mysqli_real_escape_string($conn, $_GET['UID']);

    // Retrieve the user's information from the database
    $getUserQuery = "SELECT * FROM user WHERE UID = '$uid'";
    $result = mysqli_query($conn, $getUserQuery);

    if (mysqli_num_rows($result) > 0) {
        $user = mysqli_fetch_assoc($result);
    } else {
        die("User not found.");
    }
} else {
    die("No UID provided.");
}

// Process the form when it is submitted to update the user
if (isset($_POST['update'])) {
    // Assign updated values from the form to variables
    $firstName = mysqli_real_escape_string($conn, $_POST['FirstName']);
    $lastName = mysqli_real_escape_string($conn, $_POST['LastName']);
    $gender = mysqli_real_escape_string($conn, $_POST['Gender']);
    $dob = mysqli_real_escape_string($conn, $_POST['DOB']);
    $street = mysqli_real_escape_string($conn, $_POST['Street']);
    $city = mysqli_real_escape_string($conn, $_POST['City']);
    $state = mysqli_real_escape_string($conn, $_POST['State']);
    $zipcode = mysqli_real_escape_string($conn, $_POST['ZipCode']);

    // Update query
    $updateQuery = "UPDATE user SET FirstName = '$firstName', LastName = '$lastName', Gender = '$gender', DOB = '$dob', Street = '$street', City = '$city', State = '$state', ZipCode = '$zipcode' WHERE UID = '$uid'";

    if (mysqli_query($conn, $updateQuery)) {
        // Redirect to the admin page with a success message
        header('Location: admin_page1.php?status=success');
    } else {
        echo "Error updating user: " . mysqli_error($conn);
    }
}
?>
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


      .buttons {
         display: flex;
         align-items: center;
      }
      .header .back-button {
         background: #000;
         color: #fff;
         padding: 10px 20px;
         text-decoration: none;
         border-radius: 5px;
         margin-right: 10px;
      }
      .buttons a {
         margin-left: 20px;
         background: #000;
         color: #fff;
         padding: 10px 30px;
         text-decoration: none;
         border-radius: 5px;
      }

      .button-container .btn:hover {
         background: #333;
      }
      .header .logo {
         width: 50px; 
         height: 50px; 
      }
      
   table {
      width: 100%; /* Full width */
      max-width: 100%; /* Ensures table is not wider than its container */
      border-collapse: collapse;
      table-layout: auto; /* New line: Ensures the table respects the width */
   }

   th, td {
      border: 1px solid #000;
      padding: 15px;
      text-align: left;
      font-size: 14px;
      word-wrap: break-word; /* New line: Allows words to break and wrap */
   }

   th {
      background-color: #f2f2f2; /* Gives a slight background color to the header */
   }

   /* Style for every other row */
   tr:nth-child(even) {
      background-color: #ccffcc; /* Light green background */
   }
  
</style>
<!DOCTYPE html>
<html lang="en">
<head>
    <!-- Include your meta tags, title, and CSS link here. -->
    <title>Edit User</title>
</head>
<body>

<div class="form-container">
    <form action="" method="post">
        <h3>Edit User Details</h3>
        <!-- Include hidden UID field to ensure we know which user to update -->
        <input type="hidden" name="UID" value="<?php echo htmlspecialchars($user['UID']); ?>">
        <input type="text" name="FirstName" value="<?php echo htmlspecialchars($user['FirstName']); ?>" required>
        <input type="text" name="LastName" value="<?php echo htmlspecialchars($user['LastName']); ?>" required>
        <select name="Gender" required>
            <option value="M" <?php echo $user['Gender'] == 'M' ? 'selected' : ''; ?>>Male</option>
            <option value="F" <?php echo $user['Gender'] == 'F' ? 'selected' : ''; ?>>Female</option>
            <option value="O" <?php echo $user['Gender'] == 'O' ? 'selected' : ''; ?>>Other</option>
        </select>
        <input type="date" name="DOB" value="<?php echo htmlspecialchars($user['DOB']); ?>" required>
        <input type="text" name="Street" value="<?php echo htmlspecialchars($user['Street']); ?>" required>
        <input type="text" name="City" value="<?php echo htmlspecialchars($user['City']); ?>" required>
        <input type="text" name="State" value="<?php echo htmlspecialchars($user['State']); ?>" required>
        <input type="text" name="ZipCode" value="<?php echo htmlspecialchars($user['ZipCode']); ?>" required>
        <input type="submit" name="update" value="Update User">
    </form>
</div>

</body>
</html>
