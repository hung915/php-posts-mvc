async function getPostDetail(){
    const list = document.getElementsByClassName('post-detail')[0];
    const post_id = list.id.split('-')[2];
    const response = await fetch(`http://localhost/posts/${post_id}/`, {
        headers: {
            "Authorization": "Bearer " + localStorage.getItem("access_token")
        }
    });

    if ((response.redirected === true) && response.url) {
        window.location.replace(response.url);
    }

    const json = await response.text();
    const obj = JSON.parse(json);

    if (response.status === 200) {
        let title = document.createElement('h1');
        let post_info = document.createElement('div');
        let thumb = document.createElement('img');
        let description = document.createElement('div');
        title.innerHTML = obj.title;
        thumb.src = obj.thumbnail;
        description.innerHTML = obj.description;

        post_info.classList.add('post-info');
        thumb.classList.add('thumb-img');


        list.appendChild(title);
        post_info.appendChild(thumb);
        post_info.appendChild(description);
        list.appendChild(post_info);

    } else {
        alert(obj.message);
    }
}

(async() => {
    await getPostDetail()
})()
