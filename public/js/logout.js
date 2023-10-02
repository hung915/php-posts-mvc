async function logout(){
    const list = document.getElementById("posts");
    const response = await fetch("http://localhost/logout/new", {
        method: "POST",
        body: JSON.stringify({
            token: localStorage.getItem("refresh_token"),
        }),
    });

    localStorage.removeItem("access_token");
    localStorage.removeItem("refresh_token");

    window.location.replace("http://localhost");
}

(async() => {
    await logout()
})()
