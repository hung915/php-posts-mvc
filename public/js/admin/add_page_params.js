async function addPageParams(){
    const queryString = window.location.search;
    const urlParams = new URLSearchParams(queryString);
    const limit_value = urlParams.get('limit') !== null ? urlParams.get('limit') : 5;
    const current_page = urlParams.get('page') !== null ? urlParams.get('page') : 1;
    const response = await fetch("http://localhost/admin/posts/count", {
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
        const total = obj['total'];
        const pages = Math.ceil(total / limit_value);
        console.log(pages);

        let pagination_div = document.getElementById('pagination');
        let page_number_div = document.createElement('div');
        page_number_div.classList.add('page-numbers')

        let url = window.location.href.split("?")[0];

        for (let page = 1; page <= pages; page++) {
            let a = document.createElement('a');
            a.textContent = String(page);
            a.href = url + `?limit=${limit_value}&page=${page}`;

            if (page == current_page) {
                a.classList.add('active')
            }

            page_number_div.appendChild(a);
        }

        pagination_div.appendChild(page_number_div);
    } else {
        alert(obj.message);
    }
}

(async() => {
    await addPageParams()
})()
