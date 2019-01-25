<%@page import="java.sql.*"%>
<%@ page import="java.io.*,java.util.*"%>


<html>
    
    <head>
            <%@ include file="header_student.jsp" %>
            <link rel="stylesheet" type="text/css" href="..\css\student_resume_edu_ug.css">
    </head>
    
<body>

<script>
        document.getElementById('b05').style.backgroundColor='purple';
        document.getElementById('b05').style.color='white';
</script>    
    
<div id="ugtotal">
<div class="ugcontainer">
<form action="edu_ug_db.jsp">
<div class="ugheader">Graduation Details <a href="student_resume_edu.jsp"><span class="ugclose" style="color:white;font-weight:bold" title="close">&times;</span></a></div>

<div class="ugdetails">
<label class="uglabel">College*:</label></br></br>
<input class="clg" name="college" type="text" placeholder="Ex: Banasthali University" required><hr></br>

<div class="uglabel">
<label>Year Of completion*:</label></br></br>
<input type="month" name="yoc" style="margin-top:-12px;padding:3px"/>
<hr id="ugh01" style="width:100%"></br>
</div>

</br></br></br></br></br></br>

<div class="ugdeg">
<label class="uglabel">Program*:</label></br></br>
<select id="ugdeg" name="program" style="margin-right:100px">
<option>---select---</option>
<option>Bachelor of Technology</option>
<option>Bachelor of Science</option>
<option>Bachelor of Computer Application</option>
</select>

<hr id="ugh01">
</div>
</br>
<button id="ugsave" type="submit" onclick="ugsave()" >SAVE</button>

<div class="ugstr" style="margin-top:-5px">
<label class="uglabel" style="margin-left:-182px">Stream:</label></br></br>
<select id="ugstr" name="stream" style="margin-right:100px;margin-left:27px" required>
<option>---select---</option>
<option>Computer Science</option>
<option>Information Technology</option>
</select>

<hr id="ugh01" style="margin-left:27px">
</div>
</br>

<div class="ugom">
<Label class="uglabel">Obtained Marks*:</Label></br></br>
<input type="text" id="ugom" name="obt_marks" placeholder="Maximum obtained marks" required></br>
<hr id="ugh01">
</div>

 <div class="ugmm">
<Label class="uglabel">Maximum Marks*:</Label></br></br>
<input type="text" name="max_marks" id="ugmm" style="width:100%" placeholder="Maximum Marks"required></br>
<hr id="pgh01" style="width:100%">
 </div>

</div>
</form>
</div>
</div>

</body>

</html>