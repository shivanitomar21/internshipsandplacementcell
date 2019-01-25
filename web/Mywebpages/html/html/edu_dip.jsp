<%@page import="java.sql.*"%>
<%@ page import="java.io.*,java.util.*"%>


<html>
    
    <head>
            <%@ include file="header_student.jsp" %>
            <link rel="stylesheet" type="text/css" href="..\css\student_resume_edu_dip.css">
    </head>
    
<body>

<script>
        document.getElementById('b05').style.backgroundColor='purple';
        document.getElementById('b05').style.color='white';
</script>    
    
<div id="diptotal">
<div class="dipcontainer">
<form action="edu_dip_db.jsp">
<div class="dipheader">Diploma Details <a href="student_resume_edu.jsp"><span class="dipclose" title="close" style="color:white;font-weight:bold">&times;</span></a></div>

<div class="dipdetails">
<label class="diplabel">College*:</label></br></br>
<input class="dipclg" name="college" type="text" placeholder="Ex: Banasthali University" required><hr></br>

<div class="diplabel">
<label>Year Of Completion*:</label></br></br>
<input type="month" name="yoc" style="margin-top:-12px"/>
<hr id="diph01" style="width:100%"></br>
</div>
</br></br></br></br></br></br>

<div class="dipstr">
<label class="diplabel">Stream*:</label></br></br>
<input type="text" id="dipstr" name="stream" placeholder="Ex: Creative Writing" required></br>
<hr id="diph01" style="width:100%">
</div>
</br>

<div class="dipom">
<Label class="diplabel">Obtained Marks*:</Label></br></br>
<input type="text" name="obt_marks" id="dipom" style="width:47%" placeholder="Maximum Marks Obtained" required></br>
<hr id="diph01">
</div>

 <div class="dipmm">
<Label class="diplabel">Maximum Marks*:</Label></br></br>
<input type="text" name="max_marks" id="dipmm" placeholder="Maximum Marks"required></br>
<hr id="diph01" style="width:100%">
</div>

<button id="dipsave" type="submit" onclick="dipsave()">SAVE</button>

</div>
</br>

</div>
</form>
</div>
</div> 

</body>

</html>