<%@page import="java.sql.*"%>
<%@ page import="java.io.*,java.util.*"%>

<%
   String s_id1=(String)session.getAttribute("uid");
   
try{    
    String s1="";
    Class.forName("com.mysql.jdbc.Driver");
    
    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/waftap","root","root");
    
    PreparedStatement stmt1=con.prepareStatement("select status from resume_status where s_id=?");
    
    stmt1.setString(1,s_id1);
    
    ResultSet rs=stmt1.executeQuery();
    
    while(rs.next())
    {
        s1=rs.getString(1);  
        out.print(s1);   
   
    
        if(s1.equals("yes"))
        {out.print(s1);
        %>
            <jsp:forward page="resume.jsp"/>
           
<%}
else if(s1.equals("no")){
            %><jsp:forward page="student_resume_edu.jsp"/><%} 

}   
con.close();
   

}catch(Exception e)
{
    out.print(e);
}
%>