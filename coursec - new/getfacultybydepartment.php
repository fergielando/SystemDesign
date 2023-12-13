<?php
@include 'config1.php'; 

if (isset($_GET['deptId']) && !empty($_GET['deptId'])) {
    $deptId = $_GET['deptId'];  

    
    $query = "SELECT f.FacultyID, f.Position, f.Specialty, f.FacultyType, fd.DeptID, fd.PercentTime FROM faculty f INNER JOIN facultydept fd ON f.FacultyID = fd.FacultyID WHERE fd.DeptID = ?";
    $stmt = mysqli_prepare($conn, $query);
    
    
    mysqli_stmt_bind_param($stmt, 's', $deptId);
    mysqli_stmt_execute($stmt);
    $result = mysqli_stmt_get_result($stmt);

    
    if ($result && mysqli_num_rows($result) > 0) {
        
        echo "<h3>Faculty Members</h3>";
        echo "<table border='1'>";
        echo "<tr><th>ID</th><th>Position</th><th>Specialty</th><th>Faculty Type</th><th>Department ID</th><th>Percent Time</th></tr>";

        
        while ($row = mysqli_fetch_assoc($result)) {
            echo "<tr>";
            echo "<td>" . htmlspecialchars($row['FacultyID']) . "</td>";
            echo "<td>" . htmlspecialchars($row['Position']) . "</td>";
            echo "<td>" . htmlspecialchars($row['Specialty']) . "</td>";
            echo "<td>" . htmlspecialchars($row['FacultyType']) . "</td>";
            echo "<td>" . htmlspecialchars($row['DeptID']) . "</td>";
            echo "<td>" . htmlspecialchars($row['PercentTime']) . "</td>";
            echo "</tr>";
        }
        echo "</table>";
    } else {
        echo "No faculty members found for this department.";
    }
} else {
    echo "Department ID not provided.";
}

if (isset($conn)) {
    mysqli_close($conn);
}
?>
