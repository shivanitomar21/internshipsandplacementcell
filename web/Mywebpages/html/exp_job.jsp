<html>

<head>
    <%@ include file="header_student.jsp" %>
	    <link rel="stylesheet" type="text/css" href="..\css\student_resume_exp_job.css">
    <script src="../js/student.js"></script>
</head>

<body>

<script>
        document.getElementById('b05').style.backgroundColor='purple';
        document.getElementById('b05').style.color='white';
</script>    

<div id="jtotal">
<div class="jcontainer">
        <form action="exp_job_db.jsp">
<div class="jheader">Job Details<a href="student_resume_exp.jsp"><span class="jclose" style="font-weight:bold" title="close">&times;</span></a></div>

<div class="jdetails">
<label class="jlabel">Profile*:</label></br>
<input id="jpro" name="profile" type="text" placeholder="Ex: Web Developer" style="margin-top:5px;" required><hr></br>

<label class="jlabel">Organization*:</label></br>
<input id="jorg" name="organization" type="text" placeholder="XYZ" style="margin-top:5px;" required><hr></br>

<label class="jlabel">Location*:</label></br>
<input id="jloc" name="location" type="text" placeholder="Ex: Mumbai,India" style="margin-top:5px;" required><hr>

</br>
<div class="jlabel">
<div style="margin-bottom:-11px">
<label>Start Month*:</label></br></br>
</div>
<input type="month" name="sdate" style="width:40%;padding:3px"/>
</div>
<hr id="jh01"></br></br>

<div class="jendyr">
<div class="jlabel">
<label>End Month*:</label></br></br>
<input type="month" name="edate" style="width:40%;padding:3px;margin-top:-13px" />
</div>
<hr id="jh01">
</br>
<input class="jlabel" name="cwh" type="checkbox">Currently working here</input>
</div>

<button id="jsave" type="submit">SAVE</button>
</div>


</form>
</div>
</div>

</body>

</html>