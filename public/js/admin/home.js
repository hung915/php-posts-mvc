async function viewHome(){
    const response = await fetch("http://localhost/admin/home/view", {
        headers: {
            "Authorization": "Bearer " + localStorage.getItem("admin_access_token")
        }
    });

    if ((response.redirected === true) && response.url) {
        window.location.replace(response.url);
    }

    const loginForm = document.forms[0];
    const button_show = document.getElementById("button-show");

    if (response.status === 400) {
        loginForm.style.display = "block";
    }
    const json = await response.text();
    const obj = JSON.parse(json);

    if (response.status === 200) {
        if (obj.message === 'Logged in') {
            button_show.style.display = "block";
            loginForm.style.display = "none";
        } else {
            alert(obj.message);
        }
    }
}

(async() => {
    await viewHome()
})()
