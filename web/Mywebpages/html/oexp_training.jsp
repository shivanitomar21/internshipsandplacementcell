<html>
<head>
    <%@ include file="header_student.jsp" %>
	    <link rel="stylesheet" type="text/css" href="..\css\student_resume_oexp.css">
	    <link rel="stylesheet" type="text/css" href="..\css\student_resume_oexp_training.css">
    <script src="../js/student.js"></script>
</head>

<body>

<script>
        document.getElementById('b05').style.backgroundColor='purple';
        document.getElementById('b05').style.color='white';
</script> 
    
    
<div id="ttotal">
<div class="tcontainer">
    <form action="oexp_training_db.jsp">
<div class="theader">Training Details<a href="student_resume_oexp.jsp"><span class="tclose" title="close">&times;</span></div></a>

<div class="tdetails">
<label class="tlabel">Training Program*:</label></br>
<input id="tpro" name="program" type="text" placeholder="Ex: Analytics" style="margin-top:5px;" required><hr></br>

<label class="tlabel">Organization*:</label></br>
<input id="torg" name="organization" type="text" placeholder="XYZ" style="margin-top:5px;" required><hr></br>

<div>
<label class="tlabel">Location*:</label></br>
<input id="tloc" name="location" type="text" placeholder="Ex: Mumbai,India" style="margin-top:5px;" required><hr>
<input type="checkbox" name="online" class="tlabel">Online</input>
</div>

</br>

<div>
<div class="tlabel">
<div style="margin-bottom:-11px">
<label>Start Month*:</label></br></br>
</div>
<input type="month" name="sdate" style="width:40%;padding:3px;" />
</div>
<hr id="th01"></br></br>


<div class="tendyr">
<div class="tlabel">
<label>End Month*:</label></br></br>
<input type="month" name="edate" style="width:40%;padding:3px;margin-top:-12px" />
</div>
<hr id="th01">
</br>
<!--<input type="checkbox" nclass="tlabel">Currently Ongoing</input>-->
</div>

<button id="tsave" type="submit">SAVE</button>

</div>

</div>
</form>
</div>
</div>

</body>

</html>