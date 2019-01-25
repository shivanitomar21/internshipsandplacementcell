<%@page import="java.sql.*"%>
<%@ page import="java.io.*,java.util.*"%>


<html>
    
    <head>
            <%@ include file="header_student.jsp" %>
            <link rel="stylesheet" type="text/css" href="..\css\student_resume_edu_XII.css">
    </head>
    
<body>
 
<script>
        document.getElementById('b05').style.backgroundColor='purple';
        document.getElementById('b05').style.color='white';
</script>    
    
<script>
        document.getElementById('b05').style.backgroundColor='purple';
        document.getElementById('b05').style.color='white';
</script>

    <%
try
{   
    Class.forName("com.mysql.jdbc.Driver");
    
    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/waftap","root","root");
    
   
    PreparedStatement stmt5=con.prepareStatement("select s_class,stream,yop,board,school,max_marks,obt_marks from school_edu_xii where s_id8=?");
    
    stmt5.setString(1,s_id);
    
    ResultSet rs5=stmt5.executeQuery();
    
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
            <div id="XIItotal">
            <div class="XIIcontainer">
            <form action="update_XII_db.jsp">
            <div class="XIIheader">XII(Senior Secondary) Details <a href="student_resume_edu.jsp"><span class="VIIclose" title="close" style="color:white;font-weight:bold;float:right;padding-right:10px">&times;</span></a></div>

            <div class="XIIdetails">
            <label class="XIIlabel">School*:</label></br></br>
            <input class="XIIscl" type="text" name="school" value="<%=school%>" placeholder="Ex: Delhi Public School" required><hr></br>

            <div class="XIIlabel">
            <label class="XIIlabel">Year Of Passing*:</label></br></br>
            <input type="month" name="yop" value="<%=yop%>" style="margin-top:-12px;padding:3px"/>
            <hr id="XIIh01" style="width:100%"></br>
            </div>

            </br></br></br></br></br></br>
           
            <div class="XIIboard">
            <label class="XIIlabel">Board*:</label></br></br>

            <select id="XIIboard" value="<%=board%>" name="board" style="margin-right:100px">
            <option>CBSE</option>
            <option>ICSE</option>
            <option>State Board</option>
            <option>Other</option>
            </select>

            <hr id="XIIh01">
            </div>
            </br>
            
            <button id="XIIsave" type="submit">SAVE</button>


            <div class="XIIstr" style="margin-top:-5px">
            <label class="XIIlabel" style="margin-left:-182px">Stream:</label></br></br>
            <input type="text" id="XIIstr" name="stream" value="<%=stream%>" style="margin-left:27px" placeholder="Ex: Computer Science" required></br>
            <hr id="XIIh01" style="margin-left:27px;">
            </div>
            </br>

            <div class="XIIom">
            <label class="XIIlabel">Obtained Marks*:</Label></br></br>
            <input type="text" id="XIIom" name="obt_marks" value="<%=obt_marks%>" style="width:47%" placeholder="Maximum Marks Obtained" required></br>
            <hr id="XIIh01">
            </div>

            <div class="XIImm">
            <label class="XIIlabel">Maximum Marks*:</Label></br></br>
            <input type="text" name="max_marks" value="<%=max_marks%>"  id="XIImm" placeholder="Maximum Marks"required></br>
            <hr id="XIIh01" style="width:100%">
            </div>

        <%
    }
stmt5.execute();

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