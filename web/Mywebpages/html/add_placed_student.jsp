<%@page import="java.sql.*"%>
<%@ page import="java.io.*,java.util.*"%>

<html>
<head>
	<link rel="stylesheet" type="text/css" href="..\css\programMaster.css">
    <link rel="stylesheet" type="text/css" href="..\css\admin.css">
    <link rel="stylesheet" type="text/css" href="..\css\admin_career.css">
	
    <script src="../js/admin.js"></script>
	<script src="../js/program.js"></script>	
	
</head>

<body>

<div class="total">
<div class="container">
<img src="logo.png" alt="banasthali logo" id="logo">
Internship and Placements</div>

<nav>

<a href="home_page.jsp"><button id="b01" >Home</button></a>

<div class="dropedit">
  <button onclick="fun2()" class="dropbtnedit" style="margin-left:10px">
  Carrer Corner</button>
  <div id="mydropdowncarrer" class="dropdown-content-edit">
    <a href="#">Internship</a>
    <a href="#">Placements</a>
  </div>
</div>

<button id="b03" onclick="fun3()">Practice Corner   </button>

<a href="report_generation.jsp"><button id="b04">Report Generation</button></a>

<a href="com.jsp"><button id="b05">Company Details</button></a>

<div class="dropedit">
  <button onclick="fun4()" class="dropbtnedit" style="margin-left:10px">Edit
  </button>
  <div id="mydropdownedit" class="dropdown-content-edit" onclick="masterfun()">
    <a href="program_master.jsp" >Program Master</a>
    <a href="Branch_master.jsp">Branch Master</a>
    <a href="programming_lang_master.jsp">Programming Language Master</a>
	<a href="os_master.jsp">OS Master</a>
	<a href="database_,master.jsp">Database Master</a>
	<a href="placed_student.jsp">Placed Students Details</a>
  </div>
</div>
  
<div class="dropdown">
<button onclick="fun5()" class="dropbtn" style="margin-left:50px" ><img 
src="user.png"></button>
<div id="mydropdown" class="dropdown-content">
<a href="#">My Account</a>
<a href="#">Logout</a>
</div>
</div>
</div>


<div id="maindiv">
	<div id="li01" class="lmodal">
	<!--<form id="lmodal-content animate"  action="program_master_db.jsp" >-->
		<div class="limg_container">
		<div id="top"><span onclick="closelog()" id="lclose" title="Close Modal">
		&times;</span></div>
		
		
		<br><br><br>
		
<table  align="center">
		<tr>
			<th>Serial No</th>
			<th>Student Id</th>
			<th>Company Id</th>
			<th>Year of Placement</th>
		</tr>
		
		<%
			try
			{
				Class.forName("com.mysql.jdbc.Driver");
    			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/waftap","root","root");
    			
				Statement stmt=con.createStatement();
				ResultSet rs=stmt.executeQuery("select * from placed_student");
    
    			while(rs.next())
    			{
    				%>
    				<tr><td><%=rs.getInt(1)%></td>
    				<td><%=rs.getString(2)%></td>
					<td><%=rs.getInt(3)%></td>
					<td><%=rs.getInt(4)%></td></tr>
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

		
<br><br>
		
		
		
<label id="ll02">Student Id</label></br>
<input type="text" placeholder="Enter Student Id" name="s_id" id="lt02" required>
</br></br>
<label id="ll02">Company Id</label></br>
<input type="text" placeholder="Enter Company Id" name="co_id" id="lt03" required>
</br></br>
<label id="ll02">Year of Placement</label></br>
<input type="text" placeholder="Enter Year of Placement" name="yop" id="lt04" required>
</br></br>
<a href="add_placed_student_db.jsp"><button type="submit"  id="addbtn" class="log" 
name="add">ADD</button></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&emsp;&emsp;&emsp;&emsp;&emsp;
<!--<a href="edit_placed_student.jsp"><button type="submit"  id="editbtn" class="log" 
name="edit">Edit</button></a></br></br>-->

	<!--</form>-->
	</div>
</div>

</body>
</html>