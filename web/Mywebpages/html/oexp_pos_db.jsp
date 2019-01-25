<%@page import="java.sql.*"%>
<%@ page import="java.io.*,java.util.*"%>

<%
   String s_id=(String)session.getAttribute("uid");
   
try{    
    String desc=request.getParameter("desc");      
           
    Class.forName("com.mysql.jdbc.Driver");
    
    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/waftap","root","root");
    
    PreparedStatement stmt1=con.prepareStatement("insert into student_pos_oexp (serial_no,s_id5,description) values(?,?,?)");
    
    stmt1.setInt(1,0);
    
    stmt1.setString(2,s_id);
    
    stmt1.setString(3,desc);
    
    stmt1.execute();
    
    con.close();
%>
       <script> window.confirm("Registration successful !!!");</script>
        <jsp:forward page="student_resume_oexp.jsp"/>
        window.confirm("Registration successful !!!");
<%
}
catch(Exception e)
{
    out.print(e);
}
%>