<%@page import="java.sql.*"%>
<%@ page import="java.io.*,java.util.*"%>

<%

try
{
	String s_id=request.getParameter("s_id");
	int co_id=Integer.parseInt(request.getParameter("co_id"));
	int yop=Integer.parseInt(request.getParameter("yop"));
	
	Class.forName("com.mysql.jdbc.Driver");
    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/waftap","root","root");
    Statement stmt1=con.createStatement();
	stmt1.execute("insert into placed_student (s_id,co_id,yr_of_placement) values ('"+s_id+"','"+co_id+"','"+yop+"')");
	out.println("data inserted successfully");
	
	con.close();
	

	
}
catch(Exception e)
{
	e.printStackTrace();
}
%>