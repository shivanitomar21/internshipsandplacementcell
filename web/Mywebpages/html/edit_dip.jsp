<%@page import="java.sql.*"%>
<%@ page import="java.io.*,java.util.*"%>


<html>
    
    <head>
            <%@ include file="header_student.jsp" %>
            <link rel="stylesheet" type="text/css" href="..\css\student_resume_edu_dip.css">
    </head>
    
<body>
 
<script>
        document.getElementById('b05').style.backgroundColor='purple';
        document.getElementById('b05').style.color='white';
</script>    
    
<%
try
{   
    String s_no=request.getParameter("s_no");
    
    Class.forName("com.mysql.jdbc.Driver");
    
    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/waftap","root","root");
    
    PreparedStatement stmt2=con.prepareStatement("select stream,college,yoc,max_marks,obt_marks from college_edu_dip where serial_no=?");
    
    stmt2.setInt(1,Integer.parseInt(s_no));
    
    ResultSet rs2=stmt2.executeQuery();
    
    while(rs2.next())
    {
        String stream=rs2.getString(1);
        String college=rs2.getString(2);
        String yoc=rs2.getString(3);
        int max_marks=rs2.getInt(4);
        int obt_marks=rs2.getInt(5);
        float percent=(float)(obt_marks)*100/max_marks;
        
  session.setAttribute("s_no",s_no);
        %>
<div id="diptotal">
<div class="dipcontainer">
<form action="update_dip_db.jsp">
<div class="dipheader">Diploma Details <a href="student_resume_edu.jsp"><span class="dipclose" title="close" style="color:white;font-weight:bold">&times;</span></a></div>

<div class="dipdetails">
<label class="diplabel">College*:</label></br></br>
<input class="dipclg" name="college" type="text" value="<%=college%>" placeholder="Ex: Banasthali University" required><hr></br>


<div class="diplabel">
<label>Year Of Completion*:</label></br></br>
<input type="month" name="yoc" value="<%=yoc%>" style="margin-top:-12px"/>
<hr id="diph01" style="width:100%"></br>
</div>
</br></br></br></br></br></br>


<div class="dipstr">
<label class="diplabel">Stream*:</label></br></br>
<input type="text" id="dipstr" name="stream" value="<%=stream%>" placeholder="Ex: Creative Writing" required></br>
<hr id="diph01" style="width:100%">
</div>
</br>


<div class="dipom">
<Label class="diplabel">Obtained Marks*:</Label></br></br>
<input type="text" name="obt_marks" value="<%=obt_marks%>" id="dipom" style="width:47%" placeholder="Maximum Marks Obtained" required></br>
<hr id="diph01">
</div>

 <div class="dipmm">
<Label class="diplabel">Maximum Marks*:</Label></br></br>
<input type="text" name="max_marks" value="<%=max_marks%>" id="dipmm" placeholder="Maximum Marks"required></br>
<hr id="diph01" style="width:100%">
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
    

<button id="dipsave" type="submit">SAVE</button>

</div>
</br>

</div>
</form>
</div>
</div> 

</body>

</html>