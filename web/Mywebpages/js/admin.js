
function fun3()
{
	
    document.getElementById("mydropdowncarrer").classList.toggle("show");

}

function fun4()
{
	document.getElementById("mydropdownedit").classList.toggle("show");
}

window.onclick = function(event) {
  if (!event.target.matches('.dropbtnedit')) {

    var dropdowns = document.getElementsByClassName("dropdown-content-edit");
    var i;
    for (i = 0; i < dropdowns.length; i++) {
      var openDropdown = dropdowns[i];
      if (openDropdown.classList.contains('show')) {
        openDropdown.classList.remove('show');
      }
    }
  }
}

function fun5()
{
	document.getElementById("mydropdown").classList.toggle("show");
}

window.onclick = function(event) {
  if (!event.target.matches('.dropbtn')) {

    var dropdowns = document.getElementsByClassName("dropdown-content");
    var i;
    for (i = 0; i < dropdowns.length; i++) {
      var openDropdown = dropdowns[i];
      if (openDropdown.classList.contains('show')) {
        openDropdown.classList.remove('show');
      }
    }
  }
}


function fun2()
{
    document.getElementById('dcc').style.display="block";
}

function kfun1()
{
document.getElementById('kd01').style.display='block';
document.getElementById('kd02').style.display='none';
document.getElementById('kd03').style.display='none';
}
function kfun2()
{
document.getElementById('kd01').style.display='none';
document.getElementById('kd02').style.display='block';
document.getElementById('kd03').style.display='none';
}
function kfun3()
{
document.getElementById('kd01').style.display='none';
document.getElementById('kd02').style.display='none';
document.getElementById('kd03').style.display='block';

}
function kfun11(id)
{
var check=document.getElementById(id);
if(check.checked==true)
{
document.getElementById('kdb01').style.display="block";
document.getElementById('kdb01').innerHTML=check.value;
}
else
{
document.getElementById('kdb01').style.display="none";
}

} 
