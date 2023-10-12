<!DOCTYPE html>
<html lang="en">
<head>
   <meta charset="UTF-8">
   <meta http-equiv="X-UA-Compatible" content="IE-edge">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   

   
   <style>
     
      .header {
         background: #000; 
         color: #fff; 
         padding: 20px; 
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
      }

      .button-container .btn:hover {
         background: #333; 
      }
   </style>
</head>
<body style="background: lightblue;"> 

   
   <div class="header">
      <h1>Welcome to U.A. University</h1>
      <div class="button-container">
         <a href="login_form1.php" class="btn">Login</a>
      </div>
   </div>

   <div class="container">
      <div class="content">
         
      </div>
   </div>
</body>
</html>