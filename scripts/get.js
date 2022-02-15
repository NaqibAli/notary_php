traffic_get_SP();
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

                    row += `<td class='text-center'>                         <button class='btn  btn-primary edit' title="Edit" vehicles_id='` + item['ID'] + `'>
                                <i class='fa fa-wrench'></i>

                               
                            </button>
                            <button class='btn  btn-danger delete' title="Delete" vehicles_id='` + item['ID'] + `'>
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