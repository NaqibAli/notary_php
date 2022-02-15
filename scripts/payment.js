get_income();
var btn_action = "insert";
var ModelPopup = $('#model');

let showModalBtn = $("#btn_modle");

showModalBtn.on("click", function() {
    $("#form")[0].reset();
    $("#model").modal('show');
});

$("#table").on("click", "button.delete", function() {
    var id = $(this).attr("id");
    if (confirm("Are You sure To Delete This:  " + " " + id + " ?")) {
        delete_income(id);
    } else {
        alert("Failed to Delete This ID" + " " + id)
    }



});

$("#table").on("click", "button.edit", function() {
    var id = $(this).attr("id");
    btn_action = "update";
    read_income(id);
    window.scroll(0, 0);
});




$("#form").on("submit", function(e) {
    e.preventDefault();

    var form_data = new FormData($("#form")[0]);


    if (btn_action == "insert") {
        form_data.append('action', 'Insert');
    } else {
        form_data.append('action', 'Update');
    }





    $.ajax({
        method: "POST",
        url: "../apis/payments.php",
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
                get_income();
                swal({
                    title: "Done!",
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


function get_income() {

    var data = {
        "action": "read_all",
        "id": "",
        "procedure": "income_get",

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

                        row += "<td>" + item[index] + "</td>";
                    }

                    row += `<td class='text-center'>                         <button class='btn  btn-sm edit' title="Edit" id='` + item['ID'] + `'>
                                <i class='fa fa-wrench'></i>

                               
                            </button>
                            <button class='btn  btn-sm delete' title="Delete" id='` + item['ID'] + `'>
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

function read_income(id) {
    var data = {
        "action": "read_all",
        "id": id,
        "procedure": "income_get",
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

                    $("#id").val(item['ID']);
                    $("#name").val(item['Name']);
                    $("#tell").val(item['Phone']);
                    $("#desc").val(item['Description']);
                    $("#plate").val(item['Plate']);
                    $("#Amount").val(item['Amount']);
                    $("#date").val(item['Date']);


                    ModelPopup.modal('show');


                });


            }

        },
        error: function(data) {

        }
    });

}


function delete_income(id) {

    $.ajax({
        method: "POST",
        url: "../apis/payments.php",
        data: { "action": "delete", "id": id },
        dataType: "JSON",
        async: true,
        success: function(data) {
            var status = data.status;
            var message = data.message;

            if (status == true) {

                window.scroll(0, 0);
                get_income();
                swal('DONE!', 'Deleted Successfully', 'success');
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