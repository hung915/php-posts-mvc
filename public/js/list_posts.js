async function listPost(){
    const list = document.getElementById("posts");
    const response = await fetch("http://localhost/posts/", {
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
        for (const post of obj) {
            let div_id = document.createElement('div');
            let id = document.createElement('a');
            let div_thumb = document.createElement('div');
            let thumb = document.createElement('img');
            let title = document.createElement('div');

            thumb.src = post.thumbnail;
            title.innerHTML = post.title;

            id.classList.add("postLink");
            id.textContent = post.id;
            id.href = `http://localhost/posts/${post.id}`;

            div_id.appendChild(id);
            list.appendChild(div_id);

            thumb.classList.add("thumb-img");
            div_thumb.appendChild(thumb);
            list.appendChild(div_thumb);

            list.appendChild(title);
        }
    } else {
        alert(obj.message);
    }
}

(async() => {
    await listPost()
})()
