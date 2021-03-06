traffic_get_SP();
fill_customer();
fill_suppliers();
fill_witness()

var btn_action = "insert";
var ModelPopup = $('#model');

let showModalBtn = $("#btn_modle");

showModalBtn.on("click", function() {
    $("#form")[0].reset();
    $("#model").modal('show');
});

$("#table").on("click", "button.delete", function(e) {
    console.log('yes clicked')
    var vehicles_id = $(this).attr("vehicles_id");
    if (confirm("Are You sure To Delete This:  " + " " + vehicles_id + " ?")) {
        delete_vehicle(vehicles_id);
    } else {
        alert("Failed to Delete This ID" + " " + vehicles_id)
    }



});

$("#table").on("click", "button.edit", function() {
    var vehicles_id = $(this).attr("vehicles_id");
    btn_action = "update";
    read_traffic(vehicles_id);
    window.scroll(0, 0);
});

$("#owner_id").change(function() {
    var opt = $('#owners_list option[value="' + $(this).val() + '"]');
    if (opt.length) {
        var value = opt.attr('owner_id');
        $("#owner_id").attr('owner_id', value);
    } else {
        $("#owner_id").val("");
        $("#owner_id").focus();
        $("#owner_id").attr('owner_id', '');
        return;
    }
});



$("#form").on("submit", function(e) {
    e.preventDefault();

    var form_data = new FormData($("#form")[0]);


    if (btn_action == "insert") {
        form_data.append('action_type', 'Insert');
    } else {
        form_data.append('action_type', 'Update');
    }

    form_data.append("id",$("#beec_id").val())
    form_data.append("owner_id",$("#owner_id").attr('owner_id'))
    form_data.append("action",'insert_update')




    $.ajax({
        method: "POST",
        url: "../apis/beec.php",
        dataType: 'json',
        contentType: false,
        processData: false,
        data: form_data,
        success: function(data) {
            var status = data.status;
            var message = data.message;

            if (status == true) {

                btn_action = "insert";
                $('#SupplierSelect').val([]).trigger('change');
                $('#witness').val([]).trigger('change');
                window.scroll(0, 0);
                $("#form")[0].reset();
                swal({
                    title: "Done!",
                    text: message,
                    icon: "success",
                    button: "OK!",
                });

            } else {
                swal('Error!', message, 'error');
                // show_toast('error', message)
                window.scroll(0, 0);


            }
        },
        error: function(data) {

        }
    });

});


function traffic_get_SP() {

    var data = {
        "action": "read_all",
        "id": "",
        "procedure": "vehicles_get_sp",

    };

    $.ajax({
        method: "POST",
        url: "../apis/dynamic.php",
        data: data,
        dataType: "JSON",
        async: true,
        success: function(data) {
            var status = data.status;
            var message = data.message;
            var column = '';
            var row = '';

            if (status) {

                message.forEach(function(item, i) {

                    column = "<tr>";

                    for (index in item) {
                        column += "<th>" + index + "</th>";
                    }
                    column += "<th class='text-center'>" + 'Action' + "</th>"
                    column += "</tr>";



                    row += "<tr>";

                    for (index in item) {

                        row += "<td>" + item[index] + "</td>";
                    }

                    row += `<td class='text-center d-flex'> <a class='btn btn-sm mr-1  btn-primary' target='blank' title="Print"    href="print.php?vehicle_id=${item['ID']}">
                                <i class='fa fa-print mr-0'></i>
                            </a>
                            <a class='btn btn-sm mr-1 btn-warning' title="Edit" href="beec.php?vehicle_id=${item['ID']}">
                                <i class='fa fa-wrench mr-0'></i>
                            </a>

                            <button class='btn btn-sm btn-danger delete' title="Delete" vehicles_id='` + item['ID'] + `'>
                                <i class='fa fa-trash mr-0'></i>
                            </button>
                            </td>`;

                    row += "</tr>";

                });

                $("#table thead").html(column);
                $("#table tbody").html(row);
                $('#table').DataTable();
                // $("#table_paginate").addClass("pull-right");

            } else {
                $("#table tbody").html("<tr><td colspan='10' class='text-center'>" + message + "</td></tr>");
            }

        },
        error: function(data) {

        }
    });

}

function read_traffic(vehicles_id) {
    var data = {
        "action": "read_all",
        "id": vehicles_id,
        "procedure": "vehicles_get_sp",
    };

    $.ajax({
        method: "POST",
        url: "../apis/dynamic.php",
        data: data,
        dataType: "JSON",
        async: false,
        success: function(data) {
            var status = data.status;
            var message = data.message;

            if (status == true) {
                btn_action='update';
                message.forEach(function(item, i) {

                    var option = $(`#owners_list option[owner_id='${item['owner_id']}']`)
                    
                    if (option) {
                        $("#owner_id").val(option.attr("value"));
                        $("#owner_id").attr('owner_id', item['owner_id']);
                    }
                $('#SupplierSelect').val([Number(item['supplier_1']),Number(item['supplier_2'])]).trigger('change');

                $('#witness').val([Number(item['witness_1']),Number(item['witness_2'])]).trigger('change');

                    $("#beec_id").val(item['ID']);
                    $("#type").val(item['Type']);
                    $("#plate_no").val(item['Plate_no']);
                    $("#Chesis_No").val(item['Chassis_no']);
                    $("#Manufactured_Year").val(item['Model']);
                    $("#Color").val(item['Color']);
                    $("#Cylinder_No").val(item['Cylinder']);
                    $("#amount").val(item['Amount']);
                    $("#ref").val(item['Ref']);
                    $("#register").val(item['Registration_date']);
                    $("#date").val(item['Date']);
                });
            }

        },
        error: function(data) {

        }
    });

}


function delete_vehicle(vehicles_id) {

    $.ajax({
        method: "POST",
        url: "../apis/vehiclesAPI.php",
        data: { "action": "delete_vehicle", "vehicles_id": vehicles_id },
        dataType: "JSON",
        async: true,
        success: function(data) {
            var status = data.status;
            var message = data.message;

            if (status == true) {

                window.scroll(0, 0);
                traffic_get_SP();
                swal('Done!', 'Vehicle Has Been Deleted successfully', 'success');
            } else {

                window.scroll(0, 0);
                ModelPopup.modal('hide');
                swal('Error!', message, 'error');
            }

        },
        error: function(data) {

        }
    });

}

function fill_customer() {
    var data = {
        "action": "fill",
        "procedure": "fill_customers_sp",
    };

    $.ajax({
        method: "POST",
        url: "../apis/dynamic.php",
        data: data,
        dataType: "JSON",
        async: false,
        success: function(data) {
            var jsonObj = data.message;
            var status = data.status;
            var strHTML = '';
            var column = '';
            if (status == true) {
                $('#owners_list').html(strHTML);
                jsonObj.forEach(function(item, i) {

                    strHTML += '<option owner_id="' + item['id'] + '" value="' + item['name'] +'"> ';
                    strHTML += '</option>';

                });
                $('#owners_list').append(strHTML);

            } else {
                alert(jsonObj);
            }

        },
        error: function(data) {
            alert(data.Message);
        }
    });
}


function fill_suppliers() {
    var data = {
        "action": "fill",
        "procedure": "fill_owners_sp",
    };

    $.ajax({
        method: "POST",
        url: "../apis/dynamic.php",
        data: data,
        dataType: "JSON",
        async: false,
        success: function(data) {
            var jsonObj = data.message;
            var status = data.status;
            var strHTML = '';
            var column = '';
            if (status == true) {
                $('#SupplierSelect').html(strHTML);
                jsonObj.forEach(function(item, i) {
                    strHTML += '<option value="' + item['ID'] + '" >' + item['Name'];
                    strHTML += '</option>';
                });
                $('#SupplierSelect').html(strHTML);
                $("#SupplierSelect").select2({maximumSelectionLength:2});
            } else {
                alert(jsonObj);
            }

        },
        error: function(data) {
            alert(data.Message);
        }
    });
}

function fill_witness() {
    var data = {
        "action": "read_all",
        id:'',
        "procedure": "witness_get_sp",
    };

    $.ajax({
        method: "POST",
        url: "../apis/dynamic.php",
        data: data,
        dataType: "JSON",
        async: false,
        success: function(data) {
            var jsonObj = data.message;
            var status = data.status;
            var strHTML = '';
            var column = '';
            if (status == true) {
                $('#witness').html(strHTML);
                jsonObj.forEach(function(item, i) {
                    strHTML += '<option value="' + item['ID'] + '" >' + item['Name'];
                    strHTML += '</option>';
                });
                $('#witness').html(strHTML);
                $("#witness").select2({maximumSelectionLength:2});
            } else {
                alert(jsonObj);
            }

        },
        error: function(data) {
            alert(data.Message);
        }
    });
}
