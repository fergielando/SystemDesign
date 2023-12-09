<?php
// Include your database configuration file and session start if needed
@include 'config1.php';
session_start();

// Fetch available courses with additional details, ordered by CRN (Include this part only)
$query = "SELECT
    coursesection.CRN,
    coursesection.CourseID,
    coursesection.AvailableSeats,
    coursesection.SectionNum,
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
    coursesection.FacultyID,
    dept.DeptName,
	semester.SemesterName
FROM coursesection
JOIN timeslot ON coursesection.TimeSlotID = timeslot.TimeSlotID
JOIN day ON timeslot.DayID = day.DayID
JOIN course ON coursesection.CourseID = course.CourseID
JOIN periodd ON timeslot.PeriodID = periodd.PeriodID
JOIN room ON coursesection.RoomID = room.RoomID
JOIN building ON room.BuildingID = building.BuildingID
JOIN facultyhistory ON coursesection.CRN = facultyhistory.CRN
JOIN faculty ON facultyhistory.FacultyID = faculty.FacultyID
JOIN user ON faculty.FacultyID = user.UID  -- Join using the foreign key constraint
JOIN semester ON coursesection.SemesterID = semester.SemesterID  -- Join using the foreign key constraint
JOIN dept ON course.DeptID = dept.DeptID
WHERE coursesection.CRN <> 0
ORDER BY coursesection.CRN ASC";




$result = mysqli_query($conn, $query);

$courses = [];
while ($row = mysqli_fetch_assoc($result)) {
    $courses[] = $row;
}

//Get Course Prerequisites for each Course
foreach ($courses as &$course) {
    $courseID = $course['CourseID'];
    $prerequisitesQuery = "SELECT PRCourseID FROM courseprerequisite WHERE CourseID = '$courseID'";
    $prerequisitesResult = mysqli_query($conn, $prerequisitesQuery);

    $prerequisites = [];
    while ($row = mysqli_fetch_assoc($prerequisitesResult)) {
        $prerequisites[] = $row['PRCourseID'];
    }

    $course['Prerequisites'] = $prerequisites;
}
unset($course); // Unset the reference after the loop

// Fetch distinct days for the filter
$query = "SELECT DISTINCT day.Weekday FROM day WHERE DayID <> 0"; // Adjust the table and column names as needed
$result = mysqli_query($conn, $query);

$days = [];
while ($row = mysqli_fetch_assoc($result)) {
    $days[] = $row['Weekday'];
}

// Fetch distinct building names for the filter
$query = "SELECT DISTINCT building.BuildingName FROM building WHERE BuildingID <> 0 AND BuildingID <>4"; // Adjust the table and column names as needed
$result = mysqli_query($conn, $query);

$buildingNames = [];
while ($row = mysqli_fetch_assoc($result)) {
    $buildingNames[] = $row['BuildingName'];
}


// Fetch distinct department IDs for the filter
$query = "SELECT DISTINCT dept.DeptName FROM dept WHERE DeptID <> 'NULL'";
$result = mysqli_query($conn, $query);

$departmentIDs = [];
while ($row = mysqli_fetch_assoc($result)) {
    $departmentIDs[] = $row['DeptName'];
}

// Fetch distinct room IDs for the filter
$query = "SELECT DISTINCT room.RoomID FROM room WHERE RoomID <> 0"; // Adjust the table and column names as needed
$result = mysqli_query($conn, $query);

$roomIDs = [];
while ($row = mysqli_fetch_assoc($result)) {
   $roomIDs[] = $row['RoomID'];
}

$query = "SELECT DISTINCT CONCAT(periodd.StartTime, ' to ', periodd.EndTime) AS Time FROM periodd WHERE PeriodID <> 0"; // Adjust the table and column names as needed
$result = mysqli_query($conn, $query);

$times = [];
while ($row = mysqli_fetch_assoc($result)) {
    $times[] = $row['Time'];
}

// Fetch distinct semester names for the filter
$query = "SELECT DISTINCT semester.SemesterName FROM semester WHERE SemesterID <> 0"; // Adjust the table and column names as needed
$result = mysqli_query($conn, $query);

$semesterNames = [];
while ($row = mysqli_fetch_assoc($result)) {
    $semesterNames[] = $row['SemesterName'];
}

// Fetch distinct Section Numbers for the filter
$query = "SELECT DISTINCT coursesection.SectionNum FROM coursesection WHERE SectionNum <> 0"; // Adjust the table and column names as needed
$result = mysqli_query($conn, $query);

$sectionnums = [];
while ($row = mysqli_fetch_assoc($result)) {
   $sectionnums[] = $row['SectionNum'];
}

// Fetch distinct Available Seats for the filter
$query = "SELECT DISTINCT coursesection.AvailableSeats FROM coursesection"; // Adjust the table and column names as needed
$result = mysqli_query($conn, $query);

$availbleseats = [];
while ($row = mysqli_fetch_assoc($result)) {
   $availbleseats[] = $row['AvailableSeats'];
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
      <img src="ua.png" alt="U.A. Logo" class="logo">
      <h1>Welcome to U.A. University</h1>
      <div class="button-container">
         <a href="visitor_departments1.php" class="btn">Departments</a>
      </div>
      <div class="button-container">
         <a href="visitor_majors1.php" class="btn">Majors</a>
      </div>
      <div class="button-container">
         <a href="visitor_minor1.php" class="btn">Minors</a>
      </div>
      <div class="button-container">
         <a href="academiccal.html" class="btn">Academic Calendar</a>
      </div>
      <div class="button-container">
         <a href="visitor_course_catalog1.php" class="btn">Course Catalog</a>
      </div>
      <div class="button-container">
         <a href="login_form1.php" class="btn">Login</a>
      </div>
   </div>

   <div class="welcome-statement">
      Welcome to U.A. University! We are delighted to extend a warm and enthusiastic welcome to all members of the U.A. University community. U.A. University is thrilled to have you as part of our academic family. Our dedicated faculty and staff are here to support and guide you every step of the way. We believe in your potential and are excited to see what you will achieve during your time at U.A. University.
      <br>
      <br>
      This page includes the Master Schedule for all course sections.
   </div>

   <!-- Search container for search input and button -->
   <div class="search-container">
       General Search: 
      <input type="text" id="searchInput" placeholder="General Search..." onkeyup="searchAndFilterTable()">
      <button onclick="resetTable()">Reset</button>
   </div>
   
   <div class="search-container">
       CRN:
      <input type="text" id="crnSearch" placeholder="Search by CRN..." onkeyup="searchAndFilterTable()">
      <button onclick="resetTable()">Reset</button>
	  
       Course ID:
      <input type="text" id="courseidSearch" placeholder="Search by Course ID..." onkeyup="searchAndFilterTable()">
      <button onclick="resetTable()">Reset</button>
      
      Course Name:
      <input type="text" id="coursenameSearch" placeholder="Search by Course Name..." onkeyup="searchAndFilterTable()">
      <button onclick="resetTable()">Reset</button>
   </div>
   
   <!-- Filter container for Section Number -->
   <div class="filter-container">
   <label for="sectionFilter">Section Number:</label>
   <select id="sectionFilter" onchange="searchAndFilterTable()">
      <option value="">All</option>
      <?php foreach ($sectionnums as $SectionNum): ?>
         <option value="<?php echo $SectionNum; ?>"><?php echo $SectionNum; ?></option>
      <?php endforeach; ?>
   </select>
   
   <label for="deptFilter">Department:</label>
   <select id="deptFilter" onchange="searchAndFilterTable()">
      <option value="">All</option>
      <?php foreach ($departmentIDs as $deptID): ?>
         <option value="<?php echo $deptID; ?>"><?php echo $deptID; ?></option>
      <?php endforeach; ?>
   </select>
   
    <label for="dayFilter">Day:</label>
   <select id="dayFilter" onchange="searchAndFilterTable()">
      <option value="">All</option>
      <?php foreach ($days as $day): ?>
         <option value="<?php echo $day; ?>"><?php echo $day; ?></option>
      <?php endforeach; ?>
   </select>
   
    <label for="buildingFilter">Building:</label>
   <select id="buildingFilter" onchange="searchAndFilterTable()">
      <option value="">All</option>
      <?php foreach ($buildingNames as $buildingName): ?>
         <option value="<?php echo $buildingName; ?>"><?php echo $buildingName; ?></option>
      <?php endforeach; ?>
   </select>

   <label for="roomFilter">Room:</label>
   <select id="roomFilter" onchange="searchAndFilterTable()">
      <option value="">All</option>
      <?php foreach ($roomIDs as $roomID): ?>
         <option value="<?php echo $roomID; ?>"><?php echo $roomID; ?></option>
      <?php endforeach; ?>
   </select>
   
    <label for="timeFilter">Time:</label>
   <select id="timeFilter" onchange="searchAndFilterTable()">
      <option value="">All</option>
      <?php foreach ($times as $time): ?>
         <option value="<?php echo $time; ?>"><?php echo $time; ?></option>
      <?php endforeach; ?>
   </select>
</div>

   <div class="search-container">
       Professor Name:
      <input type="text" id="professorSearch" placeholder="Search by Professor..." onkeyup="searchAndFilterTable()">
      <button onclick="resetTable()">Reset</button>
      
       Professor ID:
      <input type="text" id="professoridSearch" placeholder="Search by Professor ID..." onkeyup="searchAndFilterTable()">
      <button onclick="resetTable()">Reset</button>
   </div>

<div class="filter-container">
   <label for="semesterFilter">Semester:</label>
   <select id="semesterFilter" onchange="searchAndFilterTable()">
      <option value="">All</option>
      <?php foreach ($semesterNames as $semester): ?>
         <option value="<?php echo $semester; ?>"><?php echo $semester; ?></option>
      <?php endforeach; ?>
   </select>
   
   <label for="seatsFilter">Available Seats:</label>
   <select id="seatsFilter" onchange="searchAndFilterTable()">
      <option value="">All</option>
      <?php foreach ($availbleseats as $seats): ?>
         <option value="<?php echo $seats; ?>"><?php echo $seats; ?></option>
      <?php endforeach; ?>
   </select>
</div>




   <!-- Add similar filter containers for other columns if needed -->

   <table>
   <thead>
    <tr>
        <th>CRN</th>
		 <th>Course ID</th>
        <th>Course Name</th>
        <th>Section Num</th>
		 <th>Prerequisites</th>
        <th>Department</th>
        <th>Day</th>
        <th>Building</th>
        <th>Room</th>
        <th>Time</th>
        <th>Professor Name</th>  <!-- Add faculty name header -->
        <th>Professor ID</th>  <!-- Add faculty name header -->
		<th>Semester</th>
		<th>Available Seats</th>
    </tr>
</thead>

<tbody>
    <?php foreach ($courses as $course): ?>
        <tr>
            <td><?php echo $course['CRN']; ?></td>
			  <td><?php echo $course['CourseID']; ?></td>
            <td><?php echo $course['CourseName']; ?></td>
            <td><?php echo $course['SectionNum']; ?></td>
			  <td>
                <?php if (!empty($course['Prerequisites'])): ?>
                    <ul>
                        <?php foreach ($course['Prerequisites'] as $prerequisite): ?>
                            <li><?php echo $prerequisite; ?></li>
                        <?php endforeach; ?>
                    </ul>
                <?php else: ?>
                    None
                <?php endif; ?>
            </td>
            <td><?php echo $course['DeptName']; ?></td>
            <td><?php echo $course['Weekday']; ?></td>
            <td><?php echo $course['BuildingName']; ?></td>
            <td><?php echo $course['RoomID']; ?></td>
            <td><?php echo $course['StartTime'] . " to " . $course['EndTime']; ?></td>
            <td><?php echo $course['FacultyFirstName'] . " " . $course['FacultyLastName']; ?></td>  <!-- Display faculty name -->
            <td><?php echo $course['FacultyID']; ?></td>
			<td><?php echo $course['SemesterName']; ?></td>
			<td><?php echo $course['AvailableSeats']; ?></td>
        </tr>
    <?php endforeach; ?>
</tbody>

   </table>

<script>
      function searchAndFilterTable() {
        var searchText = document.getElementById('searchInput').value.toUpperCase();
        var crnText = document.getElementById('crnSearch').value.toUpperCase();
		var courseidText = document.getElementById('courseidSearch').value.toUpperCase();
        var coursenameText = document.getElementById('coursenameSearch').value.toUpperCase();
        var professorText = document.getElementById('professorSearch').value.toUpperCase();
        var professoridText = document.getElementById('professoridSearch').value.toUpperCase();
        var filters = {
            'Section Num': document.getElementById('sectionFilter').value.toUpperCase(),
            'Department': document.getElementById('deptFilter').value.toUpperCase(),
            'Building': document.getElementById('buildingFilter').value.toUpperCase(),
            'Day': document.getElementById('dayFilter').value.toUpperCase(),
            'Room': document.getElementById('roomFilter').value.toUpperCase(),
            'Time': document.getElementById('timeFilter').value.toUpperCase(),
            'Semester': document.getElementById('semesterFilter').value.toUpperCase(),
			'Available Seats': document.getElementById('seatsFilter').value.toUpperCase()
            // Add other filters here
        };

        var table = document.querySelector('table');
        var rows = table.getElementsByTagName('tr');

        for (var i = 0; i < rows.length; i++) {
            var row = rows[i];
            var showRow = true;

    for (var filter in filters) {
            var columnIndex = getColumnIndex(filter);
            if (columnIndex > -1) {
                var cell = row.getElementsByTagName('td')[columnIndex];
                if (cell) {
                    var cellValue = cell.textContent || cell.innerText;

                    if (filters[filter] !== 'ALL') {
                        var filterValue = filters[filter];

                        // Handle '0' as a special case for Available Seats
                        if (filter === 'Available Seats' && filterValue === '0') {
                            if (cellValue !== '0') {
                                showRow = false;
                                break;
                            }
                        } else {
                            if (cellValue.toUpperCase().indexOf(filterValue) === -1) {
                                showRow = false;
                                break;
                            }
                        }
                    }
                }
            }
        }

            var crnCell = row.getElementsByTagName('td')[0]; // Assuming CRN is in the 1st column
            if (crnCell) {
                var crnValue = crnCell.textContent || crnCell.innerText;
                if (crnValue.toUpperCase().indexOf(crnText) === -1 && crnText !== '') {
                    showRow = false;
                }
            }
			
            var courseidCell = row.getElementsByTagName('td')[1]; // Assuming Course ID is in the 1st column
            if (courseidCell) {
                var courseidValue = courseidCell.textContent || courseidCell.innerText;
                if (courseidValue.toUpperCase().indexOf(courseidText) === -1 && courseidText !== '') {
                    showRow = false;
                }
            }
            
            var coursenameCell = row.getElementsByTagName('td')[2]; // Assuming Course Name is in the 1st column
            if (coursenameCell) {
                var coursenameValue = coursenameCell.textContent || coursenameCell.innerText;
                if (coursenameValue.toUpperCase().indexOf(coursenameText) === -1 && coursenameText !== '') {
                    showRow = false;
                }
            }

            var professorCell = row.getElementsByTagName('td')[10]; // Assuming Professor Name is in the 9th column
            if (professorCell) {
                var professorValue = professorCell.textContent || professorCell.innerText;
                if (professorValue.toUpperCase().indexOf(professorText) === -1 && professorText !== '') {
                    showRow = false;
                }
            }
            
            var professoridCell = row.getElementsByTagName('td')[11]; // Assuming Professor ID is in the 10th column
            if (professoridCell) {
                var professoridValue = professoridCell.textContent || professoridCell.innerText;
                if (professoridValue.toUpperCase().indexOf(professoridText) === -1 && professoridText !== '') {
                    showRow = false;
                }
            }
            
            var rowData = row.textContent || row.innerText;
            if (rowData.toUpperCase().indexOf(searchText) > -1 && showRow) {
                row.style.display = '';
            } else {
                row.style.display = 'none';
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
        var table = document.querySelector('table');
        var rows = table.getElementsByTagName('tr');

        for (var i = 0; i < rows.length; i++) {
            rows[i].style.display = '';
        }

        document.getElementById('searchInput').value = '';
		document.getElementById('crnSearch').value = '';
		document.getElementById('coursenameSearch').value = '';
		document.getElementById('sectionFilter').value = '';
        // Reset all filter dropdowns to default
        document.getElementById('deptFilter').value = '';
        document.getElementById('buildingFilter').value = '';
        document.getElementById('dayFilter').value = '';
        document.getElementById('roomFilter').value = '';
        document.getElementById('timeFilter').value = '';
		document.getElementById('professorSearch').value = '';
		document.getElementById('professoridSearch').value = '';
        document.getElementById('semesterFilter').value = '';
		document.getElementById('seatsFilter').value = '';
        // Add other filter reset lines here if needed
    }

   </script>
</body>
</html>
