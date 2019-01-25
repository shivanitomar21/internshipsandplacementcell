<%@page import="java.sql.*"%>
<%@ page import="java.io.*,java.util.*"%>

<%
   String s_id=(String)session.getAttribute("uid");
   int skill=(Integer)session.getAttribute("skill");
   out.print(skill);        
try{    

    
    Class.forName("com.mysql.jdbc.Driver");
    
    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/waftap","root","root");
    
    PreparedStatement stmt1=con.prepareStatement("delete from student_skill where s_id7=? and skill_id=?");
    
    stmt1.setString(1, s_id);
    stmt1.setInt(2,skill);
    
 
    stmt1.execute();
    


    
con.close();
%>
       <script> window.confirm("Registration successful !!!");</script>
        <jsp:forward page="student_resume_skills.jsp"/>
        window.confirm("Registration successful !!!");
<%
}
catch(Exception e)
{
    out.print(e);
}
%>