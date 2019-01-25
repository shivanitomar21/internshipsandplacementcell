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
    
    PreparedStatement stmt1=con.prepareStatement("insert into student_job_exp (serial_no,s_id2,profile,organization,location,sdate,edate,cwh) values(?,?,?,?,?,?,?,?)");
    
    stmt1.setInt(1,0);
    
    stmt1.setString(2,s_id);
    
    stmt1.setString(3,profile);
 
    stmt1.setString(4,organization);
    
    stmt1.setString(5,location);
    
    stmt1.setString(6,sdate);
    
    stmt1.setString(7,edate);
    
    stmt1.setString(8,"YES");
    
    stmt1.execute();
    
con.close();
%>
       <script> window.confirm("Registration successful !!!");</script>
        <jsp:forward page="student_resume_exp.jsp"/>
        window.confirm("Registration successful !!!");
<%
}
catch(Exception e)
{
    out.print(e);
}
%>