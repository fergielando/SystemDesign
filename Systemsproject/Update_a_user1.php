<?php
@include 'config1.php';

// Function to retrieve users from the database
function getUsers($conn, $uid = null) {
    $query = "SELECT * FROM user";
    if ($uid) {
        $query .= " WHERE uid = '$uid'";
    }
    $result = mysqli_query($conn, $query);
    return mysqli_fetch_all($result, MYSQLI_ASSOC);
}

$users = getUsers($conn); // Get all users initially

// Search for a user by UID
if (isset($_POST['search'])) {
    $uid = mysqli_real_escape_string($conn, $_POST['search_uid']);
    $users = getUsers($conn, $uid); // Get users that match the UID
}

// Update user information
if (isset($_POST['submit'])) {
   
    $uid = mysqli_real_escape_string($conn, $_POST['uid']);
    $firstName = mysqli_real_escape_string($conn, $_POST['firstName']);
    $lastName = mysqli_real_escape_string($conn, $_POST['lastName']);
    $gender = mysqli_real_escape_string($conn, $_POST['gender']);
    $dob = mysqli_real_escape_string($conn, $_POST['dob']);
    $street = mysqli_real_escape_string($conn, $_POST['street']);
    $city = mysqli_real_escape_string($conn, $_POST['city']);
    $state = mysqli_real_escape_string($conn, $_POST['state']);
    $zipcode = mysqli_real_escape_string($conn, $_POST['zipcode']);
    

    
    $updateUserQuery = "UPDATE user SET firstname='$firstName', lastname='$lastName', gender='$gender', dob='$dob', street='$street', city='$city', state='$state', zipcode='$zipcode' WHERE uid='$uid'";
    mysqli_query($conn, $updateUserQuery);

   

   
    header('location:admin_page1.php');
}

if (isset($_GET['uid'])) { 
    $uid = mysqli_real_escape_string($conn, $_GET['uid']);
    $getUserQuery = "SELECT * FROM user WHERE uid='$uid'";
    $result = mysqli_query($conn, $getUserQuery);
    $user = mysqli_fetch_assoc($result);
}
?>
<style>
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

   .header .logo {
         width: 50px; 
         height: 50px; 
      }
   .buttons {
      display: flex;
      align-items: center;
   }

   .back-button,
   .create-user-button {
      background: #333;
      color: #fff;
      padding: 10px 20px;
      text-decoration: none;
      border-radius: 5px;
      margin-right: 10px;
   }

   .back-button:hover,
   .create-user-button:hover {
      background: #000;
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
<meta charset="UTF-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>

<div class="header">
      <h1>Department Management</h1>
      <a href="admin_page1.php" class="btn">Back to Admin Page</a>
      <a href="create_a_user1.php" class="btn">Create a User</a>

   </div>

<!-- Search Form -->
<div class="search-container">
   <form action="" method="post">
      <input type="text" name="search_uid" required placeholder="Enter UID to search">
      <input type="submit" name="search" value="Search" class="form-btn">
   </form>
</div>

<!-- Users Table -->
<div class="user-table">
<table>
   <tr>
      <th>UID</th>
      <th>First Name</th>
      <th>Last Name</th>
      <th>Gender</th>
      <th>Date of Birth</th>
      <th>Street</th>
      <th>City</th>
      <th>State</th>
      <th>ZipCode</th>
      <th>Edit</th>
      <th>View Academic Profile</th>
     
   </tr>
   <?php foreach ($users as $user): ?>
   <tr>
      <td><?php echo htmlspecialchars($user['UID']); ?></td>
      <td><?php echo htmlspecialchars($user['FirstName']); ?></td>
      <td><?php echo htmlspecialchars($user['LastName']); ?></td>
      <td><?php echo htmlspecialchars($user['Gender']); ?></td>
      <td><?php echo htmlspecialchars($user['DOB']); ?></td>
      <td><?php echo htmlspecialchars($user['Street']); ?></td>
      <td><?php echo htmlspecialchars($user['City']); ?></td>
      <td><?php echo htmlspecialchars($user['State']); ?></td>
      <td><?php echo htmlspecialchars($user['ZipCode']); ?></td>
      <td><a href="edit_user.php?UID=<?php echo $user['UID']; ?>">Edit</a></td>
      <td><a href="view_academic_profile1.php?UID=<?php echo $user['UID']; ?>">View Academic Profile</a></td>
   </tr>
   <?php endforeach; ?>
</table>

</div>

<!-- Your existing scripts and footer here -->

</body>
</html>


