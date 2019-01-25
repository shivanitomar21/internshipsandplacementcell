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
	<form id="lmodal-content animate"  action="placed_student_db.jsp" >
		<div class="limg_container">
		<div id="top"><span onclick="closelog()" id="lclose" title="Close Modal">
		&times;</span></div>
		
		
		<br><br><br>
		
<%
		
    String check=request.getParameter("add");
    
			
			if(check.equals("Add"))
			{
				
		%>

		
<br><br>
		
				
<label id="ll02">Student Id </label></br>
<input type="text" placeholder="Enter Student Id" name="sid" id="lt02" required>
</br></br>
<label id="ll03">Company Id </label></br>
<input type="text" placeholder="Enter Company Id" name="cid" id="lt03" required>
<br><br>
<label id="ll02">Year of Placement </label></br>
<input type="text" placeholder="Enter year of placement" name="yop" id="lt04" required>
<br><br>
<%
	String sid=request.getParameter("sid");
        String cid=request.getParameter("cid");
        String yop=request.getParameter("yop");
        out.println(sid);
        out.println(cid);
	try
			{
				Class.forName("com.mysql.jdbc.Driver");
    			Connection con1=DriverManager.getConnection("jdbc:mysql://localhost:3306/waftap","root","root");
    			
				PreparedStatement stmt1=con1.prepareStatement("insert into placed_student(s_id12,company_id,year_of_placement) values (?,?,?)");
				stmt1.setString(1,sid);
                                stmt1.setString(2,cid);
                                stmt1.setString(3,yop);
                                
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
<label id="ll02">Student Id </label></br>
<input type="text" placeholder="Enter Student Id" name="sid" id="lt02" required>
</br></br>
<label id="ll03">Company Id </label></br>
<input type="text" placeholder="Enter Company Id" name="cid" id="lt03" required>
<br><br>
<label id="ll02">Year of Placement </label></br>
<input type="text" placeholder="Enter year of placement" name="yop" id="lt04" required>

</br></br></br>
<%
        String sid=request.getParameter("sid");
        String cid=request.getParameter("cid");
        String yop=request.getParameter("yop");

	try
			{
				Class.forName("com.mysql.jdbc.Driver");
    			Connection con2=DriverManager.getConnection("jdbc:mysql://localhost:3306/waftap","root","root");
    			
				PreparedStatement stmt2=con2.prepareStatement("update placed_student set s_id12=?,company_id=?,year_of_placement=? where s_id12=?");
				stmt2.setString(1,sid);
				stmt2.setString(2,sid);
                                stmt2.setString(3,yop);
                                stmt2.setString(4,sid);
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