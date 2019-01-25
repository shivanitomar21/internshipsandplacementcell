<%@page import="java.sql.*"%>
<%@ page import="java.io.*,java.util.*"%>

<html>
    
    <head>
        <%@ include file="header_student.jsp" %>
	    <link rel="stylesheet" type="text/css" href="..\css\student_resume_oexp_por.css">
        <script src="../js/student.js"></script>
    </head>
    
<body>

<script>
        document.getElementById('b05').style.backgroundColor='purple';
        document.getElementById('b05').style.color='white';
</script>    
    
<div id="portotal">
<form action="update_pos_db.jsp">
<div class="porcontainer">
    
<div class="porheader">Position Of Responsibility<a href="student_resume_oexp.jsp"><span class="porclose" title="close">&times;</span></a>
</div>
<div class="pordetails">
<p id="pori01">Ex: Project leader in Swechha foundation's cleanliness in 2015</p>

<label class="porlabel">Description:</label>
</br>
<%
try
{   
    String s_no=request.getParameter("s_no");
    Class.forName("com.mysql.jdbc.Driver");
    
    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/waftap","root","root");
    

    PreparedStatement stmt1=con.prepareStatement("select description from student_pos_oexp where serial_no=?");
    
    stmt1.setInt(1,Integer.parseInt(s_no));
    
    ResultSet rs1=stmt1.executeQuery();
    
    while(rs1.next())
    {
        String desc=rs1.getString(1);
        
        %>
        <textarea id="pordesc" name="desc" text rows="6" cols="50" placeholder="Add details here(maximum 250 characters)." style="margin-top:10px;" required><%=desc%></textarea>
        </br></br>
       <%
    }
stmt1.execute();
con.close();
}
catch(Exception e)
{
    out.print(e);
}
%>
</br></br>
<a href="student.html"><button type="submit" id="porsave">SAVE</button></a>

</div>
</div>
</form>
</div>

</body>
</html>