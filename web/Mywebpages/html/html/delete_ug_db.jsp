<%@page import="java.sql.*"%>
<%@ page import="java.io.*,java.util.*"%>

<%
   String s_id=(String)session.getAttribute("uid");
           
try{    
    
    Class.forName("com.mysql.jdbc.Driver");
    
    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/waftap","root","root");
    
    PreparedStatement stmt1=con.prepareStatement("delete from college_edu_ug where s_id9=?");
    
    stmt1.setString(1, s_id);
    
    stmt1.execute();

    
con.close();
%>
        <jsp:forward page="student_resume_edu.jsp"/>
<%
}
catch(Exception e)
{
    out.print(e);
}
%>