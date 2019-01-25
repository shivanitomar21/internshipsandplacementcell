<%@page import="java.sql.*"%>
<%@ page import="java.io.*,java.util.*"%>

<%
   String s_id=(String)session.getAttribute("uid");
           
try{    
       int i=0,skill_id=0,student_skill_id=-1;
        String skill=request.getParameter("skill");
               
    Class.forName("com.mysql.jdbc.Driver");
    
    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/waftap","root","root");
    
    PreparedStatement stmt1=con.prepareStatement("select skill_id from skill_master where skill_name=?");
    
    stmt1.setString(1,skill);
    
    ResultSet rs1=stmt1.executeQuery();
    
    while(rs1.next())
    {
       skill_id=rs1.getInt(1);
    }
    
    PreparedStatement stmt2=con.prepareStatement("select skill_id from student_skill where skill_id=?");
    
        stmt2.setInt(1,skill_id);
        
    ResultSet rs2=stmt2.executeQuery();
    
    while(rs2.next())
    {
        i=1;
    }
    if(i!=1)
    {
    PreparedStatement stmt3=con.prepareStatement("insert into student_skill (s_id7,skill_id) values(?,?)");
    
    stmt3.setString(1,s_id);
    
    stmt3.setInt(2,skill_id);
 
    stmt3.execute();
     }
    
    stmt1.execute();
    stmt2.execute();
    
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