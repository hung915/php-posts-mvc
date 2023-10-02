const loginForm = document.forms[0];
// const logoutButton = document.getElementById("logout");
// const viewPostButton = document.getElementById("viewPost");

loginForm.addEventListener('submit', async (e) => {

    e.preventDefault();

    const response = await fetch('http://localhost/login/new', {
        method: 'POST',
        body: JSON.stringify({
            email: loginForm.email.value,
            password: loginForm.password.value
        })
    });

    const json = await response.text();
    const obj = JSON.parse(json);

    if (response.status === 200) {

        localStorage.setItem("access_token", obj.access_token);
        localStorage.setItem("refresh_token", obj.refresh_token);

        window.location.replace("http://localhost");
        // loginForm.style.display = "none";
        // logoutButton.style.display = "block";
        // viewPostButton.style.display = "block";
    } else {
        alert(obj.message);
    }
});