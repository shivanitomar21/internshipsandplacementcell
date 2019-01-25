<%@page import="java.sql.*"%>
<%@ page import="java.io.*,java.util.*"%>


   
<%
       String skill=request.getParameter("skill");
       
try{    

    
    Class.forName("com.mysql.jdbc.Driver");
    
    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/waftap","root","root");
    
    PreparedStatement stmt1=con.prepareStatement("delete from student_skill where s_id7=? and skill_id=?");
    
    stmt1.setString(1, "BTBTC15127");
    stmt1.setInt(2,Integer.parseInt(skill));
    
 
    stmt1.execute();
    
con.close();
%>
       <script> window.confirm("Registration successful !!!");</script>
        <jsp:forward page="student_resume_skills_new.jsp"/>
        window.confirm("Registration successful !!!");
<%
}
catch(Exception e)
{
    out.print(e);
}
%>