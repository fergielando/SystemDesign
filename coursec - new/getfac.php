<?php

@include 'config1.php';

if (isset($_GET['dept_id'])) {
    $selectedDept = $_GET['dept_id'];

    
    $query = $conn->prepare("
    SELECT 
        fd.FacultyID, 
        u.FirstName, 
        u.LastName, 
        fd.PercentTime,
        COALESCE(SUM(pt.NumOfClass), 0) AS TotalClassesPT,
        COALESCE(SUM(ft.NumOfClass), 0) AS TotalClassesFT
    FROM facultydept fd
    INNER JOIN faculty f ON fd.FacultyID = f.FacultyID
    INNER JOIN user u ON f.FacultyID = u.UID
    LEFT JOIN facultypt pt ON f.FacultyID = pt.FacultyID
    LEFT JOIN facultyft ft ON f.FacultyID = ft.FacultyID
    WHERE fd.DeptID = ?
    GROUP BY fd.FacultyID, u.FirstName, u.LastName, fd.PercentTime
");

    
    $query->bind_param("s", $selectedDept);

    
    $query->execute();

    
    $result = $query->get_result();

    if ($result && $result->num_rows > 0) {
        $facultyData = array();
        while ($row = $result->fetch_assoc()) {
            $facultyData[] = $row;
        }
        echo json_encode($facultyData);
    } else {
        echo json_encode(array()); 
    }

    
    $query->close();
} else {
    echo json_encode(array()); 
}
?>
