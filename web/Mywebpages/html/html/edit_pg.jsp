<%@page import="java.sql.*"%>
<%@ page import="java.io.*,java.util.*"%>


<html>
    
    <head>
            <%@ include file="header_student.jsp" %>
            <link rel="stylesheet" type="text/css" href="..\css\student_resume_edu_pg.css">
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
            <div id="pgtotal">
            <div class="pgcontainer">
            <form action="update_pg_db.jsp" id="pgform">
            <div class="pgheader">Post Graduation Details <a href="student_resume_edu.jsp"><span class="pgclose" title="close" style="color:white;font-weight:bold">&times;</span></a></div>

            <div class="pgdetails">
            <label class="pglabel">College*:</label></br></br>
            <input class="pgclg" name="college" value="<%=college%>" type="text" placeholder="Ex: Banasthali University" required><hr></br>

            <div class="pglabel">
            <label>Year Of Completion*:</label></br></br>
            <input type="month" name="yoc" value="<%=yoc%>" style="margin-top:-12px"/>
            <hr id="pgh01" style="width:100%"></br>
            </div>

            </br></br></br></br></br></br>

            <div class="pgdeg">
            <label class="pglabel">Program*:</label></br></br>
            <select id="pgdeg" name="program" value="<%=program%>" style="margin-right:100px">
            <option>---select---</option>
            <option>Master of Technology</option>
            <option>Master of Science</option>
            <option>Master of Computer Application</option>
            </select>
            <hr id="pgh01">
            </div>
            </br>


            <button id="pgsave" type="submit">SAVE</button>


            <div class="pgstr" style="margin-top:-5px">
            <label class="pglabel" style="margin-left:-182px">Stream:</label></br></br>
            <select id="pgstr" name="stream" value="<%=branch%>" style="margin-right:100px;margin-left:27px" required>
            <option>---select---</option>
            <option>Computer Science</option>
            <option>Information Technology</option>
            </select>

            <hr id="pgh01" style="margin-left:27px">
            </div>
            </br>

            <div class="pgom">
            <Label class="pglabel">Obtained Marks*:</Label></br></br>
            <input type="text" name="obt_marks" value="<%=obt_marks%>" id="pgom" style="width:47%" placeholder="Maximum Marks Obtained" required></br>
            <hr id="pgh01">
            </div>

            <div class="pgmm">
            <Label class="pglabel">Maximum Marks*:</Label></br></br>
            <input type="text" name="max_marks" value="<%=max_marks%>" id="pgmm" placeholder="Maximum Marks"required></br>
            <hr id="pgh01" style="width:100%">
            </div>
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
</form>
</div>
</div>
  
</body>

</html>