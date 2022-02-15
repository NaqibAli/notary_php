taargo_get();
fill_customer();
var btn_action = "insert";
var ModelPopup = $('#model');

$("#table").on("click", "button.delete", function() {
    var taargo_id = $(this).attr("taargo_id");
    if (confirm("Are You sure To Delete This:  " + " " + taargo_id + " ?")) {
        delete_taargo(taargo_id);
    } else {
        alert("Failed to Delete This ID" + " " + taargo_id)
    }



});

$("#table").on("click", "button.edit", function() {
    var taargo_id = $(this).attr("taargo_id");
    btn_action = "update";
    read_taargo(taargo_id);
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
        return;
    }
});

$("#form").on("submit", function(e) {
    e.preventDefault();

    var form_data = new FormData($("#form")[0]);
    
    var owner_id = $("#owner_id").attr('owner_id');
    form_data.append('owner_id', owner_id);


    var file_data = $('#photo').prop('files')[0];

    form_data.append('Photo', file_data);

    if (btn_action == "insert") {
        form_data.append('action', 'insert_taargo');
    } else {
        form_data.append('action', 'Update_taargo');
    }





    $.ajax({
        method: "POST",
        url: "../apis/taargo.php",
        dataType: 'json',
        cache: false,
        contentType: false,
        processData: false,
        data: form_data,
        success: function(data) {
            var status = data.status;
            var message = data.message;

            if (status == true) {

                ModelPopup.modal("hide");
                btn_action = "insert";
                window.scroll(0, 0);
                $("#form")[0].reset();
                taargo_get();
                swal({
                    title: "Good job!",
                    text: message,
                    icon: "success",
                    button: "Saved!",
                });

            } else {
                swal('Error!', message, 'error');
                show_toast('error', message)
                window.scroll(0, 0);


            }
        },
        error: function(data) {

        }
    });

});


function taargo_get() {

    $("#table tbody").html("");
    var data = {
        "action": "read_all",
        "id": "",
        "procedure": "taago_get_sp",

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
                $('#table').dataTable().fnClearTable();
                $('#table').dataTable().fnDestroy();

                message.forEach(function(item, i) {

                    column = "<tr>";

                    for (index in item) {
                        column += "<th>" + index + "</th>";
                    }
                    column += "<th class='text-center'>" + 'Action' + "</th>"
                    column += "</tr>";



                    row += "<tr>";

                    for (index in item) {
                        if (index == 'Photo') {
                            if (item['photo'] == '') {
                                row += `<td>` + item[index] + `</td>`;

                            } else {
                                row += `<td> <img alt="Responsive image" class="img-thumbnail wd-0p wd-sm-0" src="../images/` + item[index] + `"></td>`;

                            }
                        } else
                            row += "<td>" + item[index] + "</td>";
                    }

                    row += `<td class='text-center'>                         <button class='btn  btn-primary edit' title="Edit" taargo_id='` + item['ID'] + `'>
                    <i class='fa fa-wrench'></i>

                   
                </button>
                <button class='btn  btn-danger delete' title="Delete" taargo_id='` + item['ID'] + `'>
                    <i class='fa fa-trash'></i>
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

function read_taargo(taargo_id) {
    
    var data = {
        "action": "read_all",
        "id": taargo_id,
        "procedure": "taago_get_sp",
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



                message.forEach(function(item, i) {


                    var option = $('#owners_list option[owner_id="' + item['Name'] + '"]');
                    $("#owner_id").val(option.attr('value'));
                    var val = option.attr('owner_id');
                    $("#owner_id").attr('owner_id', val);

                    $("#taargo_id").val(item['ID']);
                    $("#Phone").val(item['Phone']);
                    $("#date").val(item['Date']);
                    $("#imgName").val(item['photo']);



                    ModelPopup.modal('show');


                });


            }

        },
        error: function(data) {

        }
    });

}


function delete_taargo(taargo_id) {

    $.ajax({
        method: "POST",
        url: "../apis/taargo.php",
        data: { "action": "delete_taargo", "taargo_id": taargo_id },
        dataType: "JSON",
        async: true,
        success: function(data) {
            var status = data.status;
            var message = data.message;

            if (status == true) {

                window.scroll(0, 0);
                taargo_get();
                swal('Done!', message, 'success');
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

                    strHTML += '<option owner_id="' + item['id'] + '" value="' + item['id'] + ' - ' + item['name'] +'"> ';
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