<?php
include '../db/dbconnect.php';
include 'assets/include/admin_header.php';
?>

<div class="col-sm-9 col-xs-12 content pt-3 pl-0">
    <div class="row">
        <div class="col-lg-5">
            <h5 class="mb-0"><strong>Customer</strong></h5>
            <span class="text-secondary">Dashboard <i class="fa fa-angle-right"></i> View Customer Details</span>
        </div>
        <div class="col-md-auto col-lg-7">
            <!-- Message section -->
            <?php
            if (isset($_SESSION['status'])) {
                echo '<div class="alert alert-success alert-dismissible fade show" role="alert">
                        <strong>Success! </strong> ' . $_SESSION['status'] . '
                        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                        </button>
                        </div>';
                unset($_SESSION['status']);
            } elseif (isset($_SESSION['statusfail'])) {
                echo '<div class="alert alert-danger alert-dismissible fade show" role="alert">
                        <strong>Sorry! </strong> ' . $_SESSION['statusfail'] . '
                        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                        </button>
                        </div>';
                unset($_SESSION['statusfail']);
            }
            ?>
        </div>
    </div>

    <div class="row mt-3">
        <div class="col-sm-12">
            <div class="mt-1 mb-3 p-3 button-container bg-white border shadow-sm">
                <div class="table-responsive">
                    <table id="example" class="table table-striped table-bordered">
                        <thead>
                            <tr>
                                <th>Sno.</th>
                                <th>Name</th>
                                <th>Email</th>
                                <th>Phone</th>
                                <th>City</th>
                                <th>Address</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php
                            $sql = "SELECT `customer`.*, `city`.* FROM `customer` INNER JOIN `city` ON `customer`.city_id=`city`.city_id";
                            $result = mysqli_query($conn, $sql);
                            if ($result) {
                                $sno = 0;
                                while ($row = mysqli_fetch_assoc($result)) {
                                    $sno++;
                                    $login_id = $row['login_id'];
                                    $customer_id = $row['customer_id'];
                                    $first_name = $row['first_name'];
                                    $last_name = $row['last_name'];
                                    $email = $row['email'];
                                    $phone = $row['phone'];
                                    $city = $row['city_name'];
                                    $address = $row['address'];

                                    echo '<tr>
                                            <td>' . $sno . '</td>
                                            <td>' . $first_name . ' ' . $last_name . '</td>
                                            <td>' . $email . '</td>
                                            <td>' . $phone . '</td>
                                            <td>' . $city . '</td>
                                            <td>' . $address . '</td>
                                          </tr>';
                                }
                            }
                            ?>
                        </tbody>
                        <tfoot>
                            <tr>
                                <th>Sno.</th>
                                <th>Name</th>
                                <th>Email</th>
                                <th>Phone</th>
                                <th>City</th>
                                <th>Address</th>
                            </tr>
                        </tfoot>
                    </table>
                </div>
            </div>
        </div>
    </div>

    <!-- Page JavaScript Files-->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script src="assets/js/sweetalert.js"></script>
    <script src="assets/js/progressbar.min.js"></script>
    <script src="assets/js/charts/canvas.min.js"></script>
    <script src="assets/js/calendar/bootstrap_calendar.js"></script>
    <script src="assets/js/calendar/demo.js"></script>
    <script src="assets/js/jquery.dataTables.min.js"></script>
    <script src="assets/js/dataTables.bootstrap4.min.js"></script>
    <script src="assets/js/jsgrid.min.js"></script>
    <script src="assets/js/jsgrid-demo.php"></script>
    <script src="assets/js/custom.js"></script>
    <script>
        $('#example').DataTable();
    </script>
    <?php
    include 'assets/include/admin_footer.php';
    ?>
