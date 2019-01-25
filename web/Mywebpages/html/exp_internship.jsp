<html>

<head>
    <%@ include file="header_student.jsp" %>
	    <link rel="stylesheet" type="text/css" href="..\css\student_resume_exp_internship.css">
    <script src="../js/student.js"></script>
</head>

</body>

<script>
        document.getElementById('b05').style.backgroundColor='purple';
        document.getElementById('b05').style.color='white';
</script>

<div id="intotal">
<div class="incontainer">
    <form action="exp_internship_db.jsp">
<div class="inheader">Internship Details<a href="student_resume_exp.jsp"><span class="inclose" style="font-weight:bold" title="close">&times;</span></a></div>

<div class="indetails">
<label class="inlabel">Profile*:</label></br>
<input id="inpro" name="profile" type="text" placeholder="Ex: Web Developer" style="margin-top:5px;" required><hr></br>

<label class="inlabel">Organization*:</label></br>
<input id="inorg" name="organization" type="text" placeholder="XYZ" style="margin-top:5px;" required><hr></br>

<label class="inlabel">Location*:</label></br>
<div>
<input id="inloc" name="location" type="text" placeholder="Ex: Mumbai,India" style="margin-top:5px;" required><hr>
<input type="checkbox" name="wfh">Is work from home</input>
</div>
</br>
<div class="inlabel">
<div style="margin-bottom:-10px">
<label>Start Month*:</label></br></br>
</div>
<input type="month" name="smonth" style="width:40%;padding:3px"/>
</div>
<hr id="inh01"></br></br>


<div class="inendyr">
<div class="inlabel">
<label>End Month*:</label></br></br>
<input type="month" name="emonth" style="width:40%;padding:3px;margin-top:-12px">
</div>
<hr id="inh01">
</br>
</div>


<button id="insave" type="submit">SAVE</button>
</div>


 </form>

</div>

</div>

</body>

</html>