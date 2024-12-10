<?php
session_start();
include '../db/dbconnect.php';

if (isset($_POST['verify'])) {
    $entered_otp = $_POST['otp'];
    $new_password = $_POST['new_password'];
    $stored_otp = $_SESSION['otp'];
    $phone = $_SESSION['phone'];

    if ($entered_otp == $stored_otp) {
        // Hash the new password
        $hashed_password = password_hash($new_password, PASSWORD_DEFAULT);

        // Update the password in the database
        $update_query = "UPDATE login 
                         JOIN customer ON login.login_id = customer.login_id 
                         SET login.password = '$hashed_password' 
                         WHERE customer.phone = '$phone'";
        $update_result = mysqli_query($conn, $update_query);

        if ($update_result) {
            echo '<div class="container">
                    <div class="alert alert-success" role="alert">Password reset successfully!</div>
                    <a href="../login.php" class="btn btn-primary back-btn">Back to Login</a>
                  </div>';
        } else {
            echo '<div class="alert alert-danger" role="alert">Failed to reset password. Please try again.</div>';
        }
    } else {
        echo '<div class="alert alert-danger" role="alert">Invalid OTP. Please try again.</div>';
    }
}
?>
