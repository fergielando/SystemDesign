<!DOCTYPE html>
<html lang="en">
<head>
   <meta charset="UTF-8">
   <meta http-equiv="X-UA-Compatible" content="IE-edge">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <title>Create User - U.A. University Admin Page</title>

   
   <link rel="stylesheet" href="css/fatman1.css">

   <style>
      
      .header {
         background: #000; 
         color: #fff; 
         padding: 20px; 
         text-align: center;
         margin-top: 20px; 
      }

      
      .header h1 {
         font-size: 36px; 
      }

      
      .form-group {
         display: block;
         margin: 10px 0;
      }

      .form-group label {
         display: block;
         font-weight: bold;
      }

      .form-group input {
         width: 100%;
         padding: 10px;
         border: 1px solid #ccc;
         border-radius: 5px;
      }
   </style>
</head>
<body>
   
   <div class="header">
      <h1>Welcome to U.A. University</h1>
   </div>

   <div class="container">
      <div class="content">
         <h1>Create a User</h1>

         <?php
         if (isset($message)) {
             echo '<p class="success">' . $message . '</p>';
         } elseif (isset($error)) {
             echo '<p class="error">' . $error . '</p>';
         }
         ?>

         <form method="post">
            <div class="form-group">
               <label for="UID">UID:</label>
               <input type="text" id="UID" name="UID" required>
            </div>
            <div class="form-group">
               <label for="Name">Name:</label>
               <input type="text" id="Name" name="Name" required>
            </div>
            <div class="form-group">
               <label for="Email">Email:</label>
               <input type="text" id="Email" name="Email" required>
            </div>
            <div class="form-group">
               <label for="Password">Password:</label>
               <input type="password" id="Password" name="Password" required>
            </div>
            <div class="form-group">
               <label for="Address">Address:</label>
               <input type="text" id="Address" name="Address" required>
            </div>
            <div class="form-group">
               <label for="UserType">User Type:</label>
               <input type="radio" id="Student" name="UserType" value="Student">
               <label for="Student">Student</label>
               <input type="radio" id="Faculty" name="UserType" value="Faculty">
               <label for="Faculty">Faculty</label>
            </div>
            <div class="form-group" id="facultyFields" style="display: none;">
               <label for="Department">Department:</label>
               <input type="text" id="Department" name="Department">
               <label for="FullTime">Full-Time Faculty:</label>
               <input type="text" id="FullTime" name="FullTime">
            </div>
            <button type="submit" class="btn">Create User</button>
         </form>
         <a href="admin_page1.php" class="btn">Back to Admin Page</a>
      </div>
   </div>
   <script>
      
      const userTypeRadio = document.querySelector('input[name="UserType"]');
      const facultyFields = document.getElementById('facultyFields');
      userTypeRadio.addEventListener('change', () => {
         if (userTypeRadio.value === 'Faculty') {
            facultyFields.style.display = 'block';
         } else {
            facultyFields.style.display = 'none';
         }
      });
   </script>
</body>
</html>
