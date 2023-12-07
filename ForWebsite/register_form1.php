<?php

@include 'config1.php';
$currentDate = date('Y-m-d');
if(isset($_POST['submit'])){

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
   $faculty_type = mysqli_real_escape_string($conn, $_POST['faculty_type']);
   $facultyspecialty = mysqli_real_escape_string($conn, $_POST['facultyspecialty']);
   $statsofficetype = mysqli_real_escape_string($conn, $_POST['statsofficetype']);

   $select = " SELECT * FROM logintable WHERE email = '$email' && password = '$pass' ";

   $result = mysqli_query($conn, $select);

   if(mysqli_num_rows($result) > 0){

      $error[] = 'User already exists!';

   }else{

      if($pass != $cpass){
         $error[] = 'Password not matched!';
      }else{
         $insert = "INSERT INTO user(uid, firstname, lastname, gender, dob, street, city, state, zipcode) VALUES('$uid', '$firstName', '$lastName', '$gender', '$dob', '$street', '$city', '$state', '$zipcode')";
         $insert1 = "INSERT INTO logintable(uid, email, password, usertype) VALUES('$uid','$email','$pass','$user_type')";
         mysqli_query($conn, $insert);
         mysqli_query($conn, $insert1);
		 if($user_type=='student'){
			if($student_type == 'undergradft' OR $student_type == 'undergradpt'){
				if($student_type == 'undergradft') {
				$insertst = "INSERT INTO student(StudentID, StudentYear, StudentType) VALUES('$uid', 'Freshman', 'Undergraduate')";
				mysqli_query($conn, $insertst);
				$insertstund = "INSERT INTO undergradstudent(StudentID, DeptID, UnderGradStudentType) VALUES('$uid', 'NULL', 'Undergrad Full Time')";
				mysqli_query($conn, $insertstund);
				$insertftundergrad = "INSERT INTO undergradstudentft(StudentID, Standing, LowCredits,HighCredits,CreditsEarned) VALUES('$uid', 'Freshman', '7','12','0')";
				mysqli_query($conn, $insertftundergrad);
				}
				elseif($student_type == 'undergradpt'){
				$insertst = "INSERT INTO student(StudentID, StudentYear, StudentType) VALUES('$uid', 'Freshman', 'Undergraduate')";
				mysqli_query($conn, $insertst);
				$insertstund = "INSERT INTO undergradstudent(StudentID, DeptID, UnderGradStudentType) VALUES('$uid', 'NULL', 'Undergrad Part Time')";
				mysqli_query($conn, $insertstund);
				$insertptundergrad = "INSERT INTO undergradstudentpt(StudentID, Standing, LowCredits,HighCredits,CreditsEarned) VALUES('$uid', 'Freshman', '1','6','0')";
				mysqli_query($conn, $insertptundergrad);
				}
				}
			if($student_type == 'phdft' OR $student_type == 'phdpt' OR $student_type == 'mastersft' OR $student_type == 'masterspt'){
				if($student_type == 'phdft') {
				$insertst = "INSERT INTO student(StudentID, StudentYear, StudentType) VALUES('$uid', 'First', 'PHD')";
				mysqli_query($conn, $insertst);
				$insertstgrad = "INSERT INTO gradstudent(StudentID, DeptID, GradStudentType) VALUES('$uid', 'NULL', 'PHD Full Time')";
				mysqli_query($conn, $insertstgrad);
				$insertftgrad = "INSERT INTO gradstudentft(StudentID, Standing,CreditEarned,QualifyExam,Thesis,LowCredits,HighCredits) VALUES('$uid', 'First','0','0','0', '7','12')";
				mysqli_query($conn, $insertftgrad);
				}
				elseif($student_type == 'phdpt') {
				$insertst = "INSERT INTO student(StudentID, StudentYear, StudentType) VALUES('$uid', 'First', 'PHD')";
				mysqli_query($conn, $insertst);
				$insertstgrad = "INSERT INTO gradstudent(StudentID, DeptID, GradStudentType) VALUES('$uid', 'NULL', 'PHD Part Time')";
				mysqli_query($conn, $insertstgrad);
				$insertptgrad = "INSERT INTO gradstudentpt(StudentID, Standing,CreditEarned,QualifyExam,Thesis,LowCredits,HighCredits) VALUES('$uid', 'First','0','0','0', '1','6')";
				mysqli_query($conn, $insertptgrad);
				}
				if($student_type == 'mastersft') {
				$insertst = "INSERT INTO student(StudentID, StudentYear, StudentType) VALUES('$uid', 'First', 'Masters')";
				mysqli_query($conn, $insertst);
				$insertstgrad = "INSERT INTO gradstudent(StudentID, DeptID, GradStudentType) VALUES('$uid', 'NULL', 'Masters Full Time')";
				mysqli_query($conn, $insertstgrad);
				$insertftgrad = "INSERT INTO gradstudentft(StudentID, Standing,CreditEarned,QualifyExam,Thesis,LowCredits,HighCredits) VALUES('$uid', 'First','0','0','0', '7','12')";
				mysqli_query($conn, $insertftgrad);
				}
				elseif($student_type == 'masterspt') {
				$insertst = "INSERT INTO student(StudentID, StudentYear, StudentType) VALUES('$uid', 'First', 'Masters')";
				mysqli_query($conn, $insertst);
				$insertstgrad = "INSERT INTO gradstudent(StudentID, DeptID, GradStudentType) VALUES('$uid', 'NULL', 'Masters Part Time')";
				mysqli_query($conn, $insertstgrad);
				$insertptgrad = "INSERT INTO gradstudentpt(StudentID, Standing,CreditEarned,QualifyExam,Thesis,LowCredits,HighCredits) VALUES('$uid', 'First','0','0','0', '1','6')";
				mysqli_query($conn, $insertptgrad);
				}}
			} 
		 if($user_type=='faculty'){
				if($faculty_type == 'fulltime') {
				$insertfac = "INSERT INTO faculty(FacultyID, Position, Specialty, FacultyType) VALUES('$uid', 'Professor','$facultyspecialty', 'Full Time')";
				mysqli_query($conn, $insertfac);
				$insertftfac = "INSERT INTO facultyft(FacultyID, NumOfClass, OfficeID) VALUES('$uid', '0', '0')";
				mysqli_query($conn, $insertftfac);
				}
				elseif($faculty_type == 'parttime'){
				$insertfac = "INSERT INTO faculty(FacultyID, Position, Specialty, FacultyType) VALUES('$uid', 'Professor','$facultyspecialty', 'Part Time')";
				mysqli_query($conn, $insertfac);
				$insertptfac = "INSERT INTO facultypt(FacultyID, NumOfClass, OfficeID) VALUES('$uid', '0', '0')";
				mysqli_query($conn, $insertptfac);
				} } 
		if($user_type=='statsoffice'){
			$insertstat = "INSERT INTO statsoffice(StatsID, GAD, ClientName) VALUES('$uid', '$currentDate', '$statsofficetype')";
			mysqli_query($conn, $insertstat);
													}
         header('location:login_form1.php');
      }
   }

};

?>

<!DOCTYPE html>
<html lang="en">
<head>
   <meta charset="UTF-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <title>Register Form</title>

   <link rel="stylesheet" href="css/fatman1.css">

</head>
<body>

<div class="form-container">

   <form action="" method="post">
      <h3>Registration</h3>
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
		  <option value="statsoffice">Statistics Office</option>
      </select>
      <select name="student_type">
		  <option value="error">Student Type: N/A</option>
         <option value="undergradft">Full Time Undergraduate</option>
		  <option value="undergradpt">Part Time Undergraduate</option>
         <option value="phdft">Full Time PHD </option>
		  <option value="phdpt">Part Time PHD</option>
         <option value="mastersft"> Full Time Masters</option>
		  <option value="masterspt">Part Time Masters</option>
      </select>
      <select name="faculty_type">
			<option value="error">Faculty Type: N/A</option>
         <option value="fulltime">Full Time</option>
         <option value="parttime">Part Time</option>
      </select>
      <input type="facultyspecialty" name="facultyspecialty" placeholder="Faculty Specialty: N/A">
      <input type="statsofficetype" name="statsofficetype" placeholder="Stats Office Client: N/A">
      <input type="submit" name="submit" value="Register Now" class="form-btn">
      <p>Already have an account? <a href="login_form1.php">Login!</a></p>
   </form>

</div>

</body>
</html>
