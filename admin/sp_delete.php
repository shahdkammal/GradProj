<?php
include '../db/dbconnect.php';
session_start();

if (isset($_GET['spid']) && isset($_GET['loginid'])) {
    $sp_id = $_GET['spid'];
    $login_id = $_GET['loginid'];
    echo "Login ID: " . htmlspecialchars($login_id) . "<br>"; // For debugging

    // Start a transaction
    $conn->begin_transaction();

    try {
        // Delete related rows in sp_service table
        $sql1 = "DELETE FROM `sp_service` WHERE `sp_id` = ?";
        $stmt1 = $conn->prepare($sql1);
        if ($stmt1) {
            $stmt1->bind_param("i", $sp_id);
            $stmt1->execute();
            $stmt1->close();
        } else {
            throw new Exception("Error preparing statement for sp_service table: " . $conn->error);
        }

        // Delete row in sp table
        $sql2 = "DELETE FROM `sp` WHERE `sp_id` = ?";
        $stmt2 = $conn->prepare($sql2);
        if ($stmt2) {
            $stmt2->bind_param("i", $sp_id);
            $stmt2->execute();
            $stmt2->close();
        } else {
            throw new Exception("Error preparing statement for sp table: " . $conn->error);
        }

        // Delete row in login table
        $sql3 = "DELETE FROM `login` WHERE `login_id` = ?";
        $stmt3 = $conn->prepare($sql3);
        if ($stmt3) {
            $stmt3->bind_param("i", $login_id);
            $stmt3->execute();
            $stmt3->close();
        } else {
            throw new Exception("Error preparing statement for login table: " . $conn->error);
        }

        // Commit the transaction
        $conn->commit();
        $_SESSION['status'] = "Service Provider is deleted successfully.";
        header("location: sp_view.php");
    } catch (Exception $e) {
        // Rollback the transaction if there was an error
        $conn->rollback();
        echo 'Error: ' . $e->getMessage();
        $_SESSION['statusfail'] = "Sorry, Service Provider is not deleted.";
        header("location: sp_view.php");
    }
} else {
    echo "Missing spid or loginid parameter.";
}

$conn->close();
?>
