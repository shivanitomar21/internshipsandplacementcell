<%@page import="java.sql.*"%>
<%@ page import="java.io.*,java.util.*"%>

<%
   String c_id=request.getParameter("c_id");
           
try{    
    
    Class.forName("com.mysql.jdbc.Driver");
    
    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/waftap","root","root");
    
    PreparedStatement stmt1=con.prepareStatement("delete from company_placement where co_id=?");
    
    stmt1.setString(1, c_id);
    
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