async function checkAllow() {
    const response = await fetch("http://localhost/admin/posts/allow-access", {
        headers: {
            "Authorization": "Bearer " + localStorage.getItem("admin_access_token")
        }
    });
    if (response.status === 200) {
        const allow_show = document.getElementById('check-allow');
        allow_show.style.display = "block";
    } else if (response.status === 401) {
        const json = await response.text();
        const obj = JSON.parse(json);
        if (obj.message === 'token has expired') {
            const response = await fetch("http://localhost/admin/refresh-token/new", {
                method: "POST",
                body: JSON.stringify({
                    token: localStorage.getItem("admin_refresh_token"),
                }),
            });
            const json = await response.text();
            const obj = JSON.parse(json);

            if (response.status === 200) {
                console.log("Got new access token and refresh token");

                localStorage.setItem("admin_access_token", obj.access_token);
                localStorage.setItem("admin_refresh_token", obj.refresh_token);
                await (async () => {
                    await checkAllow()
                })()
            }
        }
    } else {
        window.location.replace("http://localhost/admin");
    }
}

(async() => {
    await checkAllow()
})()

