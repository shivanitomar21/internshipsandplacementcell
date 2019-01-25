<%@page import="java.sql.*"%>
<%@ page import="java.io.*,java.util.*"%>

<%
try{
    
if(request.getParameter("add")!=null)
{	
		%>


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
    <a href="Branch_master.html">Branch Master</a>
    <a href="programming_lang_master.html">Programming Language Master</a>
	<a href="os_master.html">OS Master</a>
	<a href="database_,master.html">Database Master</a>
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
	<form id="lmodal-content animate"  action="branch_master.jsp" >
		<div class="limg_container">
		<div id="top"><span onclick="closelog()" id="lclose" title="Close Modal">
		&times;</span></div>
		
		
		<br><br><br>
	
<table  align="center">
		<tr>
			<th>Branch Id</th>
			<th>Branch Name</th>
		</tr>
		
		<%
			try
			{
				Class.forName("com.mysql.jdbc.Driver");
    			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/waftap","root","root");
    			
				Statement stmt=con.createStatement();
				ResultSet rs=stmt.executeQuery("select * from branch_master");
    
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

		
<br><br><br>
		
		
		
<label id="ll02">Branch Name</label></br>
<input type="text" placeholder="Enter Program Name" name="pname" id="lt02" required>
</br></br></br>
<button type="submit"  id="addbtn" class="log" name="add">ADD</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&emsp;&emsp;&emsp;&emsp;&emsp;
<button type="submit"  id="delbtn" class="log" name="delete">Delete</button></br></br>

	</form>
	</div>
</div>

</body>
</html>
		
		
	<%
    String pname=request.getParameter("pname");
    
    Class.forName("com.mysql.jdbc.Driver");
    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/waftap","root","root");
    PreparedStatement stmt1=con.prepareStatement("insert into branch_master (branch_name) values (?)");
	
	stmt1.setString(1,pname);
	stmt1.execute();
	
	con.close();
	
	
}
 
else if(request.getParameter("delete")!=null)
{	
		%>


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
    <a href="Branch_master.html">Branch Master</a>
    <a href="programming_lang_master.html">Programming Language Master</a>
	<a href="os_master.html">OS Master</a>
	<a href="database_,master.html">Database Master</a>
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
	<form id="lmodal-content animate"  action="branch_master.jsp" >
		<div class="limg_container">
		<div id="top"><span onclick="closelog()" id="lclose" title="Close Modal">
		&times;</span></div>
		
		
		<br><br><br>
	
<table  align="center">
		<tr>
			<th>Branch Id</th>
			<th>Branch Name</th>
		</tr>
		
		<%
			try
			{
				Class.forName("com.mysql.jdbc.Driver");
    			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/waftap","root","root");
    			
				Statement stmt=con.createStatement();
				ResultSet rs=stmt.executeQuery("select * from branch_master");
    
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

		
<br><br><br>
		
		
		
<label id="ll02">Branch Name</label></br>
<input type="text" placeholder="Enter Program Name" name="pid" id="lt02" required>
</br></br></br>
<button type="submit"  id="addbtn" class="log" name="add">ADD</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&emsp;&emsp;&emsp;&emsp;&emsp;
<button type="submit"  id="delbtn" class="log" name="delete">Delete</button></br></br>

	</form>
	</div>
</div>

</body>
</html>
		
		
	<%
    String pname=request.getParameter("pname");
    
    Class.forName("com.mysql.jdbc.Driver");
    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/waftap","root","root");
    PreparedStatement stmt2=con.prepareStatement("delete from branch_master where branch_name=?");
	
	stmt2.setString(1,pname);
	stmt2.execute();
	con.close();
	
	
}
}
catch(Exception e)
{
    out.print(e);
}

%>