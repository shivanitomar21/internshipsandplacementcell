<%@page import="java.sql.*"%>
<%@ page import="java.io.*,java.util.*"%>

<html>
<head>
	<%@ include file="Admin_header.html" %>
	<%@ include file="table.jsp" %>
	<link rel="stylesheet" type="text/css" href="..\css\programMaster.css">
    <link rel="stylesheet" type="text/css" href="..\css\admin.css">
    <link rel="stylesheet" type="text/css" href="..\css\admin_career.css">
	<link rel="stylesheet" type="text/css" href="..\css\report.css">
	
    <script src="../js/admin.js"></script>
	<script src="../js/program.js"></script>	
	
</head>

<body>
<%
String[] selectp = request.getParameterValues("program");
String[] selectb = request.getParameterValues("branch");
String[] selecty = request.getParameterValues("year");
String[] selectc = request.getParameterValues("company");
%>

		<table  align="center" height="auto">
		<tr>
			<th>Student Id</th>
			<th>First Name</th>
			<th>Last Name</th>
			<th>Contact</th>
			<th>Email</th>
			<th>Program</th>
			<th>Branch</th>
			<th>Company Name</th>
			<th>Year of Placement</th>
		</tr>
		
		<%
			String query = "Select * from report_table where";
				for(int j=0;j<selectp.length;j++)
				{
					if(j==0)
					{
						if(selectp.length==1)
							query= query+" program_name=?";
						else
							query = query+" (program_name=?";
					}
					else if(j==selectp.length-1) 
						query= query+" OR program_name=?)";
					else
						query = query+" OR program_name=?";
				}
				if(selectb!=null)
					for(int j=0;j<selectb.length;j++)
					{
						if(j==0)
						{
							if(selectb.length==1)
								query= query+" and branch_name=?";
							else
								query = query+" and (branch_name=?";
						}
						else if(j==selectb.length-1) 
							query= query+" OR branch_name=?)";
						else
							query = query+" OR branch_name=?";
					}
				if(selecty!=null)
					for(int j=0;j<selecty.length;j++)
					{
						if(j==0)
						{
							if(selecty.length==1)
								query= query+" and yr_of_placement=?";
							else
								query = query+" and (yr_of_placement=?";
						}
						else if(j==selecty.length-1) 
							query= query+" OR yr_of_placement=?)";
						else
							query = query+" OR yr_of_placement=?";
					}
				if(selectc!=null)
					for(int j=0;j<selectc.length;j++)
					{
					if(j==0)
						{
							if(selectc.length==1)
								query= query+" and co_name=?";
							else
								query = query+" and (co_name=?";
						}
						else if(j==selectc.length-1) 
							query= query+" OR co_name=?)";
						else
							query = query+" OR co_name=?";
					}
			try
			{
				Class.forName("com.mysql.jdbc.Driver");
    			Connection con2=DriverManager.getConnection("jdbc:mysql://localhost:3306/waftap","root","root");
    			int i=1;
					PreparedStatement stmt1=con2.prepareStatement(query);
				for(int j=0;j<selectp.length;j++)
					stmt1.setString(i++,selectp[j]);
				if(selectb!=null)
					for(int j=0;j<selectb.length;j++)
						stmt1.setString(i++,selectb[j]);
				if(selecty!=null)
					for(int j=0;j<selecty.length;j++)
						stmt1.setString(i++,selecty[j]);
				if(selectc!=null)
					for(int j=0;j<selectc.length;j++)
						stmt1.setString(i++,selectc[j]);
					ResultSet rs1=stmt1.executeQuery();
					while(rs1.next())
					{  
						%>
						<tr><td><%=rs1.getString(1)%></td>
						<td><%=rs1.getString(2)%></td>
						<td><%=rs1.getString(3)%></td>
						<td><%=rs1.getString(4)%></td>
						<td><%=rs1.getString(5)%></td>
						<td><%=rs1.getString(6)%></td>
						<td><%=rs1.getString(7)%></td>
						<td><%=rs1.getString(8)%></td>
						<td><%=rs1.getInt(9)%></td></tr>
						<%   
					}
				%>
	
				</table>
	<%}
	catch(Exception e)
	{
		out.println(e);
	}
%>


</body>
</html>