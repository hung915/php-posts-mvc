$(document).ready(function (e) {
    $('#edit-post').validate({
        rules: {
            title: {
                required: true,
            },
            description: {
                required: true,
            }
        }
    })

    $("#edit-post").on('submit', (function(e) {
        const list = document.getElementsByClassName('post-edit')[0];
        const post_id = list.id.split('-')[2];
        e.preventDefault();
        $(this).validate();
        if ($(this).valid()) {
            $.ajax({
                url: `http://localhost/admin/posts/${post_id}/`,
                type: "POST",
                data: new FormData(this),
                contentType: false,
                cache: false,
                processData: false,
                beforeSend: function (request) {
                    request.setRequestHeader("Authorization", "Bearer " + localStorage.getItem("admin_access_token"));
                    $("#err").fadeOut();
                },
                success: function (response) {
                    alert("Successfully edit post!")
                    window.location.replace("http://localhost/admin/posts");
                },
                error: function (e) {
                    $("#err").html(e).fadeIn();
                }
            });
        }
    }));
});
