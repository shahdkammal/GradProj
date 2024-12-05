<?php
session_start();
include '../db/dbconnect.php';

if (isset($_POST['sendotp'])) {
    $username = $_POST['username'];
    $email = $_POST['email'];

    // Generate a random OTP
    $otp = rand(100000, 999999);
    
    // Store OTP in the session
    $_SESSION['otp'] = $otp;
    $_SESSION['email'] = $email;

    // Send OTP via email (This example uses PHP mail function)
    $subject = "Your OTP Code";
    $message = "Your OTP code is: " . $otp;
    $headers = "From: no-reply@yourdomain.com";
    
    if (mail($email, $subject, $message, $headers)) {
        $_SESSION['status'] = "OTP sent to your email.";
        header("Location: verify_otp.php");
    } else {
        $_SESSION['statusfail'] = "Failed to send OTP.";
        header("Location: forgotpassword.php");
    }
}
?>
