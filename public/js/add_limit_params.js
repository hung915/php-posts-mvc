$(document).ready(function(){
    $("#limit-records").change(function(){
        let optionValue = $(this).val();
        let url = window.location.href.split("?")[0];
        window.location = url + "?limit=" + optionValue;
    })
})

const queryString = window.location.search;
const urlParams = new URLSearchParams(queryString);
const limit_value = urlParams.get('limit');
if (limit_value !== null) {
    let limit_element = document.getElementById('limit-records');
    limit_element.value = limit_value;
}