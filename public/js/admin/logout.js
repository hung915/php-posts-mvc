async function logout(){
    const list = document.getElementById("posts");
    const response = await fetch("http://localhost/admin/logout/new", {
        method: "POST",
        body: JSON.stringify({
            token: localStorage.getItem("admin_refresh_token"),
        }),
    });

    localStorage.removeItem("admin_access_token");
    localStorage.removeItem("admin_refresh_token");

    window.location.replace("http://localhost/admin");
}

(async() => {
    await logout()
})()
