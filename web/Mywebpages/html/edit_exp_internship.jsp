<%@page import="java.sql.*"%>
<%@ page import="java.io.*,java.util.*"%>

<html>

<head>
    <%@ include file="header_student.jsp" %>
        <link rel="stylesheet" type="text/css" href="..\css\student_resume_exp_internship.css">
    <script src="../js/student.js"></script>
</head>

<body>

<script>
        document.getElementById('b05').style.backgroundColor='purple';
        document.getElementById('b05').style.color='white';
</script>

<div id="intotal">
<div class="incontainer">
    <form action="update_internship_db.jsp">
<div class="inheader">Edit Internship Details<a href="student_resume_exp.jsp"><span class="inclose" style="font-weight:bold" title="close">&times;</span></a></div>

<div class="indetails">
    
 
    <%
        String s_no=request.getParameter("s_no");
try
{   
    Class.forName("com.mysql.jdbc.Driver");
    
    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/waftap","root","root");
     
    PreparedStatement stmt2=con.prepareStatement("select profile,organization,location,sdate,edate,wfh from student_internship_exp where serial_no=?");
    
    stmt2.setInt(1,Integer.parseInt(s_no));
    
    ResultSet rs2=stmt2.executeQuery();
    
    while(rs2.next())
    {
        String profile=rs2.getString(1);
        String organization=rs2.getString(2);
        String location=rs2.getString(3);
        String sdate=rs2.getString(4);
        String edate=rs2.getString(5);
        String wfh=rs2.getString(6);
        String status="";
        
        if(wfh.equals("no"))
        {
            status="work from home";
        }
        %>
<label class="inlabel">Profile*:</label></br>
<input id="inpro" name="profile" value="<%=profile%>" type="text" placeholder="Ex: Web Developer" style="margin-top:5px;" required><hr></br>

<label class="inlabel">Organization*:</label></br>
<input id="inorg" name="organization" value="<%=organization%>" type="text" placeholder="XYZ" style="margin-top:5px;" required><hr></br>

<label class="inlabel">Location*:</label></br>
<div>
    <input id="inloc" name="location" value="<%=location%>" type="text" placeholder="Ex: Mumbai,India" style="margin-top:5px;" required><hr>
<input type="checkbox" name="wfh">Is work from home</input>
</div>
</br>
<div class="inlabel">
<div style="margin-bottom:-10px">
<label>Start Month*:</label></br></br>
</div>
<input type="month" name="smonth" value="sdate" style="width:40%;padding:3px"/>
</div>
<hr id="inh01"></br></br>


<div class="inendyr">
<div class="inlabel">
<label>End Month*:</label></br></br>
<input type="month" name="emonth" value="edate" style="width:40%;padding:3px;margin-top:-12px">
</div>
<hr id="inh01">
</br>
<input class="inlabel" name="" type="checkbox">Currently working here</input>
</div>


<button id="insave" type="submit">SAVE</button>
</div>


 </form>

</div>

</div>
        <%
    }
   
stmt2.execute();

con.close();
}
catch(Exception e)
{
    out.print(e);
}
%>

</body>

</html>