<%@page import="java.sql.*"%>
<%@ page import="java.io.*,java.util.*"%>

<html>

<head>
    <%@ include file="header_student.jsp" %>
	    <link rel="stylesheet" type="text/css" href="..\css\student_resume_exp_job.css">
    <script src="../js/student.js"></script>
</head>

<body>

<script>
        document.getElementById('b05').style.backgroundColor='purple';
        document.getElementById('b05').style.color='white';
</script>
    
<div id="jtotal">
<div class="jcontainer">
        <form action="update_job_db.jsp">
<div class="jheader">Edit Job Details<a href="student_resume_exp.jsp"><span class="jclose" style="font-weight:bold" title="close">&times;</span></a></div>

<div class="jdetails">
  
    
 
    <%
try
{   
    String s_no=request.getParameter("s_no");
    Class.forName("com.mysql.jdbc.Driver");
    
    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/waftap","root","root");

    PreparedStatement stmt1=con.prepareStatement("select profile,organization,location,sdate,edate,cwh from student_job_exp where serial_no=?");
    
    stmt1.setInt(1,Integer.parseInt(s_no));
    
    ResultSet rs1=stmt1.executeQuery();
    
    while(rs1.next())
    {
        String profile=rs1.getString(1);
        String organization=rs1.getString(2);
        String location=rs1.getString(3);
        String sdate=rs1.getString(4);
        String edate=rs1.getString(5);
        
        %>
        <label class="jlabel">Profile*:</label></br>
<input id="jpro" name="profile" value="<%=profile%>" type="text" placeholder="Ex: Web Developer" style="margin-top:5px;" required><hr></br>

<label class="jlabel">Organization*:</label></br>
<input id="jorg" name="organization" value="<%=organization%>" type="text" placeholder="XYZ" style="margin-top:5px;" required><hr></br>

<label class="jlabel">Location*:</label></br>
<input id="jloc" name="location" value="<%=location%>" type="text" placeholder="Ex: Mumbai,India" style="margin-top:5px;" required><hr>

</br>
<div class="jlabel">
<div style="margin-bottom:-11px">
<label>Start Month*:</label></br></br>
</div>
<input type="month" name="sdate" value="<%=sdate%>" style="width:40%;padding:3px"/>
</div>
<hr id="jh01"></br></br>

<div class="jendyr">
<div class="jlabel">
<label>End Month*:</label></br></br>
<input type="month" name="edate" value="<%=edate%>" style="width:40%;padding:3px;margin-top:-13px" />
</div>
<hr id="jh01">
</br>
<input class="jlabel" name="cwh" type="checkbox">Currently working here</input>
</div>

<button id="jsave" type="submit">SAVE</button>
</div>
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

</body>

</html>