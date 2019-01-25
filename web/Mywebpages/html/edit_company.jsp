<%@page import="java.sql.*"%>
<%@ page import="java.io.*,java.util.*"%>


<html>

<head>
    <%@ include file="Admin_header.html" %>
    <link rel="stylesheet" type="text/css" href="..\css\student_proforma.css">
    <script src="../js/student.js"></script>
        <script src="../js/fontawesome-all.js"></script>
</head>

<body>


<script>
        document.getElementById('b05').style.backgroundColor='purple';
        document.getElementById('b05').style.color='white';
</script>    



<div id="ptotal" style="padding-top: 12%">

<div id="pcontainer">

    <form  action="update_company_details.jsp" method="post" enctype="multipart/form-data">
        <p id="pheader">Edit Company Details<a href="add_company_details.jsp"><span id="pclose" title="Close Modal">&times;
                </span></a></p>

<div id="info" style="padding-left:30px">
<div style="padding:25px">

<div class="pdetails">
       <%
           String c_id=request.getParameter("c_id");
           session.setAttribute("c_id",c_id);
try
{   
    Class.forName("com.mysql.jdbc.Driver");
    
    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/waftap","root","root");
    
    PreparedStatement stmt1=con.prepareStatement("select co_name,co_location,hr_email,hr_contact,description from company_placement where co_id=?");
    stmt1.setInt(1,Integer.parseInt(c_id));
    ResultSet rs1=stmt1.executeQuery();
    
    while(rs1.next())
    {
        
        String c_name=rs1.getString(1);
        String c_location=rs1.getString(2);
        String hr_mail=rs1.getString(3);
        String hr_contact=rs1.getString(4);
        String desc=rs1.getString(5);
        
       
        %>
       
          
        <Label id="pl01">Company Name:</Label>&emsp;&emsp;&nbsp;
        <input id="pt03" type="text" name="name" value="<%=c_name%>" style="background-color: white;font-size: 15px" required /></br></br>
        
        <Label id="pl01">Company Location:</Label>&nbsp;&nbsp;&nbsp;
        <input id="pt03" type="text" name="location"  value="<%=c_location%>" style="background-color: white;font-size: 15px" required/></br></br>
        
        <Label id="pl01">HR Email:</Label>&emsp;&emsp;&emsp;&emsp;&emsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <input id="pt03" type="email" name="Email"  value="<%=hr_mail%>" style="background-color: white;font-size: 15px" required/></br></br>
        
        <Label id="pl01">HR Contact:</Label>&emsp;&emsp;&emsp;&nbsp;&emsp;&nbsp;&nbsp;
        <input id="pt03" type="tel" name="contact"  value="<%=hr_contact%>" style="background-color: white;font-size: 15px" required/></br></br></br>
        
        <textarea id="addesc" name="desc" value="<%=desc%>" rows="12" cols="70" placeholder="Add company details here (max 500 characters)." maxlength="500" required></textarea></br></br></br>
</br>

<button id="psubmit" type="submit" >EDIT</button>
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
</div></br></br></br>

</div>

</form>
</div>

</div>
</body>

</html>