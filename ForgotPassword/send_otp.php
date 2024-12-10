<?php
session_start();
include '../db/dbconnect.php';

// Assuming 'username' is sent via POST
if (isset($_POST['username'])) {
    $username = $_POST['username'];

    // Query to get phone number from the customer table by joining the login table
    $query = "SELECT customer.phone 
              FROM customer 
              JOIN login ON customer.login_id = login.login_id 
              WHERE login.username = '$username'";
    $result = mysqli_query($conn, $query);

    if (mysqli_num_rows($result) > 0) {
        $row = mysqli_fetch_assoc($result);
        $phone = $row['phone'];

        // Logging the phone number for debugging purposes
        error_log("Phone number retrieved: " . $phone);

        // Generate a random OTP
        $otp = rand(100000, 999999);

        // Store OTP in the session
        $_SESSION['otp'] = $otp;
        $_SESSION['phone'] = $phone;

        // Prepare cURL request to send OTP via WhatsApp
        $params = array(
            'token' => 'it9mapw82nn7w4dg', // Replace with your Ultramsg token
            'to' => $phone, // Use the phone number from the database
            'body' => 'Your OTP code is: ' . $otp
        );

        $curl = curl_init();
        curl_setopt_array($curl, array(
            CURLOPT_URL => "https://api.ultramsg.com/instance101377/messages/chat",
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_ENCODING => "",
            CURLOPT_MAXREDIRS => 10,
            CURLOPT_TIMEOUT => 30,
            CURLOPT_SSL_VERIFYHOST => 0,
            CURLOPT_SSL_VERIFYPEER => 0,
            CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
            CURLOPT_CUSTOMREQUEST => "POST",
            CURLOPT_POSTFIELDS => http_build_query($params),
            CURLOPT_HTTPHEADER => array(
                "content-type: application/x-www-form-urlencoded"
            ),
        ));

        $response = curl_exec($curl);
        $err = curl_error($curl);

        curl_close($curl);

        if ($err) {
            echo "cURL Error #:" . $err;
        } else {
            
        }
    } else {
        echo "User not found.";
    }
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <title>OTP Sent</title>
    <style>
        body {
            background-color: #f8f9fa;
            font-family: 'Arial', sans-serif;
        }
        .container {
            margin-top: 50px;
            padding: 20px;
            border-radius: 10px;
            background-color: #ffffff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .title {
            color: #007bff;
        }
        .otp {
            font-size: 1.5em;
            color: #28a745;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2 class="title">OTP Sent Successfully</h2>
        <p class="lead">The OTP has been sent to your phone number. Below is the response from the API:</p>
        
        <p class="lead">Enter OTP to reset password:</p>
        <form action="verify_otp.php" method="post" class="mt-2">
            <div class="input-group mb-3">
                <input type="text" class="form-control mt-0" name="otp" placeholder="Enter OTP" required>
            </div>
            <div class="input-group mb-3">
                <input type="password" class="form-control mt-0" name="new_password" placeholder="Enter New Password" required>
            </div>
            <input type="submit" class="btn btn-theme btn-block p-2 mb-1" name="verify" value="RESET PASSWORD">
        </form>
    </div>
</body>
</html>
