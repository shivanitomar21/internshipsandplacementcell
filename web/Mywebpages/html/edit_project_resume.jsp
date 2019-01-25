<%@page import="java.sql.*"%>
<%@ page import="java.io.*,java.util.*"%>

<html>
<head>
    <%@ include file="header_student.jsp" %>
	    <link rel="stylesheet" type="text/css" href="..\css\student_resume_oexp.css">
	    <link rel="stylesheet" type="text/css" href="..\css\student_resume_oexp_project.css">
    <script src="../js/student.js"></script>
</head>

<body>
 
<script>
        document.getElementById('b05').style.backgroundColor='purple';
        document.getElementById('b05').style.color='white';
</script>    
    
<div id="pjtotal">
<div class="pjcontainer">
    <form action="update_project_db_resume.jsp">
<div class="pjheader">Project Details<a href="resume.jsp"><span class="pjclose" title="close">&times;</span></div></a>

<div class="pjdetails">
<label class="pjlabel">Title*:</label></br>

 <%
try
{   
    Class.forName("com.mysql.jdbc.Driver");
    
    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/waftap","root","root");


   PreparedStatement stmt3=con.prepareStatement("select title,sdate,edate,description,c_ongoing from project_oexp where s_id3=?");
    
    stmt3.setString(1,s_id);
    
    ResultSet rs3=stmt3.executeQuery();
    
    while(rs3.next())
    {
        String title=rs3.getString(1);
        String sdate=rs3.getString(2);
        String edate=rs3.getString(3);
        String description=rs3.getString(4);
        String c_ongoing=rs3.getString(5);
        String status="";
        
        if(c_ongoing.equals("yes"))
        {
            status="ongoing";
        }
       
        %>
        <input class="pjclg" name="title" value="<%=title%>" type="text" placeholder="Ex: Optical Character Recognition" required/><hr></br>

<div class="pjlabel">
<div style="margin-bottom:-11px">
<label>Start Month*:</label></br></br>
</div>
<input type="month" name="smonth" value="<%=sdate%>" style="width:40%;padding:4px"/>

</div>
<hr id="pjh01"></br></br>

<div class="pjendyr">
<div class="pjlabel">
<label>End Month*:</label></br></br>
<input type="month" name="emonth" value="<%=edate%>" style="width:40%;padding:3px;margin-top:-13px"/>
</div>
<hr id="pjh01">
</br>
<input type="checkbox" name="c_ongoing" value="<%=c_ongoing%>" class="pjlabel">currently ongoing</input>
</div>


<div id="pjdesc">
<label class="pjlabel">Description:</label>
</br>
<textarea id="desc" name="description" rows="6" cols="62" placeholder="Add details here(maximum 250 characters)." maxlength="250" style="margin-top:10px;" required><%=description%></textarea>
</br></br>
<button id="pjsave" type="submit">SAVE</button>
        <%
    }
      
stmt3.execute();

con.close();
}
catch(Exception e)
{
    out.print(e);
}
%>

</div>
</div>
</form>
</div>
</div>
</body>

</html>