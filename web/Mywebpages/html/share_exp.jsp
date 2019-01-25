<%@page import="java.sql.*"%>
<%@ page import="java.io.*,java.util.*"%>

<html>

<head>
    <%@ include file="header_student.jsp" %>
    <link rel="stylesheet" type="text/css" href="..\css\student_proforma.css">
    <script src="../js/student.js"></script>
    <script src="../js/fontawesome-all.js"></script>
</head>

<body>
    
<script>
        document.getElementById('b07').style.backgroundColor='purple';
        document.getElementById('b07').style.color='white';
</script> 

<div  style="padding-top: 12%;padding-left: 25%;width:50%">

<div id="pcontainer">
<form  action="upload_exp.jsp" method="post" enctype="multipart/form-data">
<p id="pheader" >Share Your Experience<span onclick="pclose()" id="pclose" title="Close Modal">&times;
</span></p>

<div id="info" style="padding-left:30px">
<div style="padding:25px">

<div class="pdetails">
    
    <%
       
    try
    {
        Class.forName("com.mysql.jdbc.Driver");

        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/waftap","root","root");
        
       
        PreparedStatement stmt1=con.prepareStatement("select f_name,l_name from signup where s_id=?");
        
        stmt1.setString(1,s_id);
    
        ResultSet rs1=stmt1.executeQuery();
      
        String f_name="",l_name="";     
        
        
        while(rs1.next())
        {
          f_name=rs1.getString(1);
          l_name=rs1.getString(2);
        }
        String name=f_name+" "+l_name;
        %>
        <%session.setAttribute("name",name);%>
        
        <Label id="pl01">Name:</Label>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
        <input id="pt01" type="text" name="name" value="<%=f_name%>&nbsp;<%=l_name%>"  style="cursor:not-allowed;background-color: lightgray;font-size: 15px;text-transform: capitalize;" required></br></br>
        <%

        PreparedStatement stmt2=con.prepareStatement("select c_id from intern_status where s_id13=?");
        
        stmt2.setString(1,s_id);
    
        ResultSet rs2=stmt2.executeQuery();
        
        int company_id=-1;
        
        while(rs2.next())
        {
            company_id=rs2.getInt(1);  
        }
  
        PreparedStatement stmt3=con.prepareStatement("select c_name,c_location from internship_company where c_id=?");
        
        stmt3.setInt(1,company_id);
    
        ResultSet rs3=stmt3.executeQuery();
        
        String c_name="";
        String c_location="";
        
        while(rs3.next())
        {
            c_name=rs3.getString(1);
            c_location=rs3.getString(2);
        }       
        String intern=c_name+" "+c_location;
        %>
        <%session.setAttribute("intern",intern);%>
        <Label id="pl01">Internship:</Label>&emsp;&emsp;&emsp;&emsp;&nbsp;&nbsp;
                <input id="pt02" type="text" name="intern" value="<%=c_name%>&nbsp;<%=c_location%>"  required style="cursor:not-allowed;background-color: lightgray;font-size: 15px"></br></br>
        <%
        
        PreparedStatement stmt4=con.prepareStatement("select company_id from placed_student where s_id12=?");
        
        stmt4.setString(1,s_id);
    
        ResultSet rs4=stmt4.executeQuery();
        
        int pc_id=-1;
        
        while(rs4.next())
        {
            pc_id=rs4.getInt(1);
            
        }
  
        PreparedStatement stmt5=con.prepareStatement("select c_name,c_location from placement_company where c_id=?");
        
        stmt5.setInt(1,pc_id);
    
        ResultSet rs5=stmt5.executeQuery();
        
        String pc_name="";
        String pc_location="";
        
        while(rs5.next())
        {
            pc_name=rs5.getString(1);
            pc_location=rs5.getString(2);
           
            String placed=pc_name+" "+pc_location;
            %>
                   <%session.setAttribute("placed",placed);%>
            <Label id="pl01">Placement:</Label>&emsp;&emsp;&emsp;&emsp;&nbsp;
            <input id="pt03" type="text" name="placed" value="<%=pc_name%>(<%=pc_location%>)"  style="cursor:not-allowed;background-color: lightgray;font-size: 15px" required/></br></br>
            </br>
            <%
        }       
       
        stmt5.execute();
        stmt4.execute();
        stmt3.execute();
        stmt2.execute();
        stmt1.execute();
        con.close();
    }catch(Exception e)
    {
        out.print(e);
    }
    %>
    
  
    
<textarea id="addesc" name="desc" rows="12" cols="70" placeholder="Share experience here (max 500 characters)." maxlength="500" required></textarea></br></br></br>


<button id="psubmit" type="submit" style="margin-top: -40px">Share</button>


</div>

</div>
</div>
</form>
</div>
</div>
</body>

</html>