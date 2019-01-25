<%@page import="java.sql.*"%>
<%@ page import="java.io.*,java.util.*"%>

<html>
    
    <head>
            <%@ include file="header_student.jsp" %>
            <link rel="stylesheet" type="text/css" href="..\css\student_resume_edu_X.css">
    </head>
    
<body>

 <script>
        document.getElementById('b05').style.backgroundColor='purple';
        document.getElementById('b05').style.color='white';
</script>   
    
<div id="Xtotal">
<div class="Xcontainer">
<form id="Xform" action="edu_X_db.jsp">
<div class="Xheader">X(Secondary School) Details <a href="student_resume_edu.jsp"><span class="Xclose" title="close" style="color:white;font-weight:bold">&times;</span></a></div>
    
    
<div class="Xdetails">
<label class="Xlabel">School*:</label></br></br>
<input class="Xscl" type="text" name="school" placeholder="Ex: Delhi Public School" required><hr></br>

<div class="Xlabel">
<label>Year Of Passing*:</label></br></br>
<input type="month" name="yop" style="padding:3px"/>
<hr id="Xh01" style="width:100%"></br>
</div>
</br></br></br></br></br></br>
</br>
<div class="Xboard"  >
<label class="Xlabel">Board*:</label></br></br>

<select id="Xboard" name="board" style="width:100%;padding:4px;margin-right:100px">
<option>CBSE</option>
<option>ISC</option>
<option>State Board</option>
<option>Other</option>
</select>

<hr id="Xh02">
</div>

<div class="Xom" style="margin-top:-45px">
<Label class="Xlabel">Obtained Marks*:</Label></br></br>
<input type="text" id="Xom" name="obt_marks" style="margin-top:0px" placeholder="Maximum marks obtained" required></br>
<hr id="Xh01" style="width:100%">
</div>

<div class="Xmm" style="margin-left:220px;margin-top: -65px">
<Label class="Xlabel">Maximum Marks*:</Label></br></br>
<input type="text" id="Xmm" name="max_marks" placeholder="Maximum marks" required></br>
<hr id="Xh01" style="width:100%">
</div>

<button id="Xsave" type="submit">SAVE</button>
<%
session.setAttribute("class","X(Secondary)");
%>
</div>
</form>
</div>
</div>    
    
</body>

    </html>