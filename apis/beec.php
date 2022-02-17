<?php
session_start();
header("Content-Type: application/json");
require_once "config.php";
$action = $_POST['action'];


function insert_update($conn)
{
    extract($_POST);

    $result_info = [];
    $userId = $_SESSION['user_id'];
    $data = [];
    
    $suppliersCount = isset($supplier) ? count($supplier) : 0 ;
    $witnessCount = isset($witness) ? count($witness) : 0 ;
    
    if ($suppliersCount == 0) {
        echo json_encode(array("status"=>false,"message"=>"You must select at least 1 supplier"));
        return;
    }

    if ($witnessCount == 0) {
        echo json_encode(array("status"=>false,"message"=>"You must select at least 1 Witness"));
        return;
    }

    $supplier_1 = $supplier[0];
    $supplier_2 = isset($supplier[1])?$supplier[1]:'';

    $witness_1 = $witness[0];
    $witness_2 = isset($witness[1])?$witness[1]:'';

    

    $query = "CALL vehicles_sp('$id','$type','$plate_no','$Chesis_No','$Manufactured_Year','$Color','$Cylinder_No','$amount','$ref','$owner_id','$supplier_1','$supplier_2','$witness_1','$witness_2','$register','$date','$userId','$action_type')";

    $result = $conn->query($query);

    if ($result) {
        if (isset($result->num_rows) and $result->num_rows > 0) {
       
        $Message = $result->fetch_assoc();
        $data = array();
        if ($Message['message'] == 'Inserted') {
            $data = array('status' => true, 'message' => 'Saved successfully');
        }else if($Message['message'] == 'Updated'){
            $data = array('status' => true, 'message' => 'Updated successfully');
        }    
    }
    } else {
        $data = array('status' => false, 'message' => $conn->error);
    }

    echo json_encode($data);
}

if (isset($action)) {
    $action($conn);
}else{
    echo json_encode(array("status"=>false,"message"=>"No Action defined"));
}
?>