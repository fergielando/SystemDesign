<?php
// Include your database configuration file and session start if needed
@include 'config1.php';
session_start();

// Fetch available courses with additional details, ordered by CRN (Include this part only)
$query = "SELECT
    coursesection.CRN,
    coursesection.CourseID,
    coursesection.AvailableSeats,
    timeslot.TimeSlotID,
    day.Weekday,
    course.CourseName,
    course.deptID,
    coursesection.RoomID,
    building.BuildingName,
    periodd.StartTime,
    periodd.EndTime,
    user.FirstName AS FacultyFirstName,
    user.LastName AS FacultyLastName,
    coursesection.SemesterID  -- Include semesterID column
FROM coursesection
JOIN timeslot ON coursesection.TimeSlotID = timeslot.TimeSlotID
JOIN day ON timeslot.DayID = day.DayID
JOIN course ON coursesection.CourseID = course.CourseID
JOIN periodd ON timeslot.PeriodID = periodd.PeriodID
JOIN room ON coursesection.RoomID = room.RoomID
JOIN building ON room.BuildingID = building.BuildingID
JOIN faculty ON coursesection.FacultyID = faculty.FacultyID
JOIN user ON faculty.FacultyID = user.UID
ORDER BY coursesection.CRN ASC";
$result = mysqli_query($conn, $query);

$courses = [];
while ($row = mysqli_fetch_assoc($result)) {
    $courses[] = $row;
}

// Fetch distinct days for the filter
$query = "SELECT DISTINCT day.Weekday FROM day"; // Adjust the table and column names as needed
$result = mysqli_query($conn, $query);

$days = [];
while ($row = mysqli_fetch_assoc($result)) {
    $days[] = $row['Weekday'];
}

// Fetch distinct building names for the filter
$query = "SELECT DISTINCT building.BuildingName FROM building"; // Adjust the table and column names as needed
$result = mysqli_query($conn, $query);

$buildingNames = [];
while ($row = mysqli_fetch_assoc($result)) {
    $buildingNames[] = $row['BuildingName'];
}


// Fetch distinct department IDs for the filter
$query = "SELECT DISTINCT course.deptID FROM course";
$result = mysqli_query($conn, $query);

$departmentIDs = [];
while ($row = mysqli_fetch_assoc($result)) {
    $departmentIDs[] = $row['deptID'];
}

// Fetch distinct room IDs for the filter
$query = "SELECT DISTINCT room.RoomID FROM room"; // Adjust the table and column names as needed
$result = mysqli_query($conn, $query);

$roomIDs = [];
while ($row = mysqli_fetch_assoc($result)) {
   $roomIDs[] = $row['RoomID'];
}

$query = "SELECT DISTINCT CONCAT(periodd.StartTime, ' to ', periodd.EndTime) AS Time FROM periodd"; // Adjust the table and column names as needed
$result = mysqli_query($conn, $query);

$times = [];
while ($row = mysqli_fetch_assoc($result)) {
    $times[] = $row['Time'];
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
   <meta charset="UTF-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   
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
   <header class="header">
   <img src="ua.png" alt="U.A. Logo" class="logo">
      <h1>Welcome to U.A. University</h1>
      <div class="button-container">
         <a href="fac_newhome1.php" class="btn">Back</a>
      </div>
   </header>

   <!-- Search container for search input and button -->
   <div class="search-container">
      <input type="text" id="searchInput" placeholder="Search...">
      <button onclick="searchTable()">Search</button>
      <button onclick="resetTable()">Reset</button>
   </div>

   <!-- Filter container for Department -->
   <div class="filter-container">
   <label for="deptFilter">Department:</label>
   <select id="deptFilter" onchange="filterTable('deptFilter', 'Department ID')">
      <option value="">All</option>
      <?php foreach ($departmentIDs as $deptID): ?>
         <option value="<?php echo $deptID; ?>"><?php echo $deptID; ?></option>
      <?php endforeach; ?>
   </select>
</div>

<div class="filter-container">
   <label for="buildingFilter">Building:</label>
   <select id="buildingFilter" onchange="filterTable('buildingFilter', 'Building')">
      <option value="">All</option>
      <?php foreach ($buildingNames as $buildingName): ?>
         <option value="<?php echo $buildingName; ?>"><?php echo $buildingName; ?></option>
      <?php endforeach; ?>
   </select>
</div>

<div class="filter-container">
   <label for="dayFilter">Day:</label>
   <select id="dayFilter" onchange="filterTable('dayFilter', 'Day')">
      <option value="">All</option>
      <?php foreach ($days as $day): ?>
         <option value="<?php echo $day; ?>"><?php echo $day; ?></option>
      <?php endforeach; ?>
   </select>
</div>

<div class="filter-container">
   <label for="roomFilter">Room ID:</label>
   <select id="roomFilter" onchange="filterTable('roomFilter', 'Room ID')">
      <option value="">All</option>
      <?php foreach ($roomIDs as $roomID): ?>
         <option value="<?php echo $roomID; ?>"><?php echo $roomID; ?></option>
      <?php endforeach; ?>
   </select>
</div>

<div class="filter-container">
   <label for="timeFilter">Time:</label>
   <select id="timeFilter" onchange="filterTable('timeFilter', 'Time')">
      <option value="">All</option>
      <?php foreach ($times as $time): ?>
         <option value="<?php echo $time; ?>"><?php echo $time; ?></option>
      <?php endforeach; ?>
   </select>
</div>



   <!-- Add similar filter containers for other columns if needed -->

   <table>
      <thead>
         <tr>
            <th>CRN</th>
            <th>Course Name</th>
            <th>Department ID</th>
            <th>Day</th>
            <th>Building</th>
            <th>Room ID</th>
            <th>Time</th>
         </tr>
      </thead>
      <tbody>
         <?php foreach ($courses as $course): ?>
            <tr>
               <td><?php echo $course['CRN']; ?></td>
               <td><?php echo $course['CourseName']; ?></td>
               <td><?php echo $course['deptID']; ?></td>
               <td><?php echo $course['Weekday']; ?></td>
               <td><?php echo $course['BuildingName']; ?></td>
               <td><?php echo $course['RoomID']; ?></td>
               <td><?php echo $course['StartTime'] . " to " . $course['EndTime']; ?></td>
            </tr>
         <?php endforeach; ?>
      </tbody>
   </table>

   <script>
      function searchTable() {
         var input, filter, table, tr, td, i, txtValue;
         input = document.getElementById("searchInput");
         filter = input.value.toUpperCase();
         table = document.querySelector("table");
         tr = table.getElementsByTagName("tr");

         for (i = 0; i < tr.length; i++) {
            td = tr[i].getElementsByTagName("td");
            for (var j = 0; j < td.length; j++) {
               if (td[j]) {
                  txtValue = td[j].textContent || td[j].innerText;
                  if (txtValue.toUpperCase().indexOf(filter) > -1) {
                     tr[i].style.display = "";
                     break;
                  } else {
                     tr[i].style.display = "none";
                  }
               }
            }
         }
      }

      function filterTable(filterId, columnName) {
         var input, filter, table, tr, td, i, txtValue;
         input = document.getElementById(filterId);
         filter = input.value.toUpperCase();
         table = document.querySelector("table");
         tr = table.getElementsByTagName("tr");

         for (i = 0; i < tr.length; i++) {
            td = tr[i].getElementsByTagName("td")[getColumnIndex(columnName)];
            if (td) {
               txtValue = td.textContent || td.innerText;
               if (filter === "" || txtValue.toUpperCase().indexOf(filter) > -1) {
                  tr[i].style.display = "";
               } else {
                  tr[i].style.display = "none";
               }
            }
         }
      }

      function getColumnIndex(columnName) {
         var table = document.querySelector("table");
         var header = table.querySelector("thead");
         var thArray = Array.from(header.querySelectorAll("th"));
         for (var i = 0; i < thArray.length; i++) {
            if (thArray[i].textContent.trim() === columnName) {
               return i;
            }
         }
         return -1;
      }

      function resetTable() {
   // Refresh the page
   window.location.reload();
}

   </script>
</body>
</html>


