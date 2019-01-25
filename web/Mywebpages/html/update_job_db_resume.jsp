<%@page import="java.sql.*"%>
<%@ page import="java.io.*,java.util.*"%>

<%
   String s_id=(String)session.getAttribute("uid");
   
try{    
        String profile=request.getParameter("profile");
    
        String organization=request.getParameter("organization");
      
        String location=request.getParameter("location");
        
        String cwh=request.getParameter("cwh");
        
        String sdate=request.getParameter("sdate");
       
        String edate=request.getParameter("edate");
          
           
    Class.forName("com.mysql.jdbc.Driver");
    
    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/waftap","root","root");
    
    PreparedStatement stmt1=con.prepareStatement("update student_job_exp set profile=?,organization=?,location=?,sdate=?,edate=?,cwh=? where s_id2=?");
    
    stmt1.setString(1,profile);
 
    stmt1.setString(2,organization);
    
    stmt1.setString(3,location);
    
    stmt1.setString(4,sdate);
    
    stmt1.setString(5,edate);
    
    stmt1.setString(6,"YES");
    
    
    stmt1.setString(7,s_id);
    
    
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