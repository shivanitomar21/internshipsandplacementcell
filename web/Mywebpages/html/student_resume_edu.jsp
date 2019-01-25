<%@page import="java.sql.*"%>
<%@ page import="java.io.*,java.util.*"%>

<html>


<head>
    <%@ include file="header_student.jsp" %>
    <link rel="stylesheet" type="text/css" href="..\css\student_resume_edu.css">
    <link rel="stylesheet" type="text/css" href="..\css\student_resume_edu_ug.css">
    <link rel="stylesheet" type="text/css" href="..\css\student_resume_edu_pg.css">
    <link rel="stylesheet" type="text/css" href="..\css\student_resume_edu_dip.css">
    <link rel="stylesheet" type="text/css" href="..\css\student_resume_edu_XII.css">
    <link rel="stylesheet" type="text/css" href="..\css\student_resume_edu_X.css">
    <script src="../js/student.js"></script>
    <script src="../js/fontawesome-all.js"></script>
</head>

<body>
    
<script>
        document.getElementById('b05').style.backgroundColor='purple';
        document.getElementById('b05').style.color='white';
</script>  
    
<div style="height:590px" id="etotal">
    
<div class="econtainer">
<div class="eheader">Education</div>
<div class="edetails">
        
<%
try
{   
    Class.forName("com.mysql.jdbc.Driver");
    
    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/waftap","root","root");
    
    
    PreparedStatement stmt3=con.prepareStatement("select program,branch,yoc,college,max_marks,obt_marks from college_edu_pg where s_id11=?");
    
    stmt3.setString(1,s_id);
    
    ResultSet rs3=stmt3.executeQuery();

    while(rs3.next())
    {
        String program=rs3.getString(1);
        String branch=rs3.getString(2);
        String yoc=rs3.getString(3);
        String college=rs3.getString(4);
        int max_marks=rs3.getInt(5);
        int obt_marks=rs3.getInt(6);
        float percent=(float)(obt_marks)*100/max_marks;
        
        %>
        <div id="record"><b><%=program%>(<%=branch%>)</b>   <span style="float:right"><a href="edit_pg.jsp"><i class="fa fa-edit"></i></a> &nbsp&nbsp <a href="delete_pg_db.jsp"><i class="fa fa-trash" style="color:gray"></i></a> </span>   </div>
        <div id="record1">Year Of Completion: <%=yoc%></div>
        <div id="record1"><%=college%></div>
        <div id="record1">Percentage: <%=percent%></div>
        </br>
        <%
    }
stmt3.execute(); 
    



    PreparedStatement stmt4=con.prepareStatement("select program,branch,yoc,college,max_marks,obt_marks from college_edu_ug where s_id9=?");
    
    stmt4.setString(1,s_id);
    
    ResultSet rs4=stmt4.executeQuery();
    
    while(rs4.next())
    {
        String program=rs4.getString(1);
        String branch=rs4.getString(2);
        String yoc=rs4.getString(3);
        String college=rs4.getString(4);
        int max_marks=rs4.getInt(5);
        int obt_marks=rs4.getInt(6);
        float percent=(float)(obt_marks)*100/max_marks;
        
        %>
        <div id="record"><b><%=program%>(<%=branch%>)</b>    <span style="float:right"><a href="edit_ug.jsp"><i class="fa fa-edit"></i></a> &nbsp&nbsp <a href="delete_ug_db.jsp"><i class="fa fa-trash" style="color:gray"></i></a> </span>   </div>
        <div id="record1">Year Of Completion: <%=yoc%></div>
        <div id="record1"><%=college%></div>
        <div id="record1">Percentage: <%=percent%></div>
        </br>
        <%
    }
stmt4.execute(); 
    
    
    
    PreparedStatement stmt2=con.prepareStatement("select stream,college,yoc,max_marks,obt_marks,serial_no from college_edu_dip where s_id10=?");
    
    stmt2.setString(1,s_id);
    
    ResultSet rs2=stmt2.executeQuery();
    
    while(rs2.next())
    {
        String stream=rs2.getString(1);
        String college=rs2.getString(2);
        String yoc=rs2.getString(3);
        int max_marks=rs2.getInt(4);
        int obt_marks=rs2.getInt(5);
        float percent=(float)(obt_marks)*100/max_marks;
        int s_no=rs2.getInt(6);   
        %>
        <div id="record"><b><%=stream%></b>   <span style="float:right"><a id="<%=s_no%>" onclick="edit_dip(this.id)"><i  class="fa fa-edit"></i></a> &nbsp&nbsp <a id="<%=s_no%>" onclick="delete_dip(this.id)"><i class="fa fa-trash" style="color:gray"></i></a> </span> </div>
        <div id="record1">College <%=college%></div>        
        <div id="record1">Year Of Completion: <%=yoc%></div>
        <div id="record1">Percentage: <%=percent%></div>
        </br>
        
         <script>

             function edit_dip(click_id)
             {
                 var s_no=click_id;
                 
                 window.location.replace("edit_dip.jsp?s_no="+s_no);
             }

             function delete_dip(click_id)
             {
                 var s_no=click_id;
                 
                 window.location.replace("delete_dip_db.jsp?s_no="+s_no);
             }
             
        </script>
        <%
    }
stmt2.execute();
    
    
    int i5=0;
    
    PreparedStatement stmt5=con.prepareStatement("select s_class,stream,yop,board,school,max_marks,obt_marks from school_edu_xii where s_id8=?");
    
    stmt5.setString(1,s_id);
    
    ResultSet rs5=stmt5.executeQuery();
    
    if(rs5.next())
        i5=1;
    
    if(i5==1)
    {
        %>
        <script>
            function disableXII()
            {
                document.getElementById('eb02').disabled=true;   
                document.getElementById('eb02').style.cursor='not-allowed';
                document.getElementById('eb02').style.color="gray";
            }
        </script>
        <%
    
    }
    rs5.beforeFirst();
    
    while(rs5.next())
    {
        String s_class=rs5.getString(1);
        String stream=rs5.getString(2);
        String yop=rs5.getString(3);
        String board=rs5.getString(4);
        String school=rs5.getString(5);
        int max_marks=rs5.getInt(6);
        int obt_marks=rs5.getInt(7);
        float percent=(float)(obt_marks)*100/max_marks;
        
        %>
        <div id="record"><b><%=s_class%>,&nbsp<%=stream%></b>   <span style="float:right"><a href="edit_XII.jsp"><i class="fa fa-edit"></i></a> &nbsp;&nbsp; <a href="delete_XII_db.jsp"><i class="fa fa-trash" style="color:gray"></i></a> </span></div>
        <div id="record1">Year Of Completion: <%=yop%></div>
        <div id="record1"><%=board%>(<%=school%>)</div>
        <div id="record1">Percentage: <%=percent%></div>
        </br>
        <%
    }
stmt5.execute();



    PreparedStatement stmt1=con.prepareStatement("select s_class,yop,board,school,max_marks,obt_marks from school_edu_X where s_id1=?");
    
    stmt1.setString(1,s_id);
    
    ResultSet rs1=stmt1.executeQuery();
    
    while(rs1.next())
    {
        String s_class=rs1.getString(1);
        String yop=rs1.getString(2);
        String board=rs1.getString(3);
        String school=rs1.getString(4);
        int max_marks=rs1.getInt(5);
        int obt_marks=rs1.getInt(6);
        float percent=(float)(obt_marks)*100/max_marks;
        
        %>
        <div id="record"><b><%=s_class%></b> <span style="float:right"><a href="edit_X.jsp"><i class="fa fa-edit"></i></a> &nbsp&nbsp <a href="delete_X_db.jsp"><i class="fa fa-trash" style="color:gray"></i></a> </span> </div>
        <div id="record1">Year Of Completion: <%=yop%></div>
        <div id="record1"><%=board%>(<%=school%>)</div>
        <div id="record1">Percentage: <%=percent%></div>
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
    
    
<div></div>
    
<p id="ei01">Tell us a bit about your education</p>

<h4 id="ed01">X(Secondary)
    <a href="edu_X.jsp" ><button id="eb01"><span id="eadd2">&plus;</span></button></a>
</h4>

<h4 id="ed01">XII(Senior Secondary)
    <a href="edu_XII.jsp" ><button id="eb02" ><span id="eadd1">&plus;</span></button></a>
</h4>

<h4 id="ed01">Graduation 
    <button id="eb03"><a href="edu_ug.jsp"><span id="eadd">&plus;</span></a></button>
</h4>

<h4 id="ed01">Post Graduation 
    <button id="eb04"><a href="edu_pg.jsp"><span id="eadd">&plus;</span></a></button>
</h4>

<h4 id="ed01">Diploma 
    <button id="eb05"><a href="edu_dip.jsp"><span id="eadd">&plus;</span></a></button>
</h4>

<a id="eprev" style="display:none" href="#456">PREVIOUS</a>

<a href="student_resume_exp.jsp"><button id="enext" type="submit" style="color:white">NEXT</button></a>

</div>
</div>
</div> 
    
</body>

</html>