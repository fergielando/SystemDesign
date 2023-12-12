<?php
@include 'config1.php';
$currentDate = date('Y-m-d');

// Fetch department data from the database
$selectDepts = "SELECT DeptID, DeptName FROM dept WHERE DeptID <> 'NULL'";
$resultDepts = mysqli_query($conn, $selectDepts);

// Fetch departments and store them in an array
$departments = [];
if (mysqli_num_rows($resultDepts) > 0) {
    while ($row = mysqli_fetch_assoc($resultDepts)) {
        $departments[$row['DeptID']] = $row['DeptName'];
    }
}

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
   $student_type = mysqli_real_escape_string($conn, $_POST['student_type']);
   $student_dept = mysqli_real_escape_string($conn, $_POST['student_dept']);
   $faculty_type = mysqli_real_escape_string($conn, $_POST['faculty_type']);
   $faculty_dept = mysqli_real_escape_string($conn, $_POST['faculty_dept']);
   $facultyspecialty = mysqli_real_escape_string($conn, $_POST['facultyspecialty']);
   $statsofficetype = mysqli_real_escape_string($conn, $_POST['statsofficetype']);
   $admintype = mysqli_real_escape_string($conn, $_POST['admintype']);

   $select = "SELECT * FROM logintable WHERE UID = '$uid' ";
   $result = mysqli_query($conn, $select);
   
   $selectemail = "SELECT * FROM logintable WHERE Email = '$email' ";
   $resultemail = mysqli_query($conn, $selectemail);

   if(mysqli_num_rows($result) > 0 OR mysqli_num_rows($resultemail) > 0){
      $error[] = 'User already exists! (UID or Email)';
   } else {
      if($pass != $cpass){
         $error[] = 'Password not matched!';
      } else {
         $insert = "INSERT INTO user(uid, firstname, lastname, gender, dob, street, city, state, zipcode) VALUES('$uid', '$firstName', '$lastName', '$gender', '$dob', '$street', '$city', '$state', '$zipcode')";
         $insert1 = "INSERT INTO logintable(uid, email, password, NumOfLogin, LockedOut, usertype) VALUES('$uid','$email','$pass','0','0','$user_type')";
         mysqli_query($conn, $insert);
         mysqli_query($conn, $insert1);
		 if($user_type=='student'){
			if($student_type == 'undergradft' OR $student_type == 'undergradpt'){
				if($student_type == 'undergradft') {
				$insertst = "INSERT INTO student(StudentID, StudentYear, StudentType) VALUES('$uid', 'Freshman', 'Undergraduate')";
				mysqli_query($conn, $insertst);
				$insertstund = "INSERT INTO undergradstudent(StudentID, DeptID, UnderGradStudentType) VALUES('$uid', '$student_dept', 'Undergrad Full Time')";
				mysqli_query($conn, $insertstund);
				$insertftundergrad = "INSERT INTO undergradstudentft(StudentID, Standing, LowCredits,HighCredits,CreditEarned) VALUES('$uid', 'Freshman', '7','12','0')";
				mysqli_query($conn, $insertftundergrad);
				}
				elseif($student_type == 'undergradpt'){
				$insertst = "INSERT INTO student(StudentID, StudentYear, StudentType) VALUES('$uid', 'Freshman', 'Undergraduate')";
				mysqli_query($conn, $insertst);
				$insertstund = "INSERT INTO undergradstudent(StudentID, DeptID, UnderGradStudentType) VALUES('$uid', '$student_dept', 'Undergrad Part Time')";
				mysqli_query($conn, $insertstund);
				$insertptundergrad = "INSERT INTO undergradstudentpt(StudentID, Standing, LowCredits,HighCredits,CreditEarned) VALUES('$uid', 'Freshman', '1','6','0')";
				mysqli_query($conn, $insertptundergrad);
				}
				}
			if($student_type == 'phdft' OR $student_type == 'phdpt' OR $student_type == 'mastersft' OR $student_type == 'masterspt'){
				if($student_type == 'phdft') {
				$insertst = "INSERT INTO student(StudentID, StudentYear, StudentType) VALUES('$uid', 'First', 'PHD')";
				mysqli_query($conn, $insertst);
				$insertstgrad = "INSERT INTO gradstudent(StudentID, DeptID, GradStudentType) VALUES('$uid', '$student_dept', 'PHD Full Time')";
				mysqli_query($conn, $insertstgrad);
				$insertftgrad = "INSERT INTO gradstudentft(StudentID, Standing,CreditEarned,QualifyExam,Thesis,LowCredits,HighCredits) VALUES('$uid', 'First','0','0','0', '7','12')";
				mysqli_query($conn, $insertftgrad);
				}
				elseif($student_type == 'phdpt') {
				$insertst = "INSERT INTO student(StudentID, StudentYear, StudentType) VALUES('$uid', 'First', 'PHD')";
				mysqli_query($conn, $insertst);
				$insertstgrad = "INSERT INTO gradstudent(StudentID, DeptID, GradStudentType) VALUES('$uid', '$student_dept', 'PHD Part Time')";
				mysqli_query($conn, $insertstgrad);
				$insertptgrad = "INSERT INTO gradstudentpt(StudentID, Standing,CreditEarned,QualifyExam,Thesis,LowCredits,HighCredits) VALUES('$uid', 'First','0','0','0', '1','6')";
				mysqli_query($conn, $insertptgrad);
				}
				if($student_type == 'mastersft') {
				$insertst = "INSERT INTO student(StudentID, StudentYear, StudentType) VALUES('$uid', 'First', 'Masters')";
				mysqli_query($conn, $insertst);
				$insertstgrad = "INSERT INTO gradstudent(StudentID, DeptID, GradStudentType) VALUES('$uid', '$student_dept', 'Masters Full Time')";
				mysqli_query($conn, $insertstgrad);
				$insertftgrad = "INSERT INTO gradstudentft(StudentID, Standing,CreditEarned,QualifyExam,Thesis,LowCredits,HighCredits) VALUES('$uid', 'First','0','0','0', '7','12')";
				mysqli_query($conn, $insertftgrad);
				}
				elseif($student_type == 'masterspt') {
				$insertst = "INSERT INTO student(StudentID, StudentYear, StudentType) VALUES('$uid', 'First', 'Masters')";
				mysqli_query($conn, $insertst);
				$insertstgrad = "INSERT INTO gradstudent(StudentID, DeptID, GradStudentType) VALUES('$uid', '$student_dept', 'Masters Part Time')";
				mysqli_query($conn, $insertstgrad);
				$insertptgrad = "INSERT INTO gradstudentpt(StudentID, Standing,CreditEarned,QualifyExam,Thesis,LowCredits,HighCredits) VALUES('$uid', 'First','0','0','0', '1','6')";
				mysqli_query($conn, $insertptgrad);
				}}
			} 
		 if($user_type=='faculty'){
				if($faculty_type == 'fulltime') {
				$insertfac = "INSERT INTO faculty(FacultyID, Position, Specialty, FacultyType) VALUES('$uid', 'Professor','$facultyspecialty', 'Full Time')";
				mysqli_query($conn, $insertfac);
				$insertfacdept = "INSERT INTO faculty(FacultyID, DeptID, PercentTime, DOA) VALUES('$uid', '$faculty_dept','50', '$currentDate')";
				mysqli_query($conn, $insertfacdept);
				$insertftfac = "INSERT INTO facultyft(FacultyID, NumOfClass, OfficeID) VALUES('$uid', '0', '0')";
				mysqli_query($conn, $insertftfac);
				}
				elseif($faculty_type == 'parttime'){
				$insertfac = "INSERT INTO faculty(FacultyID, Position, Specialty, FacultyType) VALUES('$uid', 'Professor','$facultyspecialty', 'Part Time')";
				mysqli_query($conn, $insertfac);
				$insertfacdept = "INSERT INTO faculty(FacultyID, DeptID, PercentTime, DOA) VALUES('$uid', '$faculty_dept','50', '$currentDate')";
				mysqli_query($conn, $insertfacdept);
				$insertptfac = "INSERT INTO facultypt(FacultyID, NumOfClass, OfficeID) VALUES('$uid', '0', '0')";
				mysqli_query($conn, $insertptfac);
				} } 
		if($user_type=='statsoffice'){
			$insertstat = "INSERT INTO statsoffice(StatsID, GAD, ClientName) VALUES('$uid', '$currentDate', '$statsofficetype')";
			mysqli_query($conn, $insertstat);
													}
		if($user_type=='admin'){
			if($admintype=='pl1'){
			$insertadmin1 = "INSERT INTO admin(AdminID, AdminType) VALUES('$uid', 'PL1')";
			mysqli_query($conn, $insertadmin1);
			$insertadmin2 = "INSERT INTO adminpl1(AdminID, priorityType) VALUES('$uid', '1')";
			mysqli_query($conn, $insertadmin2);
			} else{
			$insertadmin1 = "INSERT INTO admin(AdminID, AdminType) VALUES('$uid', 'PL0')";
			mysqli_query($conn, $insertadmin1);
			$insertadmin2 = "INSERT INTO adminpl0(AdminID, priorityType) VALUES('$uid', '0')";
			mysqli_query($conn, $insertadmin2);
			}
			}
         header('location:create_a_user1.php');
      }
   }
if(isset($_POST['clear'])) {
   
    header('location:create_a_user1.php');
 }
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
   
   <script>
   function setUIDRange() {
      var userType = document.getElementsByName("user_type")[0].value;
      var uidInput = document.getElementsByName("uid")[0];
	  var uidRangeDisplay = document.getElementById("uid-range");
	  var errorDisplay = document.getElementById("uid-error");
	  var errorDisplayDept = document.getElementById("dept-error");

      if (userType === "student") {
         uidInput.setAttribute("min", "500001");
         uidInput.setAttribute("max", "599999");
		 uidRangeDisplay.textContent = "UID range for Student: 500001 - 599999";
      } else if (userType === "faculty") {
         uidInput.setAttribute("min", "400001");
         uidInput.setAttribute("max", "499999");
		 uidRangeDisplay.textContent = "UID range for Faculty: 400001 - 499999";
      } else if (userType === "statsoffice") {
         uidInput.setAttribute("min", "100001");
         uidInput.setAttribute("max", "199999");
		 uidRangeDisplay.textContent = "UID range for Stats Office: 100001 - 199999";
      } else if (userType === "admin") {
         uidInput.setAttribute("min", "1");
         uidInput.setAttribute("max", "99999");
		 uidRangeDisplay.textContent = "UID range for Admin: 100001 - 199999";
      }
	  
	  var uid = parseInt(uidInput.value);
      if ((userType === "student" && (uid < 500001 || uid > 599999)) ||
          (userType === "faculty" && (uid < 400001 || uid > 499999)) ||
          (userType === "statsoffice" && (uid < 100001 || uid > 199999)) ||
		  (userType === "admin" && (uid < 1 || uid > 99999))) {
         errorDisplay.textContent = "Invalid UID for selected user type!";
		 document.getElementsByName("submit")[0].disabled = true; // Disable submit button
      } else {
         errorDisplay.textContent = "";
		 document.getElementsByName("submit")[0].disabled = false; // Enable submit button
      }
	  if((userType === "student" && (student_dept==="")) || (userType === "faculty" && (faculty_dept===""))) { 
		document.getElementsByName("submit")[0].disabled = true; // Disable submit button
		errorDisplayDept.textContent = "Must select a department for Students and Faculty!";
	  } else {
		document.getElementsByName("submit")[0].disabled = false; // Enable submit button
		errorDisplayDept.textContent = "";
	  }
      }
	  // Call setUIDRange() when the page loads
      window.addEventListener('load', setUIDRange);
   </script>
   
</head>
<body>

   <div class="header">
      <img src="ua.png" alt="U.A. Logo" class="logo">
      <h1>U.A. University</h1>
      <a href="admin_page1.php" class="back-button">Back to Admin Page</a>
   </div>

   <div class="form-container">
      <form action="" method="post" oninput="setUIDRange()">
         <h3>Create a User</h3>
         <span id="uid-error" style="color: red;"></span>
		  <span id="dept-error" style="color: red;"></span>
         <?php
         
         if(isset($error)){
            foreach($error as $error){
               echo '<span class="error-msg">'.$error.'</span>';
            };
         };
         
         ?>
         
        <input type="text" name="uid" required placeholder="UID">
		<span id="uid-range" style="font-size: 12px; color: #666;"></span>
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
         <option value="student">User Type: Student</option>
         <option value="faculty">User Type: Faculty</option>
		  <option value="statsoffice">User Type: Statistics Office</option>
		  <option value="admin">User Type: Admin</option>
      </select>
      <select name="student_type">
         <option value="undergradft">Student Type: Full Time Undergraduate</option>
		  <option value="undergradpt">Student Type: Part Time Undergraduate</option>
         <option value="phdft">Student Type: Full Time PHD </option>
		  <option value="phdpt">Student Type: Part Time PHD</option>
         <option value="mastersft">Student Type: Full Time Masters</option>
		  <option value="masterspt">Student Type: Part Time Masters</option>
      </select>
	  <select name="student_dept">
            <option value="">Student Department:</option>
            <?php
            // Display departments in the dropdown
            foreach ($departments as $deptID => $deptName) {
                echo '<option value="' . $deptID . '">' . $deptName . '</option>';
            }
            ?>
         </select>
      <select name="faculty_type">
         <option value="fulltime">Faculty Type: Full Time</option>
         <option value="parttime">Faculty Type: Part Time</option>
      </select>
	  <select name="faculty_dept">
            <option value="">Faculty Department:</option>
            <?php
            // Display departments in the dropdown
            foreach ($departments as $deptID => $deptName) {
                echo '<option value="' . $deptID . '">' . $deptName . '</option>';
            }
            ?>
         </select>
      <input type="facultyspecialty" name="facultyspecialty" placeholder="Faculty Specialty: N/A">
      <input type="statsofficetype" name="statsofficetype" placeholder="Stats Office Client: N/A">
	  <select name="admintype">
         <option value="pl0">Admin Type: Priority Level 0</option>
         <option value="pl1">Admin Type: Priority Level 1</option>
      </select>
      <input type="submit" name="submit" value="Create" class="form-btn">
      <a href="Create_a_user1.php" value ="Clear" class="clear-btn">Clear</a> <!-- Add the Clear button -->
      </form>
      </form>
   </div>

</body>

</html>