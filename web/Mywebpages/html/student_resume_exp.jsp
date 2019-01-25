<%@page import="java.sql.*"%>
<%@ page import="java.io.*,java.util.*"%>

<html>

<head>
    <%@ include file="header_student.jsp" %>
	    <link rel="stylesheet" type="text/css" href="..\css\student_resume_exp.css">
	    <link rel="stylesheet" type="text/css" href="..\css\student_resume_exp_internship.css">
	    <link rel="stylesheet" type="text/css" href="..\css\student_resume_exp_job.css">
    <script src="../js/student.js"></script>
    <script src="../js/fontawesome-all.js"></script>
</head>

<body>
   
<script>
        document.getElementById('b05').style.backgroundColor='purple';
        document.getElementById('b05').style.color='white';
</script>    
    
<div id="exptotal">
<div class="expcontainer">
<div class="expheader">Experience</div>
<div class="expdetails">
    
<%
try
{   
    Class.forName("com.mysql.jdbc.Driver");
    
    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/waftap","root","root");

    PreparedStatement stmt1=con.prepareStatement("select profile,organization,location,sdate,edate,cwh,serial_no from student_job_exp where s_id2=?");
    
    stmt1.setString(1,s_id);
    
    ResultSet rs1=stmt1.executeQuery();
       
    int i1=0;
    
    if(rs1.next())
        i1=1;
    
    if(i1==1)
    {
        %>
        <div id="record"><u>Job :</u></div>
        </br>
        <%
    }
    rs1.beforeFirst();
    while(rs1.next())
    {
        String profile=rs1.getString(1);
        String organization=rs1.getString(2);
        String location=rs1.getString(3);
        String sdate=rs1.getString(4);
        String edate=rs1.getString(5);
        int s_no=rs1.getInt(6);
        %>
        <div style="margin-left:20px">
        <div id="record"><i class="fa fa-circle" style="font-size: 10px;margin-right: 10px"></i><b><%=profile%></b>   <span style="float:right"><a id="<%=s_no%>" onclick="edit_job(this.id)"><i class="fa fa-edit"></i></a> &nbsp&nbsp <a id="<%=s_no%>" onclick="delete_job(this.id)"><i class="fa fa-trash" style="color:gray"></i></a> </span>   </div>
        <div id="record1"><%=organization%>(<%=location%>)</div>
        <div id="record1"><%=sdate%>-(<%=edate%>)</div>
        </div>
        </br></br>
        <%
    }
    if(i1==1)
    {
        %>
        <hr>
        <%
    }
    stmt1.execute();

    
    
    PreparedStatement stmt2=con.prepareStatement("select profile,organization,location,sdate,edate,wfh,serial_no from student_internship_exp where s_id=?");
    
    stmt2.setString(1,s_id);
    
    ResultSet rs2=stmt2.executeQuery();
    
    int i2=0;
    
    if(rs2.next())
        i2=1;
    
    if(i2==1)
    {
        %>
        <div id="record"><u>Internship :</u></div>
        </br>
        <%
    }
    rs2.beforeFirst();
    
    while(rs2.next())
    {
        String profile=rs2.getString(1);
        String organization=rs2.getString(2);
        String location=rs2.getString(3);
        String sdate=rs2.getString(4);
        String edate=rs2.getString(5);
        String wfh=rs2.getString(6);
        String status="";
        int s_no=rs2.getInt(7);

        
        if(wfh.equals("no"))
        {
            status="work from home";
        }
       
        %>
        <div style="margin-left:20px">    
        <div id="record"><i class="fa fa-circle" style="font-size: 10px;margin-right: 10px"></i><b><%=profile%></b>   <span style="float:right"><a id="<%=s_no%>" onclick="edit_int(this.id)"><i class="fa fa-edit"></i></a> &nbsp;&nbsp; <a id="<%=s_no%>" onclick="delete_int(this.id)"><i class="fa fa-trash" style="color:gray"></i></a> </span>   </div>
        <div id="record1"><%=organization%>(<%=location%>)</div>
        <div id="record1"><%=sdate%>-(<%=edate%>)</div>
        <div id="record1"><%=status%></div>
        </div>
        </br></br>
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
        
    
    
    
<p id="expi01">Do you have any past internship or job experience?</p>

<h4 id="expd01">Internship
<a href="exp_internship.jsp"><button id="expb01"><span id="expadd">&plus;</span></button></a>
</h4>

<h4 id="expd01">Job
<a href="exp_job.jsp"><button id="expb02"><span id="expadd">&plus;</span></button></a>
</h4>

<a href="student_resume_edu.jsp"><button id="expprev">PREVIOUS</button></a>

<a href="student_resume_oexp.jsp"><button id="expskip">SKIP</button></a>

</div>
</div>
        
</div>

</body>
<script>
    function edit_int(c_id)
    {
        var id=c_id;
        window.location.replace("edit_exp_internship.jsp?s_no="+id);
    }
    function delete_int(c_id)
    {
        var id=c_id;
        window.location.replace("delete_exp_internship.jsp?s_no="+id);
    }
    function edit_job(c_id)
    {
        var id=c_id;
        window.location.replace("edit_exp_job.jsp?s_no="+id);
    }
    function delete_job(c_id)
    {
        var id=c_id;
        window.location.replace("delete_exp_job.jsp?s_no="+id);
    }
</script>
</html>