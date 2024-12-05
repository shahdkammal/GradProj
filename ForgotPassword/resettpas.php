<?php
session_start();
include '../db/dbconnect.php';

if (!isset($_SESSION['otp_verified']) || $_SESSION['otp_verified'] !== true) {
    header("Location: forgotpassword.php");
    exit();
}

if (isset($_POST['resetpassword'])) {
    $new_password = password_hash($_POST['new_password'], PASSWORD_DEFAULT);
    $email = $_SESSION['email'];

    // Update the password in the database
    $sql = "UPDATE `login` SET `password` = ? WHERE `email` = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("ss", $new_password, $email);

    if ($stmt->execute()) {
        $_SESSION['status'] = "Password reset successfully.";
        header("Location: login.php");
    } else {
        $_SESSION['statusfail'] = "Failed to reset password.";
    }

    $stmt->close();
    $conn->close();
    unset($_SESSION['otp_verified']);
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Reset Password</title>
    <link rel="stylesheet" href="../serviceprovider/assets/css/bootstrap.min.css">
</head>
<body class="login-body">
    <div class="container-fluid login-wrapper">
        <div class="login-box">
            <?php
            if (isset($_SESSION['status'])) {
                echo '<div class="alert alert-success" role="alert">' . $_SESSION['status'] . '</div>';
                unset($_SESSION['status']);
            } elseif (isset($_SESSION['statusfail'])) {
                echo '<div class="alert alert-danger" role="alert">' . $_SESSION['statusfail'] . '</div>';
                unset($_SESSION['statusfail']);
            }
            ?>
            <form action="resettpas.php" method="post">
                <div class="form-group">
                    <label for="new_password">New Password</label>
                    <input type="password" class="form-control" name="new_password" placeholder="Enter new password">
                </div>
                <button type="submit" name="resetpassword" class="btn btn-primary">Reset Password</button>
            </form>
        </div>
    </div>
</body>
</html>
