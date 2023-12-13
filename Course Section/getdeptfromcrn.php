<?php
// Include your database configuration file
@include 'config1.php';

if (isset($_GET['CRN'])) {
    $CRN = mysqli_real_escape_string($conn, $_GET['CRN']);

    // Query to retrieve the department associated with the selected CRN
    $query = "SELECT c.DeptID AS dept_id
              FROM coursesection cs
              INNER JOIN course c ON cs.CourseID = c.CourseID
              WHERE cs.CRN = '$CRN'";
    $result = mysqli_query($conn, $query);

    if ($result && $row = mysqli_fetch_assoc($result)) {
        // Return department data as JSON
        echo json_encode(['dept_id' => $row['dept_id']]);
    } else {
        echo json_encode(['error' => 'Error fetching department data']);
    }
} else {
    echo json_encode(['error' => 'CRN not provided']);
}
?>
