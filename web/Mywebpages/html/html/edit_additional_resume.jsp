<%@page import="java.sql.*"%>
<%@ page import="java.io.*,java.util.*"%>

<html>
<head>
    <%@ include file="header_student.jsp" %>
	    <link rel="stylesheet" type="text/css" href="..\css\student_resume_additional.css">
    <script src="../js/student.js"></script>
    <script src="../js/fontawesome-all.js"></script>
</head>

<body>

<script>
        document.getElementById('b05').style.backgroundColor='purple';
        document.getElementById('b05').style.color='white';
</script>    
    
<div id="adtotal">
<div class="adcontainer">
    <form action="update_additional_resume.jsp">
<div class="adheader">Additional Details</div>
<div class="addetails">    
    
<p id="adi01">Do you want to add any additional details?</p>

<p id="adex">Ex: Secured first rank in national level story writing competition.</p>

 <%
try
{   
    Class.forName("com.mysql.jdbc.Driver");
    
    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/waftap","root","root");

    PreparedStatement stmt1=con.prepareStatement("select desc1 from student_additional where s_id6=?");
    
    stmt1.setString(1,s_id);
    
    ResultSet rs1=stmt1.executeQuery();
    
    while(rs1.next())
    {   
        String desc=rs1.getString(1);
        
        %>
        <textarea id="addesc" name="desc" rows="6" cols="67" placeholder="Add details here (max 250 characters)." maxlength="250" required><%=desc%></textarea></br></br></br> 
        </br>
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

<a id="adprev" href="resume.jsp">PREVIOUS</a>

<button id="adsave" style="margin-left:140px">SAVE</button>

<a id="adskip" href="#456">SKIP</a>

</div>

    </form>
</div>
</div>
</body>
</html>