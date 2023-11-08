<?php

@include 'config1.php';


session_start();

if (isset($_POST['submit'])) {
    $email = mysqli_real_escape_string($conn, $_POST['email']);
    $pass = md5($_POST['password']);
  

   
   $select = " SELECT * FROM user WHERE email = '$email' && password = '$pass' ";

    $result = mysqli_query($conn, $select);

    if (mysqli_num_rows($result) > 0) {
        $row = mysqli_fetch_array($result);

        if ($row['UserType'] == 'admin') {
            $_SESSION['admin_name'] = $row['FirstName']; 
            header('location:admin_page1.php');

        } else if ($row['UserType'] == 'student') {
            $_SESSION['user_name'] = $row['FirstName']; 
            header('location:user_page1.php');
        }
    } else {
        $error[] = 'Incorrect email or password!';
    }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login form</title>
    <link rel="stylesheet" href="css/fatman1.css">
    <style>
       .header {
         background: #000; 
         color: #fff; 
         padding: 20px;
         background-color: #000;
         text-align: left;
         margin-top: 20px;
         display: flex;
         justify-content: space-between;
         align-items: center;
      }

      .header h1 {
         font-size: 36px; 
         margin: 0;
      }

      .header .logo {
         width: 50px;
         height: 50px;
      }
      body {
            background-color: #c2e8c1;
        }
    </style>
</head>
<body>
<div class="header">
        <img src="ua.png" alt="U.A. Logo" class="logo">
        <h1> U.A. University</h1>
    </div>
<div class="form-container">
    <form action="" method="post">
        <h3>Login</h3>
        <?php
        if (isset($error)) {
            foreach ($error as $error) {
                echo '<span class="error-msg">' . $error . '</span>';
            }
        }
        ?>
        <input type="email" name="email" required placeholder="Email">
        <input type="password" name="password" required placeholder="Password">
        <input type="submit" name="submit" value="Login now" class="form-btn">
        <p>Don't have an account? <a href="register_form1.php">Register now</a></p>
    </form>
</div>
</body>
</html>
