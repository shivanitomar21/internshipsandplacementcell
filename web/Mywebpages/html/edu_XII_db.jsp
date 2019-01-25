<%@page import="java.sql.*"%>
<%@ page import="java.io.*,java.util.*"%>

<%
   String s_id=(String)session.getAttribute("uid");
           out.print(s_id);
try{    
        String school=request.getParameter("school");
    
        String yop=request.getParameter("yop");
      
        String board=request.getParameter("board");
        
        String stream=request.getParameter("stream");
        
        String obt_marks=request.getParameter("obt_marks");
        
        String max_marks=request.getParameter("max_marks");
        
        out.print(obt_marks);
        
    Class.forName("com.mysql.jdbc.Driver");
    
    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/waftap","root","root");
    
    PreparedStatement stmt1=con.prepareStatement("insert into school_edu_xii (s_id8,s_class,yop,school,board,stream,max_marks,obt_marks) values(?,?,?,?,?,?,?,?)");
    
    stmt1.setString(1,s_id);
    
    stmt1.setString(2,"XII(Senior Secondary)");
 
    stmt1.setString(3,yop);
    
    stmt1.setString(4,school);
    
    stmt1.setString(5,board);
    
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