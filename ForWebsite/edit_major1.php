<?php
@include 'config1.php';

// Check if a major ID is provided in the URL
if (isset($_GET['id'])) {
    $majorID = mysqli_real_escape_string($conn, $_GET['id']);

    // Retrieve the major information from the database based on the provided major ID
    $query = "SELECT * FROM major WHERE MajorID = '$majorID'";
    $result = mysqli_query($conn, $query);

    if (mysqli_num_rows($result) > 0) {
        $major = mysqli_fetch_assoc($result);
    } else {
        // Handle the case where the major with the given ID doesn't exist
        echo "Major not found.";
        exit;
    }
} else {
    // Handle the case where no major ID is provided in the URL
    echo "Major ID not provided.";
    exit;
}

// Update major information
if (isset($_POST['update'])) {
    $newDeptID = mysqli_real_escape_string($conn, $_POST['newDeptID']);
    $newMajorName = mysqli_real_escape_string($conn, $_POST['newMajorName']);

    $updateQuery = "UPDATE major SET DeptID = '$newDeptID', MajorName = '$newMajorName' WHERE MajorID = '$majorID'";

    if (mysqli_query($conn, $updateQuery)) {
        // Redirect back to the majors list page after the update is successful
        header('location:Majors1.php');
    } else {
        // Handle the case where the update fails
        echo "Update failed. Please try again.";
    }
}
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE-edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Major</title>

    <link rel="stylesheet" href="css/fatman1.css">

    <style>
        body {
            margin: 0;
            font-family: 'Arial', sans-serif;
            background-color: #f0f0f0;
            color: #333;
        }

        .header {
            background: #3498db;
            color: #fff;
            padding: 20px;
            text-align: center;
            display: flex;
            justify-content: space-between;
            align-items: center;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        .header h1 {
            font-size: 36px;
            margin: 0;
        }

        .header .back-button {
            background: #2980b9;
            color: #fff;
            padding: 10px 20px;
            text-decoration: none;
            border-radius: 5px;
            margin-right: 10px;
            transition: background-color 0.3s ease;
        }

        .header .back-button:hover {
            background-color: #1c6281;
        }

        .edit-major-container {
            max-width: 600px;
            margin: 20px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        h2 {
            text-align: center;
            color: #3498db;
        }

        form {
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        input {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
        }

        input[type="submit"] {
            background-color: #3498db;
            color: #fff;
            cursor: pointer;
            border: none;
            border-radius: 5px;
            padding: 12px;
            font-size: 16px;
            transition: background-color 0.3s ease;
        }

        input[type="submit"]:hover {
            background-color: #2980b9;
        }
    </style>
</head>

<body>

    <div class="header">
        <h1>Edit Major</h1>
        <a href="majors1.php" class="back-button">Back to Majors List</a>
    </div>

    <div class="edit-major-container">
        <h2>Edit Major Information</h2>
        <form action="" method="post">
            <input type="text" name="newDeptID" placeholder="Department ID" value="<?php echo $major['DeptID']; ?>">
            <input type="text" name="newMajorName" placeholder="Major Name" value="<?php echo $major['MajorName']; ?>">
            <input type="submit" name="update" value="Update Major">
        </form>
    </div>

    <!-- Add any other elements or styling as needed -->

</body>

</html>
