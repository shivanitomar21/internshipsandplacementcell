<%@page import="java.sql.*"%>
<%@ page import="java.io.*,java.util.*"%>

<%
        String c_id=(String)session.getAttribute("c_id");
   
        String name=request.getParameter("name");
    
        String location=request.getParameter("location");
      
        String hr_email=request.getParameter("email");
       
        String hr_contact=request.getParameter("contact");
        
        String desc=request.getParameter("desc");
           
        out.print(hr_contact);
try{    
         
    Class.forName("com.mysql.jdbc.Driver");
    
    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/waftap","root","root");
    
    PreparedStatement stmt1=con.prepareStatement("update company_placement set co_name=?,co_location=?,hr_email=?,hr_contact=?,description=? where co_id=?");
    
    stmt1.setString(1,name);
 
    stmt1.setString(2,location);
    
    stmt1.setString(3,hr_email);
    
    stmt1.setString(4,hr_contact);
    
    stmt1.setString(5,desc);
    
    stmt1.setInt(6,Integer.parseInt(c_id));
     
    stmt1.execute();
    
con.close();
%>
   
        <jsp:forward page="company_edit_details.jsp"/>
   
<%
}
catch(Exception e)
{
    out.print(e);
}
%>