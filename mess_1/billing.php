<?php
include_once 'config/Database.php';
include_once 'class/User.php';

$database = new Database();
$db = $database->getConnection();

$user = new User($db);

if (!$user->loggedIn()) {
    header("Location: index.php");
}
include('inc/header.php');
?>

<html>

<head>
    <title>Sadguru Mess</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/libs/jquery/2.1.3/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css">
    <script src="js/jquery.dataTables.min.js"></script>
    <script src="js/dataTables.bootstrap.min.js"></script>
    <link rel="stylesheet" href="css/dataTables.bootstrap.min.css" />
    <script src="js/category.js"></script>
    <script src="js/general.js"></script>
    <style>
        .col-sm-6 {
            float: right;
        }

        div.dataTables_wrapper div.dataTables_filter {
            text-align: left;
        }
    </style>
    <?php include('inc/container.php'); ?>
</head>

<body>
    <br>
    <div>
        <img src="payment.jpg" alt="payment Image">
    </div>
    <h4>payment</h4>
    <br>
    <div class="panel-heading">
        <div class="row">
            <div class="col-md-10">
                <h3 class="panel-title"></h3>
            </div>
        </div>
    </div>
    <?php include('inc/footer.php'); ?>
</body>

</html>
