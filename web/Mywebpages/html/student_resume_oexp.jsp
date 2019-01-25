<%@page import="java.sql.*"%>
<%@ page import="java.io.*,java.util.*"%>

<html>
<head>
    <%@ include file="header_student.jsp" %>
	    <link rel="stylesheet" type="text/css" href="..\css\student_resume_oexp.css">
	    <link rel="stylesheet" type="text/css" href="..\css\student_resume_oexp_por.css">
	    <link rel="stylesheet" type="text/css" href="..\css\student_resume_oexp_project.css">
	    <link rel="stylesheet" type="text/css" href="..\css\student_resume_oexp_training.css">
        <script src="../js/student.js"></script>
        <script src="../js/fontawesome-all.js"></script>
</head>

<body>

<script>
        document.getElementById('b05').style.backgroundColor='purple';
        document.getElementById('b05').style.color='white';
</script>    
    
<div id="oexptotal">
<div class="oexpcontainer">
<div class="oexpheader">Other Experience</div>
<div class="oexpdetails">
    
  <%
try
{   
    Class.forName("com.mysql.jdbc.Driver");
    
    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/waftap","root","root");

    PreparedStatement stmt1=con.prepareStatement("select description,serial_no from student_pos_oexp where s_id5=?");
    
    stmt1.setString(1,s_id);
    
    ResultSet rs1=stmt1.executeQuery();
    
    int i1=0;
    
    if(rs1.next())
    {
        i1=1;
    }
    if(i1==1)
    {
        %>
        <div id="record"><u>Position of Responsibility :</u></div>
        </br>
        <%
    }
    rs1.beforeFirst();
    
    while(rs1.next())
    {   
        String desc=rs1.getString(1);
        int s_no=rs1.getInt(2);
        %>
        <div id="record2"><i class="fa fa-circle" style="font-size: 10px;margin-left:20px;margin-right: 10px"></i><%=desc%> <span style="float:right"><a id="<%=s_no%>" onclick="edit_por(this.id)"><i class="fa fa-edit"></i></a> &nbsp&nbsp <a id="<%=s_no%>" onclick="delete_por(this.id)"><i class="fa fa-trash" style="color:gray"></i></a> </span></div>
       </br>
       <%
    }
    if(i1==1)
    {
        %>
        <hr>
        <%
    }
    
stmt1.execute();


   PreparedStatement stmt3=con.prepareStatement("select title,sdate,edate,description,c_ongoing,serial_no from project_oexp where s_id3=?");
    
    stmt3.setString(1,s_id);
    
    ResultSet rs3=stmt3.executeQuery();
    
    int i=0;
    
        if(rs3.next())
        {
            i=1;
        }
        if(i==1)
        {
            %>
            <div id="record"><u>Project :</u></div>
            </br>
            <%
        }
        rs3.beforeFirst();
        
    while(rs3.next())
    {
        i=1;
        
        String title=rs3.getString(1);
        String sdate=rs3.getString(2);
        String edate=rs3.getString(3);
        String description=rs3.getString(4);
        String c_ongoing=rs3.getString(5);
        String status="";
        int s_no=rs3.getInt(6);
        if(c_ongoing.equals("yes"))
        {
            status="ongoing";
        }
        %>
        <div style="margin-left:20px">
        <div id="record"><i class="fa fa-circle" style="font-size: 10px;margin-right: 10px"></i><b><%=title%></b>   <span style="float:right"><a id="<%=s_no%>" onclick="edit_pro(this.id)"><i class="fa fa-edit"></i></a> &nbsp;&nbsp; <a id="<%=s_no%>" onclick="delete_pro(this.id)"><i class="fa fa-trash" style="color:gray"></i></a> </span>   </div>
        <div id="record1"><%=description%></div>
        <div id="record1"><%=(sdate)%>-(<%=edate%>)</div>
        <div id="record1"><%=status%></div>
        </div>
        </br></br>
        <%
    }
    if(i==1)
    {
        %>
         <hr>
        <%
    }   
stmt3.execute();


    PreparedStatement stmt2=con.prepareStatement("select program,organization,location,sdate,edate,online,serial_no from student_training_oexp where s_id4=?");
    
    stmt2.setString(1,s_id);
    
    ResultSet rs2=stmt2.executeQuery();

    int i2=0;
    
        if(rs2.next())
        {
            i2=1;
        }
        if(i2==1)
        {
            %>
            <div id="record"><u>Training :</u></div>
            </br>
            <%
        }
        rs2.beforeFirst();
        
    while(rs2.next())
    {
        String program=rs2.getString(1);
        String organization=rs2.getString(2);
        String location=rs2.getString(3);
        String sdate=rs2.getString(4);
        String edate=rs2.getString(5);
        String online=rs2.getString(6);
        String status="";
        int s_no=rs2.getInt(7);
        if(online.equals("yes"))
        {
            status="online";
        }
       
        %>
        <div style="margin-left:20px">
        <div id="record"><i class="fa fa-circle" style="font-size: 10px;margin-right: 10px"></i><b><%=program%></b>   <span style="float:right"><a id="<%=s_no%>" onclick="edit_tra(this.id)"><i class="fa fa-edit"></i></a> &nbsp;&nbsp; <a id="<%=s_no%>" onclick="delete_tra(this.id)"><i class="fa fa-trash" style="color:gray"></i></a> </span>   </div>
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
    
<p id="oexpi01">Do you have any of the following experiences to add?</p>

<h4 id="oexpd01">Position Of Responsibility
    <a href="oexp_por.jsp"><button id="oexpb01"><span id="oexpadd">&plus;</span></button></a>
</h4>

<h4 id="oexpd01">Project
<a href="oexp_project.jsp"><button id="oexpb02"><span id="oexpadd">&plus;</span></button></a>
</h4>

<h4 id="oexpd01">Training
<a href="oexp_training.jsp"><button id="oexpb03"><span id="oexpadd">&plus;</span></button></a>
</h4>
</br>
<a href="student_resume_exp.jsp"><button id="oexpprev">PREVIOUS</button></a>

<a href="student_resume_skills_new.jsp"><button id="oexpskip">SKIP</button></a>

</div>
</div>

</div>

</body>
<script>
     function edit_por(c_id)
    {
        var id=c_id;
        window.location.replace("edit_por.jsp?s_no="+id);
    }
    function delete_por(c_id)
    {
        var id=c_id;
        window.location.replace("delete_por.jsp?s_no="+id);
    }
    function edit_tra(c_id)
    {
        var id=c_id;
        window.location.replace("edit_training.jsp?s_no="+id);
    }
    function delete_tra(c_id)
    {
        var id=c_id;
        window.location.replace("delete_training.jsp?s_no="+id);
    }
     function edit_pro(c_id)
    {
        var id=c_id;
        window.location.replace("edit_project.jsp?s_no="+id);
    }
    function delete_pro(c_id)
    {
        var id=c_id;
        window.location.replace("delete_project.jsp?s_no="+id);
    }
    </script>
</html>