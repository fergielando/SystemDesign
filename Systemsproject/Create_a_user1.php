<?php
@include 'config1.php';

if(isset($_POST['submit'])) {
   $uid = mysqli_real_escape_string($conn, $_POST['uid']);
   $firstName = mysqli_real_escape_string($conn, $_POST['firstName']);
   $lastName = mysqli_real_escape_string($conn, $_POST['lastName']);
   $gender = mysqli_real_escape_string($conn, $_POST['gender']);
   $dob = mysqli_real_escape_string($conn, $_POST['dob']);
   $street = mysqli_real_escape_string($conn, $_POST['street']);
   $city = mysqli_real_escape_string($conn, $_POST['city']);
   $state = mysqli_real_escape_string($conn, $_POST['state']);
   $zipcode = mysqli_real_escape_string($conn, $_POST['zipcode']);
   $email = mysqli_real_escape_string($conn, $_POST['email']);
   $pass = md5($_POST['password']);
   $cpass = md5($_POST['cpassword']);
   $user_type = mysqli_real_escape_string($conn, $_POST['user_type']);

   $select = "SELECT * FROM user WHERE email = '$email' && password = '$pass' ";
   $result = mysqli_query($conn, $select);

   if(mysqli_num_rows($result) > 0){
      $error[] = 'User already exists!';
   } else {
      if($pass != $cpass){
         $error[] = 'Password not matched!';
      } else {
         $insert = "INSERT INTO user(uid, firstname, lastname, gender, dob, street, city, state, zipcode, email, password, usertype) VALUES('$uid', '$firstName', '$lastName', '$gender', '$dob', '$street', '$city', '$state', '$zipcode', '$email', '$pass', '$user_type')";
         $insert1 = "INSERT INTO logintable(uid, email, password, usertype) VALUES('$uid','$email','$pass','$user_type')";
         mysqli_query($conn, $insert);
         mysqli_query($conn, $insert1);
         header('location:Create_a_user1.php');
      }
   }
}
if(isset($_POST['clear'])) {
   
    header('location:Create_a_user1.php');
 }
?>

<!DOCTYPE html>
<html lang="en">
<head>
   <meta charset="UTF-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <title>Create a User Form</title>

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

      .header .logo {
         width: 50px; 
         height: 50px; 
      }

      .header .back-button {
         background: #000;
         color: #fff;
         padding: 10px 20px;
         text-decoration: none;
         border-radius: 5px;
         margin-right: 10px;
      }

      form {
  box-sizing: border-box;
  padding: 2rem;
  border-radius: 1rem;
  background-color: hsl(0, 0%, 100%);
  border: 4px solid hsl(0, 0%, 90%);
  display: grid;
  grid-template-columns: 1fr 1fr;
  gap: 2rem;
}

.full-width {
  grid-column: span 2;
}

.clear-btn {
    padding: 10px 20px;
    background-color: #4CAF50;
    color: #fff;
    text-transform: uppercase;
    border-radius: 5px;
    margin: 5px;
    cursor: pointer;
    transition: background-color 0.2s;
    font-family: Arial, sans-serif;
      }
   </style>
</head>
<body>

   <div class="header">
      <img src="ua.png" alt="U.A. Logo" class="logo">
      <h1>U.A. University</h1>
      <a href="admin_page1.php" class="back-button">Back to Admin Page</a>
   </div>

   <div class="form-container">
      <form action="" method="post">
         <h3>Create a User</h3>
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
      <input type="email" name="email" required placeholder="Email">
      <input type="password" name="password" required placeholder="Password">
      <input type="password" name="cpassword" required placeholder="Confirm Password">
      <select name="user_type" required>
         <option value="student">Student</option>
         <option value="faculty">Faculty</option>
      </select>
      <input type="submit" name="submit" value="Create" class="form-btn">
      <a href="Create_a_user1.php" value ="Clear" class="clear-btn">Clear</a> <!-- Add the Clear button -->
      </form>
      </form>
   </div>

</body>
</html>
