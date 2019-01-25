// Get the modal
var modal = document.getElementById('maindiv');

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
    if (event.target == modal) {
        modal.style.display = "none";
    }
}
function closelog()
{
document.getElementById("maindiv").style.display="none";
document.getElementsByClassName('total').style.opacity="1.0";
}
function masterfun()
{
	document.getElementsByClassName("total").style.opacity="0.5";
}