<?php
// Include database configuration and start session
@include 'config1.php';
session_start();

// Check if CRN is provided
if (!isset($_GET['CRN'])) {
    echo "No course selected.";
    exit;
}

$CRN = $_GET['CRN'];

// Function to handle grade assignment
function assignGrade($conn, $studentID, $CRN, $grade) {
    mysqli_begin_transaction($conn);

    try {
        // Update grade in enrollment table
        $updateEnrollment = "UPDATE enrollment SET Grade = '$grade' WHERE StudentID = '$studentID' AND CRN = '$CRN'";
        mysqli_query($conn, $updateEnrollment);

        // Update or insert grade in studenthistory table
        // Check if a record already exists
        $checkHistory = "SELECT * FROM studenthistory WHERE StudentID = '$studentID' AND CRN = '$CRN'";
        $historyResult = mysqli_query($conn, $checkHistory);

        if (mysqli_num_rows($historyResult) > 0) {
            // Update existing record
            $updateHistory = "UPDATE studenthistory SET Grade = '$grade' WHERE StudentID = '$studentID' AND CRN = '$CRN'";
            mysqli_query($conn, $updateHistory);
        } else {
            // Insert new record
            $insertHistory = "INSERT INTO studenthistory (StudentID, CRN, Grade) VALUES ('$studentID', '$CRN', '$grade')";
            mysqli_query($conn, $insertHistory);
        }

        // Commit transaction
        mysqli_commit($conn);
    } catch (Exception $e) {
        mysqli_rollback($conn); // Rollback transaction on error
        echo "Error updating grade: " . $e->getMessage();
    }
}

// Check if the form has been submitted
if ($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_POST['assignGrade'])) {
    assignGrade($conn, $_POST['StudentID'], $_POST['CRN'], $_POST['Grade']);
}

// Fetch the list of students enrolled in the course
$rosterQuery = "SELECT student.StudentID, user.FirstName, user.LastName, enrollment.Grade 
                FROM enrollment
                INNER JOIN student ON enrollment.StudentID = student.StudentID
                INNER JOIN user ON student.StudentID = user.UID
                WHERE enrollment.CRN = '$CRN'";

$rosterResult = mysqli_query($conn, $rosterQuery);

$students = [];
if ($rosterResult) {
    while ($row = mysqli_fetch_assoc($rosterResult)) {
        $students[] = $row;
    }
} else {
    echo "Error fetching roster: " . mysqli_error($conn);
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
   <meta charset="UTF-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <title>Class Roster for Course <?php echo htmlspecialchars($CRN); ?></title>

   <style>
       /* Styles for the header */
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
      .department-container {
         padding: 20px;
      }

      table {
         width: 100%;
         border-collapse: collapse;
      }

      table, th, td {
         border: 1px solid #000;
      }

      th, td {
         padding: 8px;
         text-align: left;
      }
      th {
      background-color: #f2f2f2; /* Gives a slight background color to the header */
   }

   /* Style for every other row */
   tr:nth-child(even) {
      background: linear-gradient(90deg, #87CEEB, #FFFFFF); /* Light blue to white gradient */
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

   </style>
</head>
<body>
<header class="header">
      <img src="ua.png" alt="U.A. Logo" class="logo">
      <h1>Welcome to U.A. University</h1>
      <div class="button-container">
         <a href="fac_newhome1.php" class="btn">Back</a>
      </div>
   </header>
  

   <h1>Class Roster for Course (CRN: <?php echo htmlspecialchars($CRN); ?>)</h1>
   
   <table>
       <thead>
           <tr>
               <th>Student ID</th>
               <th>First Name</th>
               <th>Last Name</th>
               <th>Grade</th>
               <th>Assign Grade</th>
           </tr>
       </thead>
       <tbody>
           <?php foreach ($students as $student): ?>
               <tr>
                   <td><?php echo htmlspecialchars($student['StudentID']); ?></td>
                   <td><?php echo htmlspecialchars($student['FirstName']); ?></td>
                   <td><?php echo htmlspecialchars($student['LastName']); ?></td>
                   <td><?php echo htmlspecialchars($student['Grade']); ?></td>
                   <td>
                       <form action="class_roster.php?CRN=<?php echo htmlspecialchars($CRN); ?>" method="post">
                           <input type="hidden" name="StudentID" value="<?php echo htmlspecialchars($student['StudentID']); ?>">
                           <input type="hidden" name="CRN" value="<?php echo htmlspecialchars($CRN); ?>">
                           <input type="text" name="Grade" placeholder="Enter grade">
                           <button type="submit" name="assignGrade">Assign</button>
                       </form>
                   </td>
               </tr>
           <?php endforeach; ?>
       </tbody>
   </table>

</body>
</html>
