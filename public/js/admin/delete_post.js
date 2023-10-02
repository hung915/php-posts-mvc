async function delete_post(){
    const list = document.getElementsByClassName('post-delete')[0];
    const post_id = list.id.split('-')[2];
    const response = await fetch(`http://localhost/admin/posts/${post_id}/`, {
        method: "DELETE",
        body: JSON.stringify({
            id: post_id,
        }),
        headers: {
            "Authorization": "Bearer " + localStorage.getItem("admin_access_token")
        }
    });

    if ((response.redirected === true) && response.url) {
        window.location.replace(response.url);
    }

    if (response.status === 200) {
        alert(`Successfully delete post with id ${post_id}!`)
        window.location.replace("http://localhost/admin/posts");
    }
}

(async() => {
    await delete_post()
})()
