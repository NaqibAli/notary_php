<?php
session_start();
header("Content-Type: application/json");
require_once "config.php";
$action = $_POST['action'];



function payment_rpt($conn)
{
    extract($_POST);
    $query = "CALL rpt_payments('$from','$to') ";
    $ress = $conn->query($query);
    $result_data = array();
    $data = [];
    if ($ress) {
        $num_rows = $ress->num_rows;
        if ($num_rows > 0) {
            while ($rows = $ress->fetch_assoc()) {
                $data[] = $rows;
            }
            $result_data = array("status" => true, "message" => $data);
        } else {
            $result_data = array("status" => false, "message" => "Data Not Found");
        }
    } else {
        $result_data = array("status" => false, "message" => $conn->error);
    }
    echo json_encode($result_data);
}
if (isset($action)) {
    $action($conn);
}
