async function getPostDetailForEdit(){
    const list = document.getElementsByClassName('post-edit')[0];
    const post_id = list.id.split('-')[2];
    const response = await fetch(`http://localhost/admin/posts/${post_id}/`, {
        headers: {
            "Authorization": "Bearer " + localStorage.getItem("admin_access_token")
        }
    });

    if ((response.redirected === true) && response.url) {
        window.location.replace(response.url);
    }

    const json = await response.text();
    const obj = JSON.parse(json);
    if (response.status === 200) {
        // let id = document.getElementById('post_id');
        let thumb = document.getElementById('uploaded-image');
        let title = document.getElementById('title');
        let description = document.getElementById('description');
        let status = document.getElementById('status');

        // id.value = obj.id;
        thumb.src = obj.thumbnail;
        title.value = obj.title;
        description.value = obj.description;
        status.value = obj.status === 'Enabled' ? "1" : "0";

    } else {
        alert(obj.message);
    }
}

(async() => {
    await getPostDetailForEdit()
})()