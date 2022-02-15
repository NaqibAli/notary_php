<?php
session_start();
header("Content-Type: application/json");
require_once "config.php";
$action = $_POST['action'];
//insert function

function insert($conn)
{
    $user_id = generate_id($conn);
    $created_user = $_SESSION['user_id'];
    extract($_POST);
    $query = "CALL sp_users('$user_id','$user_name','$password','user.jpg','$user_status','$role', '$email','$created_user','$created_date')";
    $res = $conn->query($query);
    $result_data = array();
    if ($res) {
        $message = $res->fetch_assoc();
        if ($message['message'] == "Inserted") {
            $result_data = array("status" => true, "message" => "New User Has Been Registered Suucessfully");
        } else {
            $result_data = array("status" => false, "message" => "New User Has Been Registered Suucessfully");
        }
    } else {
        $result_data = array("status" => false, "message" => $conn->error);
    }
    echo json_encode($result_data);
}
//Update function
function update($conn)
{
    $created_user = 'USR0001';
    extract($_POST);
    $query = "CALL sp_users('$user_id','$user_name','$password','','$user_status','$role', '$email','$created_user','$created_date')";
    $res = $conn->query($query);
    $result_data = array();
    if ($res) {
        $message = $res->fetch_assoc();
        if ($message['message'] == "Updated") {
            $result_data = array("status" => true, "message" => "User Has Been Updated Suucessfully");
        } else {
            $result_data = array("status" => false, "message" => "User Has Not Been Updated Suucessfully");
        }
    } else {
        $result_data = array("status" => false, "message" => $conn->error);
    }
    echo json_encode($result_data);
}
//delete function
function delete_user($conn)
{
    extract($_POST);
    $query = "DELETE FROM `users_tbl` WHERE users_tbl.user_id='$user_id'";
    $res = $conn->query($query);
    $result_data = array();
    if ($res) {
        $result_data = array("status" => true, "message" => "User Has Been Deleted Successfully!");
    } else {
        $result_data = array("status" => false, "message" => $conn->error);
    }
    echo json_encode($result_data);
}
//delete function
function delete_notice($conn)
{
    extract($_POST);
    $query = "DELETE FROM `notices` WHERE notices.id='$id'";
    $res = $conn->query($query);
    $result_data = array();
    if ($res) {
        $result_data = array("status" => true, "message" => "Notice Has Been Deleted Successfully!");
    } else {
        $result_data = array("status" => false, "message" => $conn->error);
    }
    echo json_encode($result_data);
}


function generate_id($conn)
{
    $query = "SELECT user_id from users_tbl  ORDER by user_id ASC";
    $result = $conn->query($query);
    $user_id = '';
    if ($result) {
        $num_rows = $result->num_rows;
        if ($num_rows > 0) {
            while ($row = $result->fetch_assoc()) {
                $user_id = $row['user_id'];
            }
            $user_id++;
        } else {
            $user_id = "USR001";
        }
        return $user_id;
    }
}
//Reading Users Information
function load_users($conn)
{
    extract($_POST);
  $role =   $_SESSION['role'];
    $query = "CALL usp_select_users('$role')";
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


//Reading users Information
// function fill_users($conn)
// {
//     extract($_POST);
//     $query = "SELECT `parent_id`, `name` FROM `parents` ";
//     $ress = $conn->query($query);
//     $result_data = array();
//     $data = [];
//     if ($ress) {
//         $num_rows = $ress->num_rows;
//         if ($num_rows > 0) {
//             while ($rows = $ress->fetch_assoc()) {
//                 $data[] = $rows;
//             }
//             $result_data = array("status" => true, "message" => $data);
//         } else {
//             $result_data = array("status" => false, "message" => "Data Not Found");
//         }
//     } else {
//         $result_data = array("status" => false, "message" => $conn->error);
//     }
//     echo json_encode($result_data);
// }
//fetching Users Information
function fetch_users($conn)
{
    extract($_POST);
    $query = "SELECT * FROM `users_tbl` WHERE users_tbl.user_id='$user_id'";
    $ress = $conn->query($query);
    $result_data = array();
    $data = [];
    if ($ress) {
        $num_rows = $ress->num_rows;
        if ($num_rows > 0) {
            while ($rows = $ress->fetch_assoc()) {
                $data = $rows;
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

function login($conn)
{

    extract($_POST);
    $sql = "CALL Login_sp('$user_name','$password')";
    $result =  $conn->query($sql);
    $result_data = array();

    
    if ($result) {
            $data = [];
            $row = $result->fetch_assoc();
            if (isset($row['message'])) {
                $result_data = array("status" => false, "message" => "Username or Password is incorrect");
          
            }else {
                $data[] = $row;
                
                $result_data = array("status" => true, "message" => $data);
                foreach($row as $key => $value) {

                    $_SESSION[$key] = $value;
                    
                }
               
            }
             
    }
    else {
        $result_data = array("status" => false, "message" => $conn->error);
    }

    echo json_encode($result_data);
}


if (isset($action)) {
    $action($conn);
}
