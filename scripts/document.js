owners_get();
var btn_action = "insert";
var ModelPopup = $('#model');

let showModalBtn = $("#btn_modle");

showModalBtn.on("click", function() {
    $("#form")[0].reset();
    $("#model").modal('show');
});


$("#table").on("click", "button.delete", function() {
    var custo_id = $(this).attr("custo_id");
    if (confirm("Are You sure To Delete This:  " + " " + custo_id + " ?")) {
        delete_owner(custo_id);
    } else {
        alert("Failed to Delete This ID" + " " + custo_id)
    }



});

$("#table").on("click", "button.edit", function() {
    var custo_id = $(this).attr("custo_id");
    btn_action = "update";
    read_owners(custo_id);
    window.scroll(0, 0);
});



$("#form").on("submit", function(e) {
    e.preventDefault();

    var form_data = new FormData($("#form")[0]);



    // var file_data = $('#photo').prop('files')[0];

    // form_data.append('photo', file_data);



    if (btn_action == "insert") {
        form_data.append('action', 'insert');
    } else {
        form_data.append('action', 'update');
    }





    $.ajax({
        method: "POST",
        url: "../apis/document.php",
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
                owners_get();
                swal({
                    title: "DONE!",
                    text: message,
                    icon: "success",
                    button: "OK!",
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


function owners_get() {

    var data = {
        "action": "read_all",
        "id": "",
        "procedure": "document_get_sp",

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
                        if (index == 'photo') {
                            if (item['photo'] == '') {
                                row += `<td>` + item[index] + `</td>`;

                            } else {
                                row += `<td> <img alt="Responsive image" class="img-thumbnail wd-40p wd-sm-50" src="../uploads/` + item[index] + `"></td>`;

                            }
                        } else
                            row += "<td>" + item[index] + "</td>";
                    }

                    row += `<td class='text-center'>                         <button class='btn  btn-sm edit' title="Edit" custo_id='` + item['ID'] + `'>
                                <i class='fa fa-wrench'></i>

                               
                            </button>
                            <button class='btn  btn-sm delete' title="Delete" custo_id='` + item['ID'] + `'>
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

function read_owners(custo_id) {
    var data = {
        "action": "read_all",
        "id": custo_id,
        "procedure": "document_get_sp",
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


                    $("#custo_id").val(item['ID']);
                    $("#name").val(item['Name']);
                    $("#Vehicle").val(item['Vehicle']);
                    $("#Chassis").val(item['Chassis']);
                    $("#Plate").val(item['Plate']);
                    $("#Phone").val(item['Phone']);
                    $("#details").val(item['Details']);
                    $("#Ref").val(item['Ref']);
                    $("#register").val(item['Date']);

                    ModelPopup.modal('show');


                });


            }

        },
        error: function(data) {

        }
    });

}


function delete_owner(custo_id) {

    $.ajax({
        method: "POST",
        url: "../apis/document.php",
        data: { "action": "delete_document", "custo_id": custo_id },
        dataType: "JSON",
        async: true,
        success: function(data) {
            var status = data.status;
            var message = data.message;

            if (status == true) {

                window.scroll(0, 0);
                owners_get();
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