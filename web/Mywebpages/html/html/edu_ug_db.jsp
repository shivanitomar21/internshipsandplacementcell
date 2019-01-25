<%@page import="java.sql.*"%>
<%@ page import="java.io.*,java.util.*"%>

<%
   String s_id=(String)session.getAttribute("uid");
           
try{    
        String college=request.getParameter("college");
    
        String yoc=request.getParameter("yoc");
      
        String program=request.getParameter("program");
       
        String stream=request.getParameter("stream");
        
        String obt_marks=request.getParameter("obt_marks");
        
        String max_marks=request.getParameter("max_marks");
 
          
           
    Class.forName("com.mysql.jdbc.Driver");
    
    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/waftap","root","root");
    
    PreparedStatement stmt1=con.prepareStatement("insert into college_edu_ug (serial_no,s_id9,college,yoc,program,branch,max_marks,obt_marks) values(?,?,?,?,?,?,?,?)");
    
    stmt1.setInt(1,0);
    
    stmt1.setString(2,s_id);
    
    stmt1.setString(3,college);
 
    stmt1.setString(4,yoc);
    
    stmt1.setString(5,program);
    
    stmt1.setString(6,stream);
    
    stmt1.setInt(7,Integer.parseInt(max_marks));
    
    stmt1.setInt(8,Integer.parseInt(obt_marks));
    
    stmt1.execute();
    
con.close();
%>
       <script> window.confirm("Registration successful !!!");</script>
        <jsp:forward page="student_resume_edu.jsp"/>
        window.confirm("Registration successful !!!");
<%
}
catch(Exception e)
{
    out.print(e);
}
%>