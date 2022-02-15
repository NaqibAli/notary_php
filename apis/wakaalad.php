<?php
session_start();
header("Content-Type: application/json");
require_once "config.php";
$action = $_POST['action'];

function insert($conn)
{
    extract($_POST);

    $result_info = '';
    $userId = $_SESSION['user_id'];

   
    $provider = $conn->real_escape_string($provider);

    $query = "CALL wakaalad_sp('','$provider','$Phone','$des','$receive','$mobile','$ref','$date','$userId','Insert')";
    $result = $conn->query($query);
    
    if ($result) {
        $Message = $result->fetch_assoc();
        $data = array();
        if ($Message['message'] == 'Inserted') {
            $data = array('status' => true, 'message' => 'Saved successfully');
        } 
    } else {
        $data = array('status' => false, 'message' => $conn->error);
    }

    echo json_encode($data);
}


function update($conn)
{
    extract($_POST);

    $result_info = '';
    $userId = $_SESSION['user_id'];
   
  
    $data = [];
   
    $provider = $conn->real_escape_string($provider);

    $query = "CALL 	wakaalad_sp('$custo_id','$provider','$Phone','$des','$receive','$mobile','$ref','$date','$userId','Update')";
    $result = $conn->query($query);

    if ($result) {
        $Message = $result->fetch_assoc();
        $data = array();
        if ($Message['message'] == 'Updated') {
            $data = array('status' => true, 'message' => 'Updated Suucessfully');
        } 
    } else {
        $data = array('status' => false, 'message' => $conn->error);
    }

    echo json_encode($data);
}

function delete_wakaalad($conn) {
    extract($_POST);
    
    $query = "DELETE FROM `wakaalad_tbl` WHERE ID = '$custo_id'";
    $result = $conn->query($query);
    $result_data = array();

    if ($result) {
   
        $result_data = array("status" => true, "message" => "Deleted successfully");
    }
    else {
        $result_data = array("status" => false, "message" => $conn->error);
    }

    echo json_encode($result_data);
}

if (isset($action)) {
    $action($conn);
}