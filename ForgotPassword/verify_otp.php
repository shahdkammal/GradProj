<?php
session_start();

if (isset($_POST['verifyotp'])) {
    $entered_otp = $_POST['otp'];
    
    if ($entered_otp == $_SESSION['otp']) {
        $_SESSION['otp_verified'] = true;
        header("Location: resettpas.php");
    } else {
        $_SESSION['statusfail'] = "Invalid OTP.";
    }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Verify OTP</title>
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
            <form action="verify_otp.php" method="post">
                <div class="form-group">
                    <label for="otp">Enter OTP</label>
                    <input type="text" class="form-control" name="otp" placeholder="Enter OTP">
                </div>
                <button type="submit" name="verifyotp" class="btn btn-primary">Verify OTP</button>
            </form>
        </div>
    </div>
</body>
</html>
