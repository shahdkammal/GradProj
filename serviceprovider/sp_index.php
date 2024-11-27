<?php
define('MYSITE', true);
include '../db/dbconnect.php';
$title = 'Service Provider';
include 'assets/include/sp_header.php';
$sp_id = $_SESSION['sp_id'];
?>


<!--Content right-->
<div class="col-sm-9 col-xs-12 content pt-3 pl-0">
    <h5 class="mb-3"><strong>Dashboard</strong></h5>

    <!--Dashboard widget-->
    <div class="mt-1 mb-3 button-container">

        <div class="col-lg-12 col-md-4 col-sm-6 col-12 mb-3 pl-0">
            <div class="bg-theme border shadow"> 
                    <div class="media p-4">
                        <div class="align-self-center mr-3 rounded-circle notify-icon bg-white">
                            <i class="fa fa-male text-theme"></i>
                        </div>
                        <div class="media-body pl-2">
                            <h3 class="mt-0 mb-0 text-white"><strong>Welcome, <?php echo $_SESSION['sp_username'] ?></strong></h3>
                            <p><small class="text-white bc-description">Service Provider</small></p>
                        </div>
                    </div>
            </div>
        </div>

        <div class="row pl-0">

            <div class="col-lg-4 col-md-4 col-sm-6 col-12 mb-3">
                <div class="bg-white border shadow">
                    <div class="media p-4">
                        <div class="align-self-center mr-3 rounded-circle notify-icon bg-theme">
                            <i class="fa fa-user"></i>
                        </div>
                        <div class="media-body pl-2">
                            <?php
                            $pendingorder = "SELECT COUNT(`status`) AS num_status FROM user_order where `status` = 'pending' AND sp_id = $sp_id";
                            $pendingresult = mysqli_query($conn, $pendingorder);
                            if ($pendingresult) {
                                while ($row = mysqli_fetch_assoc($pendingresult)) {
                                    $num_status = $row['num_status'];
                                }
                            ?>
                                <h3 class="mt-0 mb-0"><strong><?php echo $num_status ?></strong></h3>
                            <?php
                            }
                            ?>
                            <p><small class="text-muted bc-description">Pending Orders</small></p>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-lg-4 col-md-4 col-sm-6 col-12 mb-3">
                <div class="bg-white border shadow">
                    <div class="media p-4">
                        <div class="align-self-center mr-3 rounded-circle notify-icon bg-theme">
                            <i class="fas fa-times text-white"></i>
                        </div>
                        <div class="media-body pl-2">
                            <?php
                            $rejectedorder = "SELECT COUNT(`status`) AS num_rejected FROM user_order where `status` = 'rejected' AND sp_id = $sp_id";
                            $rejectedresult = mysqli_query($conn, $rejectedorder);
                            if ($rejectedresult) {
                                while ($row2 = mysqli_fetch_assoc($rejectedresult)) {
                                    $num_rejected = $row2['num_rejected'];
                                }
                            }
                            ?>
                            <h3 class="mt-0 mb-0"><strong><?php echo $num_rejected ?></strong></h3>
                            <p><small class="text-muted bc-description">Rejected Orders</small></p>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-lg-4 col-md-4 col-sm-6 col-12 mb-3">
                <div class="bg-white border shadow">
                        <div class="media p-4">
                            <div class="align-self-center mr-3 rounded-circle notify-icon bg-theme">
                                <i class="fa fa-check-circle"></i>
                            </div>
                            <div class="media-body pl-2">
                                <?php
                                $completeorder = "SELECT COUNT(`status`) AS num_status FROM user_order where `status` = 'completed' AND sp_id = $sp_id";
                                $completeresult = mysqli_query($conn, $completeorder);
                                if ($completeresult) {
                                    while ($row = mysqli_fetch_assoc($completeresult)) {
                                        $num_status = $row['num_status'];
                                    }
                                ?>
                                    <h3 class="mt-0 mb-0"><strong><?php echo $num_status ?></strong></h3>
                                <?php
                                }
                                ?>
                                <p><small class="text-muted bc-description">Completed Orders</small></p>
                            </div>
                        </div>
                </div>
            </div>

            <div class="col-lg-4 col-md-4 col-sm-6 col-12 mb-3">
                <div class="bg-white border shadow">
                    <div class="media p-4">
                        <div class="align-self-center mr-3 rounded-circle notify-icon bg-theme">
                            <i class="fa fa-cogs "></i>
                        </div>
                        <div class="media-body pl-2">
                            <?php
                            $servicegig = "SELECT COUNT(service_title) AS servicegig FROM sp_service where sp_id = $sp_id";
                            $servicegigresult = mysqli_query($conn, $servicegig);
                            if ($servicegigresult) {
                                while ($servicegigrow = mysqli_fetch_assoc($servicegigresult)) {
                                    $service_gig = $servicegigrow['servicegig'];
                                }
                            }
                            ?>
                            <h3 class="mt-0 mb-0"><strong><?php echo $service_gig ?></strong></h3>
                            <p><small class="bc-description text-muted">Total Services</small></p>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-lg-4 col-md-4 col-sm-6 col-12 mb-3">
                <div class="bg-theme border shadow">
                    <div class="media p-4">
                        <div class="align-self-center mr-3 rounded-circle notify-icon bg-white">
                            <i class="fa fa-tags text-theme"></i>
                        </div>
                        <div class="media-body pl-2">
                            <?php
                            $total = "SELECT SUM(price) AS total_revenue FROM user_order where sp_id = $sp_id";
                            $totalresult = mysqli_query($conn, $total);
                            while ($row4 = mysqli_fetch_assoc($totalresult)) {
                                $total = $row4['total_revenue'];
                            }

                            ?>
                            <h3 class="mt-0 mb-0"><strong><?php echo $total ?></strong></h3>
                            <p><small class="bc-description text-white">Total Income</small></p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--/Dashboard widget-->

    <?php
    include 'assets/include/sp_footer.php';
    ?>