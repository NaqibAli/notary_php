<?php
session_start();
header("Content-Type: application/json");
require_once "config.php";
$action = $_POST['action'];

function insert_vehicle($conn)
{
    extract($_POST);

    $result_info = '';
    $userId = $_SESSION['user_id'];
  
    $data = [];
    if(count($witness)<2){
        $data = array('status' => false, 'message' => 'you must select 2 witness');
        echo json_encode($data);
        return;
    }
    if(count($supplier)<1){
        $data = array('status' => false, 'message' => 'you must select at least 1 Supplier');
        echo json_encode($data);
        return;
    }
    $supplier_1 = $supplier[0];
    $supplier_2 = isset($supplier[1])?$supplier[1]:"";
    $type = $conn->real_escape_string($type);

    $query = "CALL 	vehicles_sp('','$type','$plate_no','$Chesis_No','$Manufactured_Year','$Color','$Cylinder_No','$amount','$ref','$owner','$supplier_1','$supplier_2','$witness[0]','$witness[1]','$register','$date','$userId','Insert')";
    $result = $conn->query($query);

    if ($result) {
        $Message = $result->fetch_assoc();
        $data = array();
        if ($Message['message'] == 'Inserted') {
            $data = array('status' => true, 'message' => 'New Vehicle has been Saved successfully');
        } 
    } else {
        $data = array('status' => false, 'message' => $conn->error);
    }

    echo json_encode($data);
}

function update_vehicle($conn){
    extract($_POST);

    $result_info = '';
    $userId = $_SESSION['user_id'];
   
  
    $data = [];
   
    $type = $conn->real_escape_string($type);

    $query = "CALL 	vehicles_sp('$vehicles_id','$type','$plate_no','$Chesis_No','$Manufactured_Year','$Color','$Cylinder_No','$amount','$register','$date','$userId','Update')";
    $result = $conn->query($query);

    if ($result) {
        $Message = $result->fetch_assoc();
        $data = array();
        if ($Message['message'] == 'Updated') {
            $data = array('status' => true, 'message' => 'Vehicle has been Updated successfully');
        } 
    } else {
        $data = array('status' => false, 'message' => $conn->error);
    }

    echo json_encode($data);
}

function delete_vehicle($conn) {
    extract($_POST);
  
    
    $query = "DELETE FROM vehicle_tbl WHERE id = '$vehicles_id'";
    $result = $conn->query($query);
    $result_data = array();

    if ($result) {
   
        $result_data = array("status" => true, "message" => "Vehicle Has Been Deleted successfully");
    }
    else {
        $result_data = array("status" => false, "message" => $conn->error);
    }

    echo json_encode($result_data);
}

if (isset($action)) {
    $action($conn);
}