<?php
include '../db/dbconnect.php';

session_start();
if (!isset($_SESSION['username'])) {
    echo "You must log in first!";
    exit();
}
$logged_in_username = $_SESSION['username'];

$user_query = "SELECT login_id FROM login WHERE username = ?";
$user_stmt = $conn->prepare($user_query);
$user_stmt->bind_param("s", $logged_in_username);
$user_stmt->execute();
$user_result = $user_stmt->get_result();
$user_data = $user_result->fetch_assoc();

if ($user_data) {
    $login_id = $user_data['login_id'];
    $address_query = "SELECT address, first_name, last_name, phone, email FROM customer WHERE login_id = ?";
    $address_stmt = $conn->prepare($address_query);
    $address_stmt->bind_param("i", $login_id);
    $address_stmt->execute();
    $address_result = $address_stmt->get_result();
    $address_data = $address_result->fetch_assoc();
    if (!$address_data) {
        echo "No user data found in the customer table for login ID: " . $login_id . "<br>";
    }
} else {
    echo "No login ID found for username: " . $logged_in_username . "<br>";
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Profile</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        body {
            font-family: 'Roboto', Arial, sans-serif;
            margin: 0;
            padding: 0;
            background: #f3f4f6
            justify-content: center;
            align-items: center;
            height: 100vh; /* Ensures full-screen height */
        }
        .container {
            background-color: #ffffff;
            
            max-width: 800px;
            width: 100%;
            border-radius: 15px;
            box-shadow: 0px 0px 10px 10px rgba(0, 0, 0, 0.1);
            padding: 20px;
            margin-top: 3%;
        }
        .navbar {
            background-color: #1c315e;
        }
        .navbar-brand img {
            width: 150px;
        }
        .profile-header h2 {
            text-align: center;
            color: #2c3e50;
        }
        .profile-details p {
            display: flex;
            align-items: center;
            gap: 10px;
            font-size: 16px;
        }
        .profile-details p i {
            color: #3498db;
        }
        .change-password h3 {
            color: #2c3e50;
            margin-top: 20px;
        }
        .change-password button {
            margin-top: 10px;
        }
       .form-control{
        margin-top: 10px;
       }
    </style>
</head>
<body>
    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-dark sticky-top">
        <div class="container-fluid">
            <a class="navbar-brand" href="customer_index.php">
                <img src="../img/mainlogo.png" alt="Logo">
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item">
                        <a class="nav-link active" href="customer_index.php">Home</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- Profile Container -->
    <div class="container">
        <div class="profile-header">
            <h2>User Profile</h2>
        </div>
        <div class="profile-details mt-4">
            <p><i class="fas fa-user"></i> <strong>Username:</strong> <?= htmlspecialchars($logged_in_username); ?></p>
            <p><i class="fas fa-id-badge"></i> <strong>First Name:</strong> <?= htmlspecialchars($address_data['first_name'] ?? 'N/A'); ?></p>
            <p><i class="fas fa-id-badge"></i> <strong>Last Name:</strong> <?= htmlspecialchars($address_data['last_name'] ?? 'N/A'); ?></p>
            <p><i class="fas fa-map-marker-alt"></i> <strong>Address:</strong> <?= htmlspecialchars($address_data['address'] ?? 'N/A'); ?></p>
            <p><i class="fas fa-phone"></i> <strong>Phone:</strong> <?= htmlspecialchars($address_data['phone'] ?? 'N/A'); ?></p>
            <p><i class="fas fa-envelope"></i> <strong>Email:</strong> <?= htmlspecialchars($address_data['email'] ?? 'N/A'); ?></p>
        </div>
        <div class="change-password">
            <h3>Change Password</h3>
            <form action="change_password.php" method="POST">
                <input type="password" name="current_password" class="form-control" placeholder="Current Password" required>
                <input type="password" name="new_password" class="form-control" placeholder="New Password" required>
                <input type="password" name="confirm_password" class="form-control" placeholder="Confirm Password" required>
                <button type="submit" class="btn btn-primary w-100">Change Password</button>
            </form>
        </div>
    </div>


    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
