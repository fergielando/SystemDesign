<?php
@include 'config1.php';

// Function to retrieve users from the database with filters
function getUsers($conn, $filters = []) {
   $query = "SELECT u.*, l.UserType FROM user u LEFT JOIN logintable l ON u.UID = l.UID WHERE 1=1";

   foreach ($filters as $key => $value) {
       if (!empty($value)) {
           $value = mysqli_real_escape_string($conn, $value);
           if ($key === 'UserType') {
               // Filter by UserType
               $query .= " AND l.UserType = '$value'";
           } else {
               // Filter by other fields
               $query .= " AND u.$key LIKE '%$value%'";
           }
       }
   }

   $result = mysqli_query($conn, $query);
   return mysqli_fetch_all($result, MYSQLI_ASSOC);
}



// Handle filter request
$filters = [];
if (isset($_POST['filter'])) {
   $filters['UID'] = $_POST['UID'] ?? '';
    $filters['FirstName'] = $_POST['FirstName'] ?? '';
    $filters['LastName'] = $_POST['LastName'] ?? '';
    $filters['Gender'] = $_POST['Gender'] ?? '';
    $filters['City'] = $_POST['City'] ?? '';
    $filters['UserType'] = $_POST['UserType'] ?? '';
}

$users = getUsers($conn, $filters); // Get filtered users

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
  /* General Styles */
/* General Styles */
body {
  font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
  color: #333;
  background-color: #eaeaea; /* Lighter background for less strain */
  margin: 0;
  padding: 0;
}

.header {
  background-color: #003366; /* Darker blue for less brightness */
  color: #ffffff;
  padding: 10px 20px;
  display: flex;
  justify-content: space-between;
  align-items: center;
  box-shadow: 0 2px 4px rgba(0,0,0,0.1);
  position: sticky;
  top: 0;
  z-index: 1000;
}

.header h1 {
  margin: 0;
  font-size: 24px;
}

.button-container .btn {
  background-color: #004c99; /* Muted blue */
  color: #ffffff;
  padding: 8px 16px;
  border: none;
  border-radius: 4px;
  text-decoration: none;
  transition: background-color 0.2s, color 0.2s;
  margin-left: 10px;
}

.button-container .btn:hover {
  background-color: #003366; /* Even darker blue on hover */
  color: #ffffff;
}

/* Table Styles */
table {
  width: 100%;
  border-collapse: collapse;
  margin-top: 20px;
}

th, td {
  border: 1px solid #ccc; /* Softer border color */
  padding: 10px;
  text-align: left;
}

th {
  background-color: #004c99; /* Muted blue header */
  color: #ffffff;
}

tr:nth-child(even) {
  background-color: #f8f8f8; /* Very light gray for rows */
}

/* Form Styles */
.filter-container {
  background-color: #ffffff;
  padding: 20px;
  border-radius: 4px;
  box-shadow: 0 2px 4px rgba(0,0,0,0.1);
  margin: 20px auto;
  width: fit-content;
}

.filter-container input[type="text"],
.filter-container select {
  padding: 8px;
  margin-right: 10px;
  border: 1px solid #ccc;
  border-radius: 4px;
  background-color: #f0f0f0; /* Light gray for input fields */
}

.filter-container input[type="submit"] {
  cursor: pointer;
  background-color: #007bff; /* Soft blue instead of green */
  color: #ffffff;
  border: none;
  border-radius: 4px;
  padding: 8px 16px;
}

.filter-container input[type="submit"]:hover {
  background-color: #0056b3; /* A softer blue on hover */
}

/* Responsive Styles */
@media (max-width: 768px) {
  .header,
  .filter-container {
    flex-direction: column;
    align-items: flex-start;
  }

  .button-container {
    margin-top: 10px;
  }

  .filter-container {
    width: 100%;
  }
}

/* Footer Styles (if you have a footer) */
.footer {
  background-color: #003366;
  color: #ffffff;
  text-align: center;
  padding: 10px 20px;
  position: absolute;
  bottom: 0;
  width: 100%;
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
   <div class="button-container">
      <a href="admin_page1.php" class="btn">Back to Admin Page</a>
      <a href="create_a_user1.php" class="btn">Create a User</a>
      <a href="locked_out1.php" class="btn">Locked out Users</a>
      <!-- Other buttons as needed -->
   </div>
</div>

  <!-- Filter Form -->
<div class="filter-container">
    <form action="" method="post">
        <input type="text" name="UID" placeholder="UID">
        <input type="text" name="FirstName" placeholder="First Name">
        <input type="text" name="LastName" placeholder="Last Name">
        <input type="text" name="Gender" placeholder="Gender">
        <input type="text" name="City" placeholder="City">
        
        <!-- Add UserType select input -->
        <select name="UserType">
            <option value="">All</option>
            <?php
            // Fetch distinct UserTypes from the database
            $userTypesQuery = "SELECT DISTINCT UserType FROM logintable";
            $userTypesResult = mysqli_query($conn, $userTypesQuery);

            while ($row = mysqli_fetch_assoc($userTypesResult)) {
                $selected = ($_POST['UserType'] ?? '') === $row['UserType'] ? 'selected' : '';
                echo '<option value="' . $row['UserType'] . '" ' . $selected . '>' . $row['UserType'] . '</option>';
            }
            ?>
        </select>

        <input type="submit" name="filter" value="Filter" class="form-btn">
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
      <th>Degree Audit</th>
      <th>Create/Edit Schedule</th>
     
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
   <td>
       <?php
       if ($user['UserType'] !== 'faculty' && $user['UserType'] !== 'admin') {
           // Link for viewing the academic profile
           echo '<a href="view_academic_profile1.php?UID=' . $user['UID'] . '">View Academic Profile</a>';
       }
       ?>
   </td>
   <td>
       <?php
       // Ensure the Degree Audit link is correctly set for each user
       if ($user['UserType'] !== 'faculty' && $user['UserType'] !== 'admin') {
           echo '<a href="Facdegreeaudit.php?UID=' . $user['UID'] . '">Degree Audit</a>';
       }
       ?>
   </td>
   <td>
       <?php
       // Ensure the Degree Audit link is correctly set for each user
       if ($user['UserType'] !== 'faculty' && $user['UserType'] !== 'admin') {
           echo '<a href="Faccreateschedule.php?UID=' . $user['UID'] . '">Create/Update Schedule</a>';
       }
       ?>
   </td>
</tr>
<?php
endforeach;
?>
</table>

</div>

<!-- Your existing scripts and footer here -->

</body>
</html>


