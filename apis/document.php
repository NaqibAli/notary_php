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
    
    if (isset($_FILES['photo']['name'])) {
         if ($_FILES['photo']['error'] > 0) {
            $data = array('status' => false, 'message' => $_FILES['photo']['error']);
        } else {
            $photoName = $name.'_' . date("Y.m.d.h.i.sa").'_photo.png';
          
            move_uploaded_file($_FILES['photo']['tmp_name'], '../uploads/' . $photoName);
        }
    } 
    $name = $conn->real_escape_string($name);

    $query = "CALL document_sp('','$name','$Vehicle','$Chassis','$Plate','$Phone','$details','$Ref','$register','$userId','Insert')";
    $result = $conn->query($query);

    if ($result) {
        $Message = $result->fetch_assoc();
        $data = array();
        if ($Message['message'] == 'Inserted') {
            $data = array('status' => true, 'message' => 'New Document has been Saved successfully');
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

    $query = "CALL 	document_sp('$custo_id','$name','$Vehicle','$Chassis','$Plate','$Phone','$details','$Ref','$register','$userId','Update')";
    $result = $conn->query($query);

    if ($result) {
        $Message = $result->fetch_assoc();
        $data = array();
        if ($Message['message'] == 'Updated') {
            $data = array('status' => true, 'message' => 'Document Has Been Updated Suucessfully');
        } 
    } else {
        $data = array('status' => false, 'message' => $conn->error);
    }

    echo json_encode($data);
}

function delete_document($conn) {
    extract($_POST);
    
    $query = "DELETE FROM `document_tbl` WHERE id = '$custo_id'";
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