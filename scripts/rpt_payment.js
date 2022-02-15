$(document).ready(function() {
    $("#frm_rpt_vehicles").on("submit", function(e) {
        e.preventDefault();
        // $('#tbl_rpt_company tr').remove();
        var date_type = $("#date_type").val();
        var from = $("#from").val();
        var to = $("#to").val();
        // var status = $('#status').val();
        if (date_type == "All") {
            from = "";
            to = "";
        }
        var post = {
            action: "payment_rpt",
            from: from,
            to: to,
            // "status": status
        };
        $.ajax({
            url: "../apis/rpt_payments.php",
            method: "POST",
            data: post,
            dataType: "JSON",
            async: true,
            success: function(data) {
                var status = data.status;
                var message = data.message;
                var row = "";
                let total_nets = 0.0;
                if (status == true) {
                    message.forEach(function(item, i) {
                        total_nets += parseFloat(message[i]["net_payment"]);

                        row += `<tr>`;
                        for (p in item) {
                            row += "<td>" + item[p] + "</td>";
                        }
                        row += `</tr>`;
                    });

                    row += `<tr>`;
                    row +=
                        '<td colspan="100%" style="background-color: cornsilk; 100%; font-weight: 600; text-align: center;">' +
                        "Total Payment Is " +
                        total_nets +
                        "</td>";
                    row += `</tr>`;

                    $("#tbl_rpt_vehicle tbody").html(row);
                    $("#tbl_rpt_vehicle").DataTable();
                } else {
                    row += `<tr>`;
                    row +=
                        '<td colspan="100%" style="background-color: cornsilk; 100%; font-weight: 600; text-align: center;">' +
                        message +
                        "</td>";
                    row += `</tr>`;

                    $("#tbl_rpt_vehicle tbody").html(row);
                    $("#tbl_rpt_vehicle").DataTable();
                }
            },
            error: function(data) {
                alert(data.message);
            },
        });
    });
    $("#print").on("click", function(e) {
        e.preventDefault();
        print();
    });

    function print() {
        newwin = window.open("report");
        var print_area = $("#report_area").html();
        newwin.document.write("<html><head><title></title>");
        newwin.document.write("</head><body>");
        newwin.document.write(print_area);
        newwin.document.write("</body></html>");
        newwin.print();
        newwin.close();
        window.location = "rpt_payment.php";
    }
    $("#Excell").on("click", function() {
        $("#tbl_rpt_vehicle").table2excel({
            exclude: ".noExl",
            name: "Excel Document Name",
            filename: "Payments Reports" +
                new Date().toISOString().replace(/[\-\:\.]/g, "") +
                ".xls",
            fileext: ".xls",
            exclude_img: true,
        });
    });

    $("#date_type").on("change", function() {
        var value = $(this).val();
        if (value == "custom") {
            $("#from").removeAttr("disabled");
            $("#to").removeAttr("disabled");
        } else {
            $("#from").attr("disabled", "disabled");
            $("#to").attr("disabled", "disabled");
        }
    });
});