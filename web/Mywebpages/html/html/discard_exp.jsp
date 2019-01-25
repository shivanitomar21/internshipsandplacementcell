<%@page import="java.sql.*"%>
<%@ page import="java.io.*,java.util.*"%>

<%
    String serial_no=(String)session.getAttribute("serial_no");
      
try{      

    Class.forName("com.mysql.jdbc.Driver");
    
    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/waftap","root","root");
    
    PreparedStatement stmt1=con.prepareStatement("delete from alumni_exp_admin where serial_no=?");
    
    stmt1.setString(1,serial_no);
    
    stmt1.execute();
    
con.close();
%>
       <script> window.confirm("Registration successful !!!");</script>
        <jsp:forward page="filter_experiences.jsp"/>
        window.confirm("Registration successful !!!");
<%
}
catch(Exception e)
{
    out.print(e);
}
%>