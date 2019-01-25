<%@page import="java.sql.*"%>
<%@ page import="java.io.*,java.util.*"%>

<html>

<head>
    <%@ include file="header_student.jsp" %>
	<link rel="stylesheet" type="text/css" href="..\css\student_resume_skills.css">
        <script src="../js/student.js"></script>
</head>

<body>
    
<script>
        document.getElementById('b05').style.backgroundColor='purple';
        document.getElementById('b05').style.color='white';
</script>

<div id="sktotal">
<div class="skcontainer">
    <form action="skills_db_new.jsp">
<div class="skheader">Skills</div>
<div class="skdetails">
<p>
        
<%
try
{   
    int skill_id=0;
    
    Class.forName("com.mysql.jdbc.Driver");

    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/waftap","root","root");
    
    PreparedStatement stmt1=con.prepareStatement("select skill_id from student_skill where s_id7=?");
    
    stmt1.setString(1,"BTBTC15127");
    
    ResultSet rs1=stmt1.executeQuery();
    
    while(rs1.next())
    {
        skill_id=rs1.getInt(1);
    
        PreparedStatement stmt2=con.prepareStatement("select skill_name from skill_master where skill_id=?");
   
        stmt2.setInt(1,skill_id);
    
        ResultSet rs2=stmt2.executeQuery();
        
        %>
        <ul>
        <%
        while(rs2.next())
        {
            String s_name=rs2.getString(1);
            
          //  int skl_id=Integer.parseInt("skill_id");
            
            %>
            <li id="<%=skill_id%>" style="margin-top: 20px;"><%=s_name%>&nbsp;&emsp;</li>
            <!-- <span id="abcde" style="margin-top: 20px;" value="&nbsp&nbsp&nbsp&nbsp<a href="delete_skill_db.jsp"><span id=" >&times;</span></a></span>&nbsp&nbsp&nbsp-->
            <%
        }
        
        %>
        </ul>
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
        <script>
            
            // Create a "close" button and append it to each list item
            var myNodelist = document.getElementsByTagName("LI");
            var i;

            for (i = 0; i < myNodelist.length; i++) {
            var span = document.createElement("SPAN");
            var txt = document.createTextNode("\u00D7");
            span.className = "close";
            span.appendChild(txt);
            myNodelist[i].appendChild(span);
            }

            // Click on a close button to hide the current list item
            var close = document.getElementsByClassName("close");
            var i;
            for (i = 0; i < close.length; i++) {
            close[i].onclick = function() {
               
            var id1=this.parentElement.id;
            window.location.replace("delete_skill_db_new.jsp?skill="+id1);                        
           
            }
            }
        </script>
        
       
<p id="skp01">What Skills do you have?</p>
</br>

<%
try
{   
    Class.forName("com.mysql.jdbc.Driver");
    
    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/waftap","root","root");
    
    PreparedStatement stmt1=con.prepareStatement("select skill_name from skill_master");
   
    ResultSet rs1=stmt1.executeQuery();
     %>
        <input type="text" oninput="enable()" name="skill" list="skill" id="ski01" style="text-transform:capitalize" placeholder="Ex: Adobe Photoshop" >&emsp;&emsp;<hr>
        <datalist id="skill"  style="width:34%">
       <%
        while(rs1.next())
        {
            String p_name=rs1.getString(1);
       %>
            <option value="<%=p_name%>"><%=p_name%></option>
       <%
    }
    %>
  </datalist>
  <%
    
stmt1.execute();
con.close();
}
catch(Exception e)
{
    out.print(e);
}
%>

</br></br>
<a id="skprev" href="student_resume_oexp.jsp">PREVIOUS</a>

<button type="submit" id="adsave" style="margin-left:140px" >SAVE</button>

<a id="skskip" href="student_resume_additional.jsp">SKIP</a>

</div>
</form>
</div>
</div>
</body>
</html>