<%@page import="java.sql.*"%>
<%@ page import="java.io.*,java.util.*"%>


<html>
    
    <head>
            <%@ include file="header_student.jsp" %>
            <link rel="stylesheet" type="text/css" href="..\css\student_resume_edu_ug.css">
    </head>
    
<body>

<script>
        document.getElementById('b05').style.backgroundColor='purple';
        document.getElementById('b05').style.color='white';
</script>
    
   <%
try
{   
    Class.forName("com.mysql.jdbc.Driver");
    
    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/waftap","root","root");
    
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
<div id="ugtotal">
<div class="ugcontainer">
<form action="update_ug_db_resume.jsp">
<div class="ugheader">Graduation Details <a href="resume.jsp"><span class="ugclose" title="close" style="color:white;font-weight:bold">&times;</span></a></div>

<div class="ugdetails">
<label class="uglabel">College*:</label></br></br>
<input class="clg" name="college" value="<%=college%>" type="text" placeholder="Ex: Banasthali University" required><hr></br>

<div class="uglabel">
<label>Year Of completion*:</label></br></br>
<input type="month" name="yoc" value="<%=yoc%>" style="margin-top:-12px;padding:3px"/>
<hr id="ugh01" style="width:100%"></br>
</div>

</br></br></br></br></br></br>

<div class="ugdeg">
<label class="uglabel">Program*:</label></br></br>
<select id="ugdeg" name="program" value="<%=program%>" style="margin-right:100px">
<option>---select---</option>
<option>Bachelor of Technology</option>
<option>Bachelor of Science</option>
<option>Bachelor of Computer Application</option>
</select>

<hr id="ugh01">
</div>
</br>
<button id="ugsave" type="submit" >SAVE</button>

<div class="ugstr" style="margin-top:-5px">
<label class="uglabel" style="margin-left:-182px">Stream:</label></br></br>
<select id="ugstr" name="stream" value="<%=branch%>" style="margin-right:100px;margin-left:27px" required>
<option>---select---</option>
<option>Computer Science</option>
<option>Information Technology</option>
</select>

<hr id="ugh01" style="margin-left:27px">
</div>
</br>

<div class="ugom">
<Label class="uglabel">Obtained Marks*:</Label></br></br>
<input type="text" id="ugom" name="obt_marks" value="<%=obt_marks%>" placeholder="Maximum obtained marks" required></br>
<hr id="ugh01">
</div>

 <div class="ugmm">
<Label class="uglabel">Maximum Marks*:</Label></br></br>
<input type="text" name="max_marks" value="<%=max_marks%>" id="ugmm" style="width:100%" placeholder="Maximum Marks"required></br>
<hr id="pgh01" style="width:100%">
 </div>
        <%
    }
stmt4.execute(); 
    
con.close();
}
catch(Exception e)
{
    out.print(e);
}
%>

</div>
</form>
</div>
</div>

</body>

</html>