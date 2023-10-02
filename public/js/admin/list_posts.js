async function listPost(){
    const list = document.getElementById("posts");
    const queryString = window.location.search;
    const urlParams = new URLSearchParams(queryString);
    const limit = urlParams.get('limit') !== null ? urlParams.get('limit') : 5;
    const page = urlParams.get('page') !== null ? urlParams.get('page') : 1;
    const response = await fetch(`http://localhost/admin/posts/?limit=${limit}&page=${page}`, {
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
        for (const post of obj) {
            let div_id = document.createElement('div');
            let div_thumb = document.createElement('div');
            let thumb = document.createElement('img');
            let title = document.createElement('div');
            let status = document.createElement('div');
            let div_action = document.createElement('div');
            let view = document.createElement('a');
            let textNode = document.createTextNode(" | ");
            let edit = document.createElement('a');
            let del = document.createElement('a');

            div_id.innerHTML =post.id;
            thumb.src = post.thumbnail;
            title.innerHTML = post.title;
            status.innerHTML = post.status;

            thumb.classList.add('thumb-img');

            view.classList.add("postLink");
            view.textContent = "Show";
            view.href = `http://localhost/admin/posts/${post.id}`;

            edit.classList.add("postLink");
            edit.textContent = "Edit";
            edit.href = `http://localhost/admin/posts/${post.id}/edit`;

            del.classList.add("postLink");
            del.textContent = "Delete";
            del.href = `http://localhost/admin/posts/${post.id}/delete`;

            div_action.classList.add("actions")

            div_thumb.appendChild(thumb);
            list.appendChild(div_id);
            list.appendChild(div_thumb);
            list.appendChild(title);
            list.appendChild(status);
            div_action.appendChild(view);
            div_action.appendChild(textNode);
            div_action.appendChild(edit);
            div_action.appendChild(textNode.cloneNode(true));
            div_action.appendChild(del);
            list.appendChild(div_action);
        }
    } else {
        alert(obj.message);
    }
}

(async() => {
    await listPost()
})()
