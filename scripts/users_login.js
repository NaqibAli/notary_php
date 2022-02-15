$(document).ready(function() {
    $("#frm_login").on("submit", function(e) {
        e.preventDefault();
        var user_name = $("#user_name").val();
        var password = $("#password").val();
        var data = {
            "action": "login",
            "user_name": user_name,
            "password": password

        };
        $.ajax({
            method: "POST",
            url: "../apis/usersAPI.php",
            data: data,
            dataTyppe: "JSON",
            async: true,
            success: function(data) {
                var status = data.status;
                var message = data.message;
                if (status) {
                    if (message == "blocked") {
                        swal({
                            title: "Sorry!",
                            text: "You are a blocked user, please contact the admin",
                            icon: "error",
                            button: "Aww No!",
                        });
                    } else {
                        window.location.replace("index.php");
                    }

                } else {
                    swal({
                        title: "Sorry!",
                        text: message,
                        icon: "error",
                        button: "Aww No!",
                    });
                    // alert(message);

                }

            },
            error: function(data) {

            }

        });

    });
});