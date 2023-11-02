<?php
@include 'config1.php';

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

<!DOCTYPE html>
<html lang="en">
<head>
   <meta charset="UTF-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <title>Update a user Form</title>

   <link rel="stylesheet" href="css/fatman1.css">

</head>
<body>

<div class="form-container">

   <form action="" method="post">
      <h3>Update a user</h3>
      <?php
      if(isset($error)){
         foreach($error as $error){
            echo '<span class="error-msg">'.$error.'</span>';
         };
      };
      ?>
      <input type="text" name="uid" required placeholder="UID">
      <input type="text" name="firstName" required placeholder="First Name">
      <input type="text" name="lastName" required placeholder="Last Name">
      <select name="gender" required>
         <option value="M">Male</option>
         <option value="F">Female</option>
         <option value="O">Other</option>
      </select>
      <input type="date" name="dob" required placeholder="Date of Birth">
      <input type="text" name="street" required placeholder="Street">
      <input type="text" name="city" required placeholder="City">
      <input type="text" name="state" required placeholder="State">
      <input type="text" name="zipcode" required placeholder="ZipCode">
      <input type="submit" name="submit" value="update" class="form-btn">
   </form>

</div>

</body>
</html>


