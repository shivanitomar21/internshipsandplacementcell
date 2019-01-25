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
	<form id="lmodal-content animate"  action="program_master_db.jsp" >
		<div class="limg_container">
		<div id="top"><span onclick="closelog()" id="lclose" title="Close Modal">
		&times;</span></div>
		
		
		<br><br><br>
		
<table  align="center">
		<tr>
			<th>Program Id</th>
			<th>Program Name</th>
		</tr>
		
		<%
			try
			{
				Class.forName("com.mysql.jdbc.Driver");
    			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/waftap","root","root");
    			
				Statement stmt=con.createStatement();
				ResultSet rs=stmt.executeQuery("select * from program_master");
    
    			while(rs.next())
    			{
    				%>
    				<tr><td><%=rs.getInt(1)%></td>
    				<td><%=rs.getString(2)%></td></tr>
    				<%   

				}
				%>
	
				</table>
				
				<%
				rs.close();
				stmt.close();
				con.close();
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
%>


<br><br><br><br>
		
		
<!--		
<label id="ll02">Program Name</label></br>
<input type="text" placeholder="Enter Program Name" name="pname" id="lt02" required>
</br></br></br>-->
<button type="submit"  id="addbtn" class="log" name="add" value="Add">ADD</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&emsp;&emsp;&emsp;&emsp;&emsp;
<button type="submit"  id="delbtn" class="log" name="edit" value="Edit">Edit</button></br></br>

	</form>
	</div>
</div>

</body>
</html>