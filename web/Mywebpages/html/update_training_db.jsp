<%@page import="java.sql.*"%>
<%@ page import="java.io.*,java.util.*"%>

<%
   String s_id=(String)session.getAttribute("uid");
   
try{    
        String program=request.getParameter("program");
    
        String organization=request.getParameter("organization");
      
        String location=request.getParameter("location");
        
        String sdate=request.getParameter("sdate");
       
        String edate=request.getParameter("edate");
        
        String online=request.getParameter("online");
          
           
    Class.forName("com.mysql.jdbc.Driver");
    
    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/waftap","root","root");
    
    PreparedStatement stmt1=con.prepareStatement("update student_training_oexp set program=?,organization=?,location=?,sdate=?,edate=?,online=? where s_id4=?");
    
    stmt1.setString(1,program);
 
    stmt1.setString(2,organization);
    
    stmt1.setString(3,location);
    
    stmt1.setString(4,sdate);
    
    stmt1.setString(5,edate);
    
    stmt1.setString(6,"no");
     
    stmt1.setString(7,s_id);
    
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