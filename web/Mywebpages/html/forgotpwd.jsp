<%@page import="java.sql.*"%>
<%@ page import="java.io.*,java.util.*"%>



<html>
<head>
    <%@ include file="Admin_header.html" %>
	<link rel="stylesheet" type="text/css" href="..\css\programMaster.css">
    <link rel="stylesheet" type="text/css" href="..\css\admin.css">
    <link rel="stylesheet" type="text/css" href="..\css\admin_career.css">
	
    <script src="../js/admin.js"></script>
	<script src="../js/program.js"></script>	
	
</head>

<body>

<div id="maindiv">
	<div id="li01" class="lmodal">
	<form id="lmodal-content animate"  action="resetmail.jsp" method="post">
		<div class="limg_container">
		<div id="top"><span onclick="closelog()" id="lclose" title="Close Modal">
		&times;</span></div>
	<br><br><br>	

<label id="ll01">Enter Email Id</label></br><br>
<input type="text" placeholder="Enter Email" name="email" id="lt01" required></br></br><br>
<button type="submit" id="delbtn" class="log" >Next</button></br></br>

    
   </div>
</form>
</div>
</div>
</body>
</html>