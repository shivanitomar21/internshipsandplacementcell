<%@page import="java.sql.*"%>
<%@ page import="java.io.*,java.util.*"%>

<%
    String s_id=(String)session.getAttribute("uid");
    try
    {
    Class.forName("com.mysql.jdbc.Driver");
    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/waftap","root","root");
    			
   
    PreparedStatement stmt=con.prepareStatement("update signup set resume_status=? where s_id=?");
   
    stmt.setString(1,"yes");
    
    stmt.setString(2,s_id);
    
    stmt.executeUpdate();
    
    %>
        <jsp:forward page="resume.jsp"/>
    <%
        }
    catch(Exception e)
    {
	e.printStackTrace();
    }
%>