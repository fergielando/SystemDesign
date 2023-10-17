<!DOCTYPE html>
<html lang="en">
<head>
   <meta charset="UTF-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   
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

      .button-container {
         display: flex;
         align-items: center;
      }

      .button-container .btn {
         display: inline-block;
         padding: 10px 30px;
         font-size: 20px;
         background: #000; 
         color: #fff; 
         margin: 0 20px; 
         text-transform: capitalize;
         text-decoration: none; 
         border-radius: 5px;
         background-color: #000;
      }

      .button-container .btn:hover {
         background: #333;
      }

      /* Style for the welcome statement */
     .welcome-statement {
         background-color: #72A0C1;
         color: #333;
         font-size: 18px;
         padding: 40px;
         text-align: center;
         font-family: 'Poppins', cursive; /* Different font */
         border: 2px solid #444; /* Border */
         box-shadow: 0 0 20px rgba(0, 0, 0, 0.1); /* Box shadow */
      }
   </style>
</head>
<body>
   <div class="header">
      <img src="ua.png" alt="U.A. Logo" class="logo">
      <h1>Welcome to U.A. University</h1>
      <div class="button-container">
         <a href="login_form1.php" class="btn">Login</a>
      </div>
   </div>

   <!-- Welcome statement placed outside of the header -->
   <div class="welcome-statement">
      Welcome to U.A. University! We are delighted to extend a warm and enthusiastic welcome to all members of the U.A. University community. U.A. University is thrilled to have you as part of our academic family. Our dedicated faculty and staff are here to support and guide you every step of the way. We believe in your potential and are excited to see what you will achieve during your time at U.A. University.
   </div>

   <div class="container">
      <div class="content">
         <!-- Other content goes here -->
      </div>
   </div>
</body>
</html>
