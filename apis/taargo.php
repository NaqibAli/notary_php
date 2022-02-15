<?php
session_start();
header("Content-Type: application/json");
require_once "config.php";
$action = $_POST['action'];



function insert_taargo($conn)
{
    extract($_POST);

    $result_info = '';
    $userId = $_SESSION['user_id'];
  
    $data = [];

    $photoName = '';
    
    if (isset($_FILES['photo']['name'])) {
        if ($_FILES['photo']['error'] > 0) {
           $data = array('status' => false, 'Message' => $_FILES['photo']['error']);
       } else {
           $photoName = $owner_id.'_' . date("Y.m.d.h.i.sa").'_photo.png';
         
           move_uploaded_file($_FILES['photo']['tmp_name'], '../images/' . $photoName);
       }
   } 
    $Phone = $conn->real_escape_string($Phone);

    $query = "CALL 	taago_sp('','$owner_id','$Phone','$photoName','$date','$userId','Insert')";
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

function Update_taargo($conn){
    extract($_POST);

    $result_info = '';
    $userId = $_SESSION['user_id'];
   
  
    $data = [];
    
    $photoName = $imgName;
   
    if (isset($_FILES['photo']['name'])) {
        if ($_FILES['photo']['error'] > 0) {
           $data = array('status' => false, 'Message' => $_FILES['photo']['error']);
       } else {
           $photoName = $owner_id.'_' . date("Y.m.d.h.i.sa").'_photo.png';
         
           move_uploaded_file($_FILES['photo']['tmp_name'], '../images/' . $photoName);
       }
   } 
    $Phone = $conn->real_escape_string($Phone);
    $query = "CALL 	taago_sp('$taargo_id','$owner_id','$Phone','$photoName','$date','$userId','Update')";
    $result = $conn->query($query);
    

    if ($result) {
        $Message = $result->fetch_assoc();
        $data = array();
        if ($Message['message'] == 'Updated') {
            $data = array('status' => true, 'message' => 'Updated successfully');
        } 
    } else {
        $data = array('status' => false, 'message' => $conn->error);
    }

    echo json_encode($data);
}

function delete_taargo($conn) {
    extract($_POST);
  
    
    $query = "DELETE FROM taargo_tbl WHERE ID = '$taargo_id'";
    $result = $conn->query($query);
    $result_data = array();

    if ($result) {
   
        $result_data = array("status" => true, "message" => "Customer Has Been Deleted successfully");
    }
    else {
        $result_data = array("status" => false, "message" => $conn->error);
    }

    echo json_encode($result_data);
}

if (isset($action)) {
    $action($conn);
}