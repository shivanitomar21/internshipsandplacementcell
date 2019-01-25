<%@page import="java.sql.*"%>
<%@ page import="java.io.*,java.util.*"%>

<%
   String s_id=(String)session.getAttribute("uid");
   String cls=(String)session.getAttribute("class");
           
try{    
        String school=request.getParameter("school");
    
        String yop=request.getParameter("yop");
      
        String board=request.getParameter("board");
        
        String obt_marks=request.getParameter("obt_marks");
        
        String max_marks=request.getParameter("max_marks");
           
    Class.forName("com.mysql.jdbc.Driver");
    
    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/waftap","root","root");
    
    PreparedStatement stmt1=con.prepareStatement("insert into school_edu_X (s_id1,s_class,yop,school,board,max_marks,obt_marks) values(?,?,?,?,?,?,?)");
    
    stmt1.setString(1,s_id);
    
    stmt1.setString(2,cls);
 
    stmt1.setString(3,yop);
    
    stmt1.setString(4,school);
    
    stmt1.setString(5,board);
    
    stmt1.setInt(6,Integer.parseInt(max_marks));
    
    stmt1.setInt(7,Integer.parseInt(obt_marks));
    
    stmt1.execute();
    
con.close();
%>
<jsp:forward page="student_resume_edu.jsp"/>
        
<%
}
catch(Exception e)
{
    out.print(e);
}
%>
