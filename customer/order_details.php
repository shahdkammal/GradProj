<?php
// Define site and include necessary files
define('MYSITE', true);
include '../db/dbconnect.php';

$title = 'Main';
$css_directory = '../css/main.min.css';
$css_directory2 = '../css/main.min.css.map';
include 'includes/header.php';
include 'includes/navbar.php';
?>

<div class="container">
    <br><br>

    <?php
    // Fetch customer ID from session
    $customer_id = $_SESSION['customer_id'];
    
    // Query to get orders for the customer
    $query1 = "SELECT * FROM `order_master` WHERE `customer_id` = $customer_id ORDER BY order_id DESC";
    $result1 = mysqli_query($conn, $query1);

    if ($result1 && mysqli_num_rows($result1) > 0) {
        // Loop through each order
        while ($row1 = mysqli_fetch_assoc($result1)) {
            $order_id = $row1['order_id'];
            $full_name = $row1['full_name'];
            $delivery_address = $row1['address'];
            $pay_mode = $row1['pay_mode'];
            $total = $row1['total'];
            $order_date = $row1['order_date'];
            $due_date = $row1['due_date'];
            $estimated_date = date('j F, Y g:i A', strtotime($due_date));
            $real_order_date = date('j F, Y', strtotime($order_date));
            ?>

            <div class="bg-dark p-5">
                <div class="table-responsive-sm mt-3">
                    <table class="table table-hover table-dark">
                        <thead class="thead-dark">
                            <tr>
                                <th scope="col" colspan="5">Order Confirmation #<?php echo $order_id; ?></th>
                                <th scope="col" colspan="2">Order Date:</th>
                                <th scope="col" colspan="2"><?php echo $real_order_date; ?></th>
                            </tr>
                            <tr>
                                <th scope="col">Sno.</th>
                                <th scope="col">Service Name</th>
                                <th scope="col">Service Provider Name</th>
                                <th scope="col">Phone (SP)</th>
                                <th scope="col">Status</th>
                                <th scope="col">Qty.</th>
                                <th scope="col">Price</th>
                                <th scope="col">Total</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php
                            // Query to get user orders for the current order ID
                            $query2 = "SELECT * FROM `user_order` WHERE `order_id` = $order_id";
                            $result2 = mysqli_query($conn, $query2);

                            if ($result2 && mysqli_num_rows($result2) > 0) {
                                $sno = 0;
                                while ($row2 = mysqli_fetch_assoc($result2)) {
                                    $sno++;
                                    $service_title = $row2['service_title'];
                                    $price = $row2['price'];
                                    $qty = $row2['qty'];
                                    $status = $row2['status'];
                                    $sp_id = $row2['sp_id'];

                                    // Query to get service provider details
                                    $spname_query = "SELECT sp_name, phone FROM `sp` WHERE sp_id = $sp_id";
                                    $spname_result = mysqli_query($conn, $spname_query);
                                    $sp_name = $phone = '';
                                    if ($spname_result && $sprow = mysqli_fetch_assoc($spname_result)) {
                                        $sp_name = $sprow['sp_name'];
                                        $phone = $sprow['phone'];
                                    }
                                    ?>
                                    <tr>
                                        <th scope="row"><?php echo $sno; ?></th>
                                        <td><?php echo $service_title; ?></td>
                                        <td><?php echo $sp_name; ?></td>
                                        <td><?php echo $phone; ?></td>
                                        <td>
                                            <?php
                                            switch ($status) {
                                                case 'pending':
                                                    echo '<span class="badge badge-warning">Pending</span>';
                                                    break;
                                                case 'rejected':
                                                    echo '<span class="badge badge-danger">Rejected</span>';
                                                    break;
                                                case 'inprogress':
                                                    echo '<span class="badge badge-primary">In Progress</span>';
                                                    break;
                                                case 'completed':
                                                    echo '<span class="badge badge-success">Completed</span>';
                                                    break;
                                                case 'uncompleted':
                                                    echo '<span class="badge badge-secondary">Uncompleted</span>';
                                                    break;
                                            }
                                            ?>
                                        </td>
                                        <td><?php echo $qty; ?></td>
                                        <td><?php echo $price; ?></td>
                                        <td><?php echo $price * $qty; ?></td>
                                    </tr>
                                    <?php
                                }
                            } else {
                                echo "<tr><td colspan='8' class='text-center'>No services found for this order.</td></tr>";
                            }
                            ?>
                        </tbody>
                        <tfoot>
                            <tr>
                                <th colspan="7" class="text-right">TOTAL</th>
                                <td><?php echo $total; ?></td>
                            </tr>
                            <tr>
                                <th colspan="7" class="text-right">Delivery Address</th>
                                <td><?php echo $delivery_address; ?></td>
                            </tr>
                            <tr>
                                <th colspan="7" class="text-right">Estimated Delivery Date</th>
                                <td><?php echo $estimated_date; ?></td>
                            </tr>
                            <tr>
                                <td colspan="8" class="text-right">
                                    <form action="../php/invoice.php" method="post">
                                        <button type="submit" name="invoice" class="btn btn-success">Invoice</button>
                                        <input type="hidden" name="order_id" value="<?php echo $order_id; ?>">
                                        <input type="hidden" name="customer_id" value="<?php echo $customer_id; ?>">
                                    </form>
                                </td>
                            </tr>
                        </tfoot>
                    </table>
                </div>
            </div>
            <br><br>
        <?php
        }
    } else {
        echo "<div class='alert alert-warning text-center'>No orders found.</div>";
    }
    ?>
</div>

<?php
include '../includes/footer.php';
?>
