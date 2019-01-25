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
    <form action="additional_db.jsp">
<div class="adheader">Additional Details</div>
<div class="addetails">    
    
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
        <div id="record1"><i class="fa fa-circle" style="font-size: 10px;margin-left:20px;margin-right: 10px"></i><%=desc%> <span style="float:right"><a href="edit_additional.jsp"><i class="fa fa-edit"></i></a> &nbsp&nbsp <a href="delete_additional.jsp"><i class="fa fa-trash" style="color:gray"></i></a> </span></div>
        </br>
        <%
    }
    %>
    </br>
    <%
stmt1.execute();

con.close();
}
catch(Exception e)
{
    out.print(e);
}
%>    

<p id="adi01">Do you want to add any additional details?</p>

<p id="adex">Ex: Secured first rank in national level story writing competition.</p>

<textarea id="addesc" name="desc" rows="6" cols="67" placeholder="Add details here (max 250 characters)." maxlength="250" required></textarea></br></br></br>

<a id="adprev" href="student_resume_skills.jsp">PREVIOUS</a>

<button id="adsave" style="margin-left:140px">SAVE</button>

<a href="want_to_generate_resume.jsp" id="adskip" >SKIP</a>

</div>

    </form>
</div>
</div>
</body>
<script>
    function fun()
    {
        var status="yes";
      window.location.replace("resume.jsp?status="+status);  
    }
</script>
</html>