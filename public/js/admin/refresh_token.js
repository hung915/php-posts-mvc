
async function refresh_token(){
    const response = await fetch("http://localhost/admin/refresh-token/new", {
        method: "POST",
        body: JSON.stringify({
            token: localStorage.getItem("admin_refresh_token"),
        }),
    });
    const location = document.getElementsByClassName('location')[0]

    const json = await response.text();
    const obj = JSON.parse(json);

    if (response.status === 200) {
        console.log("Got new access token and refresh token");

        localStorage.setItem("admin_access_token", obj.access_token);
        localStorage.setItem("admin_refresh_token", obj.refresh_token);
        window.location.replace(location.id);
    }
}

(async() => {
    await refresh_token()
})()