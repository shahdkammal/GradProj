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
            echo "<div style='display: flex; justify-content: center; align-items: center; height: 100vh;'>
                        <div style='text-align: center; padding: 20px; border: 1px solid #ccc; border-radius: 10px; background-color: #f9f9f9; width: 50%;'>
                            <p style='color: green; font-weight: bold;'>Password changed successfully!</p>
                            <a href='../login.php' style='display: inline-block; margin-top: 10px; padding: 10px 15px; background-color: #007bff; color: white; text-decoration: none; border-radius: 5px;'>Return to login</a>
                        </div>
                      </div>";
        } else {
            echo '<div class="alert alert-danger" role="alert">Failed to reset password. Please try again.</div>';
        }
    } else {
        echo '<div class="alert alert-danger" role="alert">Invalid OTP. Please try again.</div>';
    }
}
?>
