<?php
// Include your database configuration file and session start if needed
@include 'config1.php';
session_start();
$currentDate = date('Y-m-d');

if (!isset($_SESSION['UID'])) {
    echo "Please log in. <a href='login_page1.php'>Login Here</a>";
    exit;
}

$uid = $_SESSION['UID'];

// Fetching additional StudentYear information
$clientInfoQuery = "SELECT ClientName FROM statsoffice WHERE StatsID = '$uid'";
$clientInfoResult = mysqli_query($conn, $clientInfoQuery);
$clientInfo = mysqli_fetch_assoc($clientInfoResult);
$clientname = $clientInfo['ClientName'];

$queryugcount = "SELECT COUNT(StudentID) FROM undergradstudent WHERE StudentID <> 0";
$undergrad_count = mysqli_query($conn, $queryugcount);

$querygrcount = "SELECT COUNT(StudentID) FROM gradstudent WHERE StudentID <> 0";
$grad_count = mysqli_query($conn, $querygrcount);

$queryftcount = "SELECT SUM(count)
FROM (
    SELECT COUNT(StudentID) AS count
    FROM gradstudentft
    WHERE StudentID <> 0
    UNION ALL
    SELECT COUNT(StudentID) AS count
    FROM undergradstudentft
    WHERE StudentID <> 0
) AS x;";
$fulltime_count = mysqli_query($conn, $queryftcount);

$queryptcount = "SELECT SUM(count)
FROM (
    SELECT COUNT(StudentID) AS count
    FROM gradstudentpt
    WHERE StudentID <> 0
    UNION ALL
    SELECT COUNT(StudentID) AS count
    FROM undergradstudentpt
    WHERE StudentID <> 0
) AS x;";
$parttime_count = mysqli_query($conn, $queryptcount);

?>

<!DOCTYPE html>
<html lang="en">
<head>
   <meta charset="UTF-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
   
   <!-- Add the styles for the table, search feature, and filters here or in a separate CSS file -->
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
	  
      .button-second .btn {
         display: grid;
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

      .button-second .btn:hover {
         background: #333;
      }

      .welcome-statement {
         color: #333;
         font-size: 18px;
         padding: 40px;
         text-align: center;
         font-family: 'Poppins', cursive; 
         border: 2px solid #444; 
         box-shadow: 0 0 20px rgba(0, 0, 0, 0.1); 
      }

      table {
         width: 100%; /* Full width */
         max-width: 100%; /* Ensures table is not wider than its container */
         border-collapse: collapse;
         table-layout: auto; /* New line: Ensures the table respects the width */
      }

      th, td {
         border: 1px solid #000;
         padding: 15px;
         text-align: left;
         font-size: 14px;
         word-wrap: break-word; /* New line: Allows words to break and wrap */
      }

      th {
         background-color: #f2f2f2; /* Gives a slight background color to the header */
      }

      /* Style for every other row */
      tr:nth-child(even) {
         background-color: #ccffcc; /* Light green background */
      }

      /* Hover effect for rows */
      tr:hover {
         background-color: #e6ffe6; /* Lighter green on hover */
      }

      td, th {
         padding: 10px;
         border: 1px solid #ccc;
         text-align: center;
      }
      .search-container {
         margin: 20px 0;
         text-align: center;
      }

      .search-container input[type="text"] {
         padding: 10px;
         border: 1px solid #ccc;
         border-radius: 5px;
         font-size: 16px;
      }

      .search-container button {
         padding: 10px 20px;
         background-color: #000;
         color: #fff;
         border: none;
         border-radius: 5px;
         cursor: pointer;
         font-size: 16px;
      }

      .search-container button:hover {
         background-color: #333;
      }
      .filter-container {
         display: flex;
         justify-content: space-between;
         margin: 10px 0;
         padding: 10px;
         background-color: #f2f2f2;
      }

      .filter-container label {
         font-weight: bold;
      }

      .filter-container select {
         padding: 5px;
      }
   </style>
</head>
<body>
   <div class="header">
      <h1>U.A. University Statistics</h1>
       <a href="statsoffice_page1.php" class="back-button">Back to Home Page</a>
   </div>

   <div class="welcome-statement">
    <p>Welcome, <?php echo $_SESSION['statsoffice_name']; ?>. Welcome to UA University! As a Statistics Office representative, You represent <?php echo $clientname; ?>. These are the latest statistics as of <?php echo $currentDate; ?></p>
   </div>

   <script>
 document.addEventListener('DOMContentLoaded', function () {
    var ctxUgGrad = document.getElementById('ugGradChart').getContext('2d');
    var ctxFullPart = document.getElementById('fullPartChart').getContext('2d');
    var ctxMajors = document.getElementById('majorChart').getContext('2d');
    var ctxMinors = document.getElementById('minorChart').getContext('2d');
    var ctxGradDept = document.getElementById('gradDeptChart').getContext('2d');
	var undergradCount = <?php echo $undergrad_count; ?>;
    var gradCount = <?php echo $grad_count; ?>;
	var fulltime_count = <?php echo $fulltime_count; ?>;
    var parttime_count = <?php echo $parttime_count; ?>;

    // Prepare data
    var dataUgGrad = {
        labels: ['Undergraduate', 'Graduate'],
        datasets: [{
            label: 'Student Type',
            data: [{{ undergrad_count }}, {{ grad_count }}],
            backgroundColor: ['rgba(255, 99, 132, 0.2)', 'rgba(54, 162, 235, 0.2)']
        }]
    };

    var dataFullPart = {
        labels: ['Full-time', 'Part-time'],
        datasets: [{
            label: 'Enrollment Type',
            data: [{{ fulltime_count }}, {{ parttime_count }}],
            backgroundColor: ['rgba(255, 206, 86, 0.2)', 'rgba(75, 192, 192, 0.2)']
        }]
    };

    var majorCounts = {{ major_counts|safe }};
    var minorCounts = {{ minor_counts|safe }};
    var gradDeptCounts = {{ grad_department_counts|safe }};

    // Function to map data for bar charts
    function mapChartData(data, labelKey, valueKey) {
        return {
            labels: data.map(item => item[labelKey]),
            datasets: [{
                label: 'Number of Students',
                data: data.map(item => item[valueKey]),
                backgroundColor: 'rgba(54, 162, 235, 0.2)',
                borderColor: 'rgba(54, 162, 235, 1)',
                borderWidth: 1
            }]
        };
    }

    // Chart for Majors
    var ctxMajors = document.getElementById('majorChart').getContext('2d');
    var majorChartData = mapChartData(majorCounts, 'major_name', 'student_count');
    var majorChart = new Chart(ctxMajors, {
        type: 'bar',
        data: majorChartData,
        options: {
            scales: {
                y: {
                    beginAtZero: true
                }
            }
        }
    });

    // Chart for Minors
    var ctxMinors = document.getElementById('minorChart').getContext('2d');
    var minorChartData = mapChartData(minorCounts, 'minor_name', 'student_count');
    var minorChart = new Chart(ctxMinors, {
        type: 'bar',
        data: minorChartData,
        options: {
            scales: {
                y: {
                    beginAtZero: true
                }
            }
        }
    });

    // Chart for Graduates by Department
    var ctxGrads = document.getElementById('gradDeptChart').getContext('2d');
    var gradDeptChartData = mapChartData(gradDeptCounts, 'department_name', 'grad_count');
    var gradDeptChart = new Chart(ctxGrads, {
        type: 'bar',
        data: gradDeptChartData,
        options: {
            scales: {
                y: {
                    beginAtZero: true
                }
            }
        }
    });


    // Create charts
    new Chart(ctxUgGrad, { type: 'pie', data: dataUgGrad });
    new Chart(ctxFullPart, { type: 'pie', data: dataFullPart });
   </script>
</body>
</html>
