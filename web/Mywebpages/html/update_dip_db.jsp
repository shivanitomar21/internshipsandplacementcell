<%@page import="java.sql.*"%>
<%@page import="java.io.*,java.util.*"%>

<%
    String s_no=(String)session.getAttribute("s_no");
    
try{    
        String college=request.getParameter("college");
    
        String yoc=request.getParameter("yoc");
       
        String stream=request.getParameter("stream");
        
        String obt_marks=request.getParameter("obt_marks");
        
        String max_marks=request.getParameter("max_marks");
 
                  
    Class.forName("com.mysql.jdbc.Driver");
    
    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/waftap","root","root");
    
    PreparedStatement stmt1=con.prepareStatement("update college_edu_dip set college=?,yoc=?,stream=?,max_marks=?,obt_marks=? where serial_no=?");
    
    stmt1.setString(1,college);
 
    stmt1.setString(2,yoc);
    
    stmt1.setString(3,stream);
    
    stmt1.setInt(4,Integer.parseInt(max_marks));
    
    stmt1.setInt(5,Integer.parseInt(obt_marks));
    
    stmt1.setInt(6,Integer.parseInt(s_no));
    
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