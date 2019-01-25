<%@page import="java.sql.*"%>
<%@ page import="java.io.*,java.util.*"%>

<%
try
{   
    String s_id=(String)session.getAttribute("uid");
    String s_no=request.getParameter("s_no");
    Class.forName("com.mysql.jdbc.Driver");
    
    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/waftap","root","root");

    PreparedStatement stmt1=con.prepareStatement("select resume_status from signup where s_id=?");
    
    stmt1.setString(1,s_id);
   
    ResultSet rs1=stmt1.executeQuery();
    
    while(rs1.next())
    {
        String status=rs1.getString(1);
        
        if(status.equals("yes"))
        {
        %>
             <jsp:forward page="resume.jsp"/>
       <%
        }
        else
        {
        %>
             <jsp:forward page="student_resume_edu.jsp"/>
        <%
        }
    }
stmt1.execute();
con.close();
}
catch(Exception e)
{
    out.print(e);
}
%>