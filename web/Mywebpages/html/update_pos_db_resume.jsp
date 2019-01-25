<%@page import="java.sql.*"%>
<%@ page import="java.io.*,java.util.*"%>

<%
   String s_id=(String)session.getAttribute("uid");
   
try{    
    String desc=request.getParameter("desc");      
           
    Class.forName("com.mysql.jdbc.Driver");
    
    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/waftap","root","root");
    
    PreparedStatement stmt1=con.prepareStatement("update student_pos_oexp set description=? where s_id5=?");
    
    stmt1.setString(1,desc);
    
    stmt1.setString(2,s_id);
    
    stmt1.execute();
    
    con.close();
%>
       <script> window.confirm("Registration successful !!!");</script>
        <jsp:forward page="resume.jsp"/>
        window.confirm("Registration successful !!!");
<%
}
catch(Exception e)
{
    out.print(e);
}
%>