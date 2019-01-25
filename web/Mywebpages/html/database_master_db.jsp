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
	<form id="lmodal-content animate"  action="database_master_db.jsp" >
		<div class="limg_container">
		<div id="top"><span onclick="closelog()" id="lclose" title="Close Modal">
		&times;</span></div>
		
		
		<br><br><br>
		
<%
		
    String check=request.getParameter("add");
    
			
			if(check.equals("Add"))
			{
				
		%>

		
<br><br><br><br>
		
				
<label id="ll02">Database Name </label></br>
<input type="text" placeholder="Enter Database Name" name="bname" id="lt02" required>
</br></br></br>

<%
	String bname=request.getParameter("bname");
	try
			{
				Class.forName("com.mysql.jdbc.Driver");
    			Connection con1=DriverManager.getConnection("jdbc:mysql://localhost:3306/waftap","root","root");
    			
				PreparedStatement stmt1=con1.prepareStatement("insert into database_master(ds_name) values (?)");
				stmt1.setString(1,bname);
				stmt1.execute();
				stmt1.close();
				con1.close();
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
			
			
		}
		if(check.equals("Edit"))
			{
    
%>
<label id="ll03">Database Id</label></br>
<input type="text" placeholder="Enter Database Id" name="pid" id="lt03" required>
<label id="ll04">Database Name</label></br>
<input type="text" placeholder="Enter Database Name" name="pname" id="lt04" required>
</br></br></br>
<%
String bid=request.getParameter("pid");
String bname=request.getParameter("pname");
	try
			{
				Class.forName("com.mysql.jdbc.Driver");
    			Connection con2=DriverManager.getConnection("jdbc:mysql://localhost:3306/waftap","root","root");
    			
				PreparedStatement stmt2=con2.prepareStatement("update database_master set ds_name=? where ds_id=?");
				stmt2.setString(1,bname);
				stmt2.setString(2,bid);
				stmt2.executeUpdate();
				stmt2.close();
				con2.close();
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
			
			
		}


%>
<button type="submit"  id="addbtn" class="log" name="add" value="Add">ADD</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&emsp;&emsp;&emsp;&emsp;&emsp;
<button type="submit"  id="delbtn" class="log" name="add" value="Edit">Edit</button></br></br>
        </form>
	</div>
</div>
</body>
</html>