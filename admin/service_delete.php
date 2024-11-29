<?php
include '../db/dbconnect.php';
session_start();

if(isset($_GET['deleteid'])){
    $service_id = $_GET['deleteid'];

    // Start a transaction
    $conn->begin_transaction();

    try {
        // Delete related rows in sp_service table
        $sql1 = "DELETE FROM `sp_service` WHERE `service_id` = ?";
        $stmt1 = $conn->prepare($sql1);
        if ($stmt1) {
            $stmt1->bind_param("i", $service_id);
            $stmt1->execute();
            $stmt1->close();
        } else {
            throw new Exception("Error preparing statement for sp_service table: " . $conn->error);
        }

        // Delete row in service table
        $sql2 = "DELETE FROM `service` WHERE `service`.`service_id` = ?";
        $stmt2 = $conn->prepare($sql2);
        if ($stmt2) {
            $stmt2->bind_param("i", $service_id);
            $stmt2->execute();
            $stmt2->close();
        } else {
            throw new Exception("Error preparing statement for service table: " . $conn->error);
        }

        // Commit the transaction
        $conn->commit();
        $_SESSION['status'] = "Service is deleted successfully.";
        header("location: service_view.php");
    } catch (Exception $e) {
        // Rollback the transaction if there was an error
        $conn->rollback();
        $_SESSION['statusfail'] = "Sorry, service is not deleted.";
        echo 'Error: ' . $e->getMessage();
        header("location: service_view.php");
    }
}
$conn->close();
?>
