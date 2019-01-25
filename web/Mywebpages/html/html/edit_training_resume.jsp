<%@page import="java.sql.*"%>
<%@ page import="java.io.*,java.util.*"%>

<html>
<head>
    <%@ include file="header_student.jsp" %>
	    <link rel="stylesheet" type="text/css" href="..\css\student_resume_oexp.css">
	    <link rel="stylesheet" type="text/css" href="..\css\student_resume_oexp_training.css">
    <script src="../js/student.js"></script>
</head>

<body>

<script>
        document.getElementById('b05').style.backgroundColor='purple';
        document.getElementById('b05').style.color='white';
</script>    
    
<div id="ttotal">
<div class="tcontainer">
    <form action="update_training_db_resume.jsp">
<div class="theader">Training Details<a href="resume.jsp"><span class="tclose" title="close">&times;</span></div></a>

<div class="tdetails">
<label class="tlabel">Training Program*:</label></br>

<%
try
{   
    Class.forName("com.mysql.jdbc.Driver");
    
    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/waftap","root","root");
     
    PreparedStatement stmt2=con.prepareStatement("select program,organization,location,sdate,edate,online from student_training_oexp where s_id4=?");
    
    stmt2.setString(1,s_id);
    
    ResultSet rs2=stmt2.executeQuery();
    
    while(rs2.next())
    {
        String program=rs2.getString(1);
        String organization=rs2.getString(2);
        String location=rs2.getString(3);
        String sdate=rs2.getString(4);
        String edate=rs2.getString(5);
        String online=rs2.getString(6);
        String status="";
        
        if(online.equals("yes"))
        {
            status="online";
        }
        %>
        <input id="tpro" name="program" value="<%=program%>" type="text" placeholder="Ex: Analytics" style="margin-top:5px;" required><hr></br>

        <label class="tlabel">Organization*:</label></br>
        <input id="torg" name="organization" value="<%=organization%>" type="text" placeholder="XYZ" style="margin-top:5px;" required><hr></br>

        <div>
        <label class="tlabel">Location*:</label></br>
        <input id="tloc" name="location" value="<%=location%>" type="text" placeholder="Ex: Mumbai,India" style="margin-top:5px;" required><hr>
        <input type="checkbox" name="online" class="tlabel">Online</input>
        </div>

        </br>

        <div>
        <div class="tlabel">
        <div style="margin-bottom:-11px">
        <label>Start Month*:</label></br></br>
        </div>
        <input type="month" name="sdate" value="<%=sdate%>" style="width:40%;padding:3px;" />
        </div>
        <hr id="th01"></br></br>


        <div class="tendyr">
        <div class="tlabel">
        <label>End Month*:</label></br></br>
        <input type="month" name="edate" value="<%=edate%>" style="width:40%;padding:3px;margin-top:-12px" />
        </div>
        <hr id="th01">
        </br>
        <!--<input type="checkbox" nclass="tlabel">Currently Ongoing</input>-->
        </div>

        <button id="tsave" type="submit">SAVE</button>

        </div>

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