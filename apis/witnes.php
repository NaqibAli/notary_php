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
  
  
    $data = [];
    $photoName = '';
    
    $name = $conn->real_escape_string($name);

    $query = "CALL witness_sp('','$name','$phone','$userId','Insert')";
    $result = $conn->query($query);

    if ($result) {
        $Message = $result->fetch_assoc();
        $data = array();
        if ($Message['message'] == 'Inserted') {
            $data = array('status' => true, 'message' => 'Saved successful');
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
    $name = $conn->real_escape_string($name);
    $query = "CALL witness_sp('$id','$name','$phone','$userId','Update')";
    $result = $conn->query($query);

    if ($result) {
        $Message = $result->fetch_assoc();
        $data = array();
        if ($Message['message'] == 'Updated') {
            $data = array('status' => true, 'message' => 'Updated successful');
        } 
    } else {
        $data = array('status' => false, 'message' => $conn->error);
    }

    echo json_encode($data);
}

function delete($conn) {
    extract($_POST);
    
    $query = "DELETE FROM `witness_tbl` WHERE id = '$id'";
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