<?php
ob_start(); // Start output buffering
define('MYSITE', true);
include '../db/dbconnect.php';

$title = 'Main';
$css_directory = '../css/main.min.css';
$css_directory2 = '../css/main.min.css.map';
include 'customer_index.php';

$name = $_POST["name"];
$message = $_POST["message"];
$priority = filter_input(INPUT_POST, "priority", FILTER_VALIDATE_INT);
$type = filter_input(INPUT_POST, "type", FILTER_VALIDATE_INT);

$host = "localhost";
$dbname = "hs";
$username = "root";
$password = "";

$conn = mysqli_connect($host, $username, $password, $dbname);

if (mysqli_connect_errno()) {
    die("Connection error: " . mysqli_connect_errno());
}

$sql = "INSERT INTO feedback (name, body, priority, type) VALUES (?, ?, ?, ?)";

$stmt = mysqli_stmt_init($conn);

if (!mysqli_stmt_prepare($stmt, $sql)) {
    die(mysqli_error($conn));
}

mysqli_stmt_bind_param($stmt, "ssii", $name, $message, $priority, $type);



if (mysqli_stmt_execute($stmt)) {
    $_SESSION['status'] = "Record Saved.";
    header("location: customer_index.php");
    exit();
} else {
    $_SESSION['statusfail'] = "Sorry, the record was not saved.";
    header("location: customer_index.php");
    exit();
}

include '../includes/footer.php';
ob_end_flush(); // End output buffering and flush output
?>


         