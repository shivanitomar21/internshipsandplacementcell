<%@page import="java.sql.*"%>
<%@ page import="java.io.*,java.util.*"%>

<html>
<head>
	<link rel="stylesheet" type="text/css" href="..\css\programMaster.css">
	
    <script src="../js/admin.js"></script>
	<script src="../js/program.js"></script>	
	
</head>

<body>



<div id="maindiv">
	<div id="li01" class="lmodal">
	
		<div class="limg_container">
		<div id="top"><span onclick="closelog()" id="lclose" title="Close Modal">
		&times;</span></div>
		
		
		<br><br><br>
		
<table align="center">
 <div style="font-size: 20px;padding-left: 75px">Have you done building your resume?</div>
		
 </br></br></br>

<a href="confirm_generate.jsp"><button type="submit"  id="addbtn" class="log" name="add">YES</button></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&emsp;&emsp;&emsp;&emsp;&emsp;
<a href="student_resume_additional.jsp"><button type="submit"  id="delbtn" class="log" name="delete">NO</button></a></br></br>

	</form>
	</div>
</div>

</body>
</html>