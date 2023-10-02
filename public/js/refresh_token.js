
async function refresh_token(){
    const response = await fetch("http://localhost/refresh-token/new", {
        method: "POST",
        body: JSON.stringify({
            token: localStorage.getItem("refresh_token"),
        }),
    });
    const location = document.getElementsByClassName('location')[0];
    if ((response.status === 400) || (response.status === 401)) {
        window.location.replace("http://localhost/login");
    }

    const json = await response.text();
    const obj = JSON.parse(json);

    if (response.status === 200) {
        console.log("Got new access token and refresh token");

        localStorage.setItem("access_token", obj.access_token);
        localStorage.setItem("refresh_token", obj.refresh_token);
        window.location.replace(location.id);
    }
}

(async() => {
    await refresh_token()
})()