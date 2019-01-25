<%@page import="java.sql.*"%>
<%@ page import="java.io.*,java.util.*"%>

<%
   String s_no=request.getParameter("s_no");
           
try{    
    
    Class.forName("com.mysql.jdbc.Driver");
    
    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/waftap","root","root");
    
    PreparedStatement stmt1=con.prepareStatement("delete from student_internship_exp where serial_no=?");
    
    stmt1.setInt(1, Integer.parseInt(s_no));
    
    stmt1.execute();

    
con.close();
%>
        <jsp:forward page="student_resume_exp.jsp"/>
<%
}
catch(Exception e)
{
    out.print(e);
}
%>