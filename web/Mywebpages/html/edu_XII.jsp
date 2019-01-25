<%@page import="java.sql.*"%>
<%@ page import="java.io.*,java.util.*"%>


<html>
    
    <head>
            <%@ include file="header_student.jsp" %>
            <link rel="stylesheet" type="text/css" href="..\css\student_resume_edu_XII.css">
    </head>
    
<body>

<script>
        document.getElementById('b05').style.backgroundColor='purple';
        document.getElementById('b05').style.color='white';
</script>    
    
<div id="XIItotal">
<div class="XIIcontainer">
<form action="edu_XII_db.jsp">
<div class="XIIheader">XII(Senior Secondary) Details <a href="student_resume_edu.jsp"><span class="VIIclose" title="close" style="color:white;font-weight:bold;float:right;padding-right:10px">&times;</span></a></div>

<div class="XIIdetails">
<label class="XIIlabel">School*:</label></br></br>
<input class="XIIscl" type="text" name="school" placeholder="Ex: Delhi Public School" required><hr></br>

<div class="XIIlabel">
<label class="XIIlabel">Year Of Passing*:</label></br></br>
<input type="month" name="yop" style="margin-top:-12px;padding:3px"/>
<hr id="XIIh01" style="width:100%"></br>
</div>

</br></br></br></br></br></br>

<div class="XIIboard">
<label class="XIIlabel">Board*:</label></br></br>

<select id="XIIboard" name="board" style="margin-right:100px">
<option>CBSE</option>
<option>ICSE</option>
<option>State Board</option>
<option>Other</option>
</select>

<hr id="XIIh01">
</div>
</br>

<button id="XIIsave" type="submit">SAVE</button>


<div class="XIIstr" style="margin-top:-5px">
<label class="XIIlabel" style="margin-left:-182px">Stream:</label></br></br>
<input type="text" id="XIIstr" name="stream" style="margin-left:27px" placeholder="Ex: Computer Science" required></br>
<hr id="XIIh01" style="margin-left:27px;">
</div>
</br>

<div class="XIIom">
<label class="XIIlabel">Obtained Marks*:</Label></br></br>
<input type="text" id="XIIom" name="obt_marks" style="width:47%" placeholder="Maximum Marks Obtained" required></br>
<hr id="XIIh01">
</div>

 <div class="XIImm">
<label class="XIIlabel">Maximum Marks*:</Label></br></br>
<input type="text" name="max_marks" id="XIImm" placeholder="Maximum Marks"required></br>
<hr id="XIIh01" style="width:100%">
</div>


</div>
</form>
</div>
</div>
    
</body>
</html>