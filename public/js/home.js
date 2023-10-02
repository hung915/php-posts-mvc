async function viewHome(){
    const response = await fetch("http://localhost/home/view", {
        headers: {
            "Authorization": "Bearer " + localStorage.getItem("access_token")
        }
    });

    if ((response.redirected === true) && response.url) {
        window.location.replace(response.url);
    }

    const link = document.getElementById("login-reg-link");
    const button_show = document.getElementById("button-show");

    if (response.status === 400) {
        link.style.display = "block";
    }
    const json = await response.text();
    const obj = JSON.parse(json);

    if ((response.status === 200) && (obj.message === 'Logged in')) {
        button_show.style.display = "block";
    } else {
        alert(obj.message);
    }
}

(async() => {
    await viewHome()
})()
