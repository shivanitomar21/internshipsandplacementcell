<%@page import="java.sql.*"%>
<%@ page import="java.io.*,java.util.*"%>

<%
  
        try
{
String name=request.getParameter("name");
    out.print(name);
        String location=request.getParameter("location");
      out.print(location);
        String hr_email=request.getParameter("email");
       out.print(hr_email);
        String hr_contact=request.getParameter("contact");
        out.print(hr_contact);
        String desc=request.getParameter("desc");
        
        
           

try{    
         
    Class.forName("com.mysql.jdbc.Driver");
    
    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/waftap","root","root");
    
    PreparedStatement stmt1=con.prepareStatement("insert into company_placement (co_name,co_location,hr_email,hr_contact,description,co_id) values(?,?,?,?,?,?)");
    
    stmt1.setString(1,name);
 
    stmt1.setString(2,location);
    
    stmt1.setString(3,hr_email);
    
    stmt1.setString(4,hr_contact);
    
    stmt1.setString(5,desc);
    
    
    stmt1.setInt(6,0);
    
   
    
   
     
    stmt1.execute();
    
con.close();
%>
      
        <jsp:forward page="add_company_details.jsp"/>
        
<%
}
catch(Exception e)
{
    out.print(e);
}
}
catch (Exception e){
out.println(e.getMessage());
}
%>