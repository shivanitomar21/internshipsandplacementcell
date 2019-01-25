<html>
<head>
    <%@ include file="header_student.jsp" %>
	    <link rel="stylesheet" type="text/css" href="..\css\student_resume_oexp.css">
	    <link rel="stylesheet" type="text/css" href="..\css\student_resume_oexp_project.css">
    <script src="../js/student.js"></script>
</head>

<body>
   
<script>
        document.getElementById('b05').style.backgroundColor='purple';
        document.getElementById('b05').style.color='white';
</script>

<div id="pjtotal">
<div class="pjcontainer">
    <form action="oexp_project_db.jsp">
<div class="pjheader">Project Details<a href="student_resume_oexp.jsp"><span class="pjclose" title="close">&times;</span></div></a>

<div class="pjdetails">
<label class="pjlabel">Title*:</label></br>
<input class="pjclg" name="title" type="text" placeholder="Ex: Optical Character Recognition" required/><hr></br>

<div class="pjlabel">
<div style="margin-bottom:-11px">
<label>Start Month*:</label></br></br>
</div>
<input type="month" name="smonth" style="width:40%;padding:4px"/>

</div>
<hr id="pjh01"></br></br>

<div class="pjendyr">
<div class="pjlabel">
<label>End Month*:</label></br></br>
<input type="month" name="emonth" style="width:40%;padding:3px;margin-top:-13px"/>
</div>
<hr id="pjh01">
</br>
<input type="checkbox" name="c_ongoing" class="pjlabel">currently ongoing</input>
</div>


<div id="pjdesc">
<label class="pjlabel">Description:</label>
</br>
<textarea id="desc" name="description" rows="6" cols="62" placeholder="Add details here(maximum 250 characters)." maxlength="250" style="margin-top:10px;" required></textarea>
</br></br>
<button id="pjsave" type="submit">SAVE</button>
</div>
</div>
</form>
</div>
</div>
</body>

</html>