document.addEventListener("DOMContentLoaded", function(event) {

document.querySelector(".search input").onkeyup = function(event) {
    if (event.keyCode === 13 && this.value.length > 0) {
        window.location.href = encodeURI("index.php?page=search&query=" + this.value);
    }
};


});


