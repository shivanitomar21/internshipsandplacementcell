<%@page import="java.sql.*"%>
<%@ page import="java.io.*,java.util.*"%>


<html>

<head>
        <%@ include file="header_student.jsp" %>
    <link rel="stylesheet" type="text/css" href="..\css\student_proforma.css">
    <script src="../js/student.js"></script>
</head>

<body>

<script>
        document.getElementById('b03').style.backgroundColor='purple';
        document.getElementById('b03').style.color='white';
</script>    
    
<div id="ptotal" style="padding-top: 12%;">

<div id="pcontainer">
<form  action="upload.jsp" method="post" enctype="multipart/form-data">
<p id="pheader">Proforma<span onclick="pclose()" id="pclose" title="Close Modal">&times;
</span></p>

<div id="info" style="padding-left:30px">
<div style="padding:25px">

<div class="pdetails">
    
<%
try
{   
    
    Class.forName("com.mysql.jdbc.Driver");

    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/waftap","root","root");
    
    PreparedStatement stmt1=con.prepareStatement("select f_name,l_name,program_id,branch_id from signup where s_id=?");
    
    stmt1.setString(1,s_id);
    
    ResultSet rs1=stmt1.executeQuery();
    
    
    while(rs1.next())
    {
       String f_name=rs1.getString(1);
       String l_name=rs1.getString(2);
       int pid=rs1.getInt(3);
       int bid=rs1.getInt(4);
       
       String pname="";
       String bname="";
       
        PreparedStatement stmt2=con.prepareStatement("select program_name from program_master where program_id=?");
          
        stmt2.setInt(1,pid);
         
        ResultSet rs2=stmt2.executeQuery();
        
        while(rs2.next())
        {
            pname=rs2.getString(1);
        }

        PreparedStatement stmt3=con.prepareStatement("select branch_name from branch_master where branch_id=?");
          
        stmt3.setInt(1,bid);
         
        ResultSet rs3=stmt3.executeQuery();
        
        while(rs3.next())
        {
            bname=rs3.getString(1);
        }
       
        %>

        
        <label id="pl01">Name:</label>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
        <input id="pt01" type="text" value="<%=f_name%>&nbsp;<%=l_name%>" style="cursor:not-allowed;background-color: lightgray;font-size: 15px;text-transform: capitalize;"></br></br>
     
        <Label id="pl01">Father's Name:</Label>&emsp;&emsp;&nbsp
        <input id="pt02" type="text" required style="font-size: 15px"></br></br>

        <Label id="pl01">Class:</Label>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&nbsp
        <input id="pt03" type="text" value="<%=pname%>(<%=bname%>)" style="background-color: lightgray;font-size: 15px" required/></br></br>

        <Label id="pl01">Smart Card ID:</Label>&emsp;&emsp;&nbsp;&nbsp;
        <input id="pt04" type="text" value="<%=s_id%>" style="cursor:not-allowed;background-color: lightgray;font-size: 15px"/></br></br>

        <Label id="pl01">Roll No.:</Label>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
        <input id="pt05" type="text" required style="font-size: 15px"/></br></br>

        <Label id="pl01">Aggregate:</Label>&emsp;&emsp;&emsp;&emsp;&nbsp;&nbsp;
        <input id="pt05" type="text" required style="font-size: 15px"/></br></br></br>
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

upload resume:<input type="file" name="fname"/><br/></br></br>

<%
try
{   
    Class.forName("com.mysql.jdbc.Driver");

    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/waftap","root","root");
    
    PreparedStatement stmt1=con.prepareStatement("select c_name from internship_company");
    
    ResultSet rs1=stmt1.executeQuery();
    
    int i=3;
    while(i!=0)
    {
    %>
   
    <select id="company" style="width:180px;height:30px" >
    <%
    while(rs1.next())
    {
       String c_name=rs1.getString(1);
       %>
       <option value="<%=c_name%>"><%=c_name%></option>
       <%
    }
    %>
    </select>
    <%
    i--;
    }

    stmt1.execute();
    con.close();
}
catch(Exception e)
{
    out.print(e);
}
%>

</br>
<button id="psubmit" type="submit">Apply</button>
</div>
</br>
</br>
</br>
</div>
</div>
</form>
</div>

</div>
</body>

</html>