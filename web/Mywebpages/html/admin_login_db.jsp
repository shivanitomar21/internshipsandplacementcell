<%@page import="java.sql.*"%>
<%@page import="java.io.*,java.util.*"%>

<%
try{
    int i=0;
    
    String uid=request.getParameter("uid");
    String pass=request.getParameter("upass");
    
    Class.forName("com.mysql.jdbc.Driver");
    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/waftap","root","root");
    PreparedStatement stmt1=con.prepareStatement("select * from admin_login where a_id=? and a_pwd=?");
    
    stmt1.setString(1,uid);
    stmt1.setString(2,pass);
    
    ResultSet rs1=stmt1.executeQuery();
    
    if(rs1.next())
    {
        i=1;
        %>
        
        <jsp:forward page="Admin_header.html"/>
        <%
    }
    
    if(i!=1)
    {
    PreparedStatement stmt2=con.prepareStatement("select * from signup where s_id=? and password=?");
    
    stmt2.setString(1,uid );
    stmt2.setString(2,pass);
    
    ResultSet rs2=stmt2.executeQuery();
    
    if(rs2.next())
    {
        session.setAttribute("uid",uid);
        %>
        <jsp:forward page="header_student.jsp"/>
        <%
    }
    else
    {
        %>
       
        
        <jsp:forward page="home_page.jsp"/>
        <%
    }
    stmt2.execute();
    }
stmt1.execute();
con.close();
}
catch(Exception e)
{
    out.print(e);
}
%>