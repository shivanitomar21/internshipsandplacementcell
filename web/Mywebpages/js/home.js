function login()
{
    document.getElementById('dlogin').style.display='block';
}
function slogin(){
	    document.getElementById('dlogin').style.display='none';
	    document.getElementById("abc").style.display="block";
        document.getElementById('total').style.opacity="0.1";
            document.body.style.backgroundColor = "rgba(0,0,0,0.5)";
		document.getElementById('ncolumn1').style.display='none';
	    document.getElementById('ncolumn2').style.display='none';
		document.getElementById('ncolumn3').style.display='none';
		document.getElementById('ncolumn4').style.display='none';
		document.getElementById('ncolumn5').style.display='none';
		document.getElementById('ncolumn6').style.display='none';
	    document.getElementById('alumni').style.display='none';
}
function closelog()
{
document.getElementById("abc").style.display="none";
document.getElementById('total').style.opacity="1.0";
            document.body.style.backgroundColor = "white";
}

function fas()
{
        document.getElementById('alumni').style.display='block';
	document.getElementById('objective').style.display='none';	
	document.getElementById('contact').style.display='none';	
	document.getElementById('about').style.display='none';
//document.body.style.backgroundImage="url('b3.jpg')";	
}
function ffaq()
{
	document.getElementById('alumni').style.display='none';
}


function more1()
{
	document.getElementById('total').style.opacity="0.1";
	document.getElementById('ncolumn1').style.display='block';
        document.getElementsByClassName('column').style.display='none';
}
function more2()
{
	document.getElementById('total').style.opacity="0.1";
	document.getElementById('alumni').style.opacity='0.1';
	//document.body.style.backgroundImage="none";
	document.getElementById('ncolumn2').style.display='block';
}
function more3()
{
	document.getElementById('total').style.opacity="0.1";
	document.getElementById('alumni').style.opacity='0.1';
	//document.body.style.backgroundImage="none";
	document.getElementById('ncolumn3').style.display='block';
}
function more4()
{
	document.getElementById('total').style.opacity="0.1";
	document.getElementById('alumni').style.opacity='0.1';
	//document.body.style.backgroundImage="none";
	document.getElementById('ncolumn4').style.display='block';
}
function more5()
{
	document.getElementById('total').style.opacity="0.1";
	document.getElementById('alumni').style.opacity='0.1';
	//document.body.style.backgroundImage="none";
	document.getElementById('ncolumn5').style.display='block';
}
function more6()
{
	document.getElementById('total').style.opacity="0.1";
	document.getElementById('alumni').style.opacity='0.1';
	//document.body.style.backgroundImage="none";
	document.getElementById('ncolumn6').style.display='block';
}
function nclose()
{
    document.getElementById('total').style.opacity="1.0";
		document.getElementById('ncolumn1').style.display='none';
	    document.getElementById('ncolumn2').style.display='none';
		document.getElementById('ncolumn3').style.display='none';
		document.getElementById('ncolumn4').style.display='none';
		document.getElementById('ncolumn5').style.display='none';
		document.getElementById('ncolumn6').style.display='none';
		
	    document.getElementById('total').style.opacity="1.0";
	    document.getElementById('alumni').style.opacity='1.0';
}
