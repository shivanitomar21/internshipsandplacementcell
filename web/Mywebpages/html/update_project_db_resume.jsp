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
    
    PreparedStatement stmt1=con.prepareStatement("update project_oexp set title=?,sdate=?,edate=?,description=?,c_ongoing=? where s_id3=?");
    
    stmt1.setString(1,title);
 
    stmt1.setString(2,smonth);
    
    stmt1.setString(3,emonth);
    
    stmt1.setString(4,description);
    
    stmt1.setString(5,"YES");
    
     stmt1.setString(6,s_id);   
    
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