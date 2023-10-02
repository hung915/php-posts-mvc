const loginForm = document.forms[0];

loginForm.addEventListener('submit', async (e) => {

    e.preventDefault();

    const response = await fetch('http://localhost/admin/login/new', {
        method: 'POST',
        body: JSON.stringify({
            email: loginForm.email.value,
            password: loginForm.password.value
        })
    });
    console.log(response);
    const json = await response.text();
    const obj = JSON.parse(json);

    if (response.status === 200) {

        localStorage.setItem("admin_access_token", obj.access_token);
        localStorage.setItem("admin_refresh_token", obj.refresh_token);

        window.location.replace("http://localhost/admin");

    } else {
        alert(obj.message);
    }
});