<?php
// define('MYSITE', true);
include '../db/dbconnect.php';

// Check connection
if ($conn->connect_error) {
    die("<div style='display: flex; justify-content: center; align-items: center; height: 100vh;'>
            <div style='text-align: center; padding: 20px; border: 1px solid #ccc; border-radius: 10px; background-color: #f9f9f9; width: 50%;'>
                <p style='color: red; font-weight: bold;'>Connection failed: " . $conn->connect_error . "</p>
            </div>
          </div>");
}
session_start();
if (!isset($_SESSION['username'])) {
    die("<div style='display: flex; justify-content: center; align-items: center; height: 100vh;'>
            <div style='text-align: center; padding: 20px; border: 1px solid #ccc; border-radius: 10px; background-color: #f9f9f9; width: 50%;'>
                <p style='color: red; font-weight: bold;'>No user is logged in.</p>
            </div>
          </div>");
}
$logged_in_username = $_SESSION['username'];

$user_query = "SELECT password FROM login WHERE username = ?";
$user_stmt = $conn->prepare($user_query);
$user_stmt->bind_param("s", $logged_in_username);
$user_stmt->execute();
$user_result = $user_stmt->get_result();
$user_data = $user_result->fetch_assoc();

if ($user_data) {
    $current_password_hash = $user_data['password'];
} else {
    echo "<div style='display: flex; justify-content: center; align-items: center; height: 100vh;'>
            <div style='text-align: center; padding: 20px; border: 1px solid #ccc; border-radius: 10px; background-color: #f9f9f9; width: 50%;'>
                <p style='color: red; font-weight: bold;'>No user found with username: " . htmlspecialchars($logged_in_username) . "</p>
            </div>
          </div>";
    exit;
}

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $current_password = $_POST['current_password'];
    $new_password = $_POST['new_password'];
    $confirm_password = $_POST['confirm_password'];

    if (password_verify($current_password, $current_password_hash)) {
        if ($new_password === $confirm_password) {
            $new_password_hash = password_hash($new_password, PASSWORD_DEFAULT);
            $update_query = "UPDATE login SET password = ? WHERE username = ?";
            $update_stmt = $conn->prepare($update_query);
            $update_stmt->bind_param("ss", $new_password_hash, $logged_in_username);

            if ($update_stmt->execute()) {
                echo "<div style='display: flex; justify-content: center; align-items: center; height: 100vh;'>
                        <div style='text-align: center; padding: 20px; border: 1px solid #ccc; border-radius: 10px; background-color: #f9f9f9; width: 50%;'>
                            <p style='color: green; font-weight: bold;'>Password changed successfully!</p>
                            <a href='../login.php' style='display: inline-block; margin-top: 10px; padding: 10px 15px; background-color: #007bff; color: white; text-decoration: none; border-radius: 5px;'>Return to login</a>
                        </div>
                      </div>";
            } else {
                echo "<div style='display: flex; justify-content: center; align-items: center; height: 100vh;'>
                        <div style='text-align: center; padding: 20px; border: 1px solid #ccc; border-radius: 10px; background-color: #f9f9f9; width: 50%;'>
                            <p style='color: red; font-weight: bold;'>Error updating password.</p>
                        </div>
                      </div>";
            }
            $update_stmt->close();
        } else {
            echo "<div style='display: flex; justify-content: center; align-items: center; height: 100vh;'>
                    <div style='text-align: center; padding: 20px; border: 1px solid #ccc; border-radius: 10px; background-color: #f9f9f9; width: 50%;'>
                        <p style='color: red; font-weight: bold;'>New passwords do not match.</p>
                    </div>
                  </div>";
        }
    } else {
        echo "<div style='display: flex; justify-content: center; align-items: center; height: 100vh;'>
                <div style='text-align: center; padding: 20px; border: 1px solid #ccc; border-radius: 10px; background-color: #f9f9f9; width: 50%;'>
                    <p style='color: red; font-weight: bold;'>Current password is incorrect.</p>
                </div>
              </div>";
    }
}

$user_stmt->close();
$conn->close();
?>