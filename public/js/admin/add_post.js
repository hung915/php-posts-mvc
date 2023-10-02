$(document).ready(function (e) {
    $('#add-post').validate({
        rules: {
            title: {
                required: true,
            },
            description: {
                required: true,
            }
        },
    })

    $("#add-post").on('submit', (function(e) {
        e.preventDefault();

        $(this).validate();

        if ($(this).valid()) {
            $.ajax({
                url: "http://localhost/admin/posts/",
                type: "POST",
                data:  new FormData(this),
                contentType: false,
                cache: false,
                processData:false,
                beforeSend : function(request)
                {
                    request.setRequestHeader("Authorization", "Bearer " + localStorage.getItem("admin_access_token"));
                    $("#err").fadeOut();
                },
                success: function(response)
                {
                    alert("Successfully add a new post!")
                    window.location.replace("http://localhost/admin/posts");
                },
                error: function(e)
                {
                    $("#err").html(e).fadeIn();
                }
            });
        }
    }));
});