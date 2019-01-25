<%@page import="java.sql.*"%>
<%@ page import="java.io.*,java.util.*"%>

<%
   String s_id=(String)session.getAttribute("uid");
   
try{    
        String title=request.getParameter("title");
    
        String smonth=request.getParameter("smonth");
      
        String emonth=request.getParameter("emonth");
        
        String description=request.getParameter("description");
        
        String c_ongoing=request.getParameter("c_ongoing");
           
    Class.forName("com.mysql.jdbc.Driver");
    
    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/waftap","root","root");
    
    PreparedStatement stmt1=con.prepareStatement("insert into project_oexp (serial_no,s_id3,title,sdate,edate,description,c_ongoing) values(?,?,?,?,?,?,?)");
    
    stmt1.setInt(1,0);
    
    stmt1.setString(2,s_id);
    
    stmt1.setString(3,title);
 
    stmt1.setString(4,smonth);
    
    stmt1.setString(5,emonth);
    
    stmt1.setString(6,description);
    
    stmt1.setString(7,"YES");
    
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