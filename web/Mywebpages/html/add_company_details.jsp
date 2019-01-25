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
    
<style>
    
#myInput {
    background-image: url('/css/searchicon.png'); /* Add a search icon to input */
    background-position: 10px 12px; /* Position the search icon */
    background-repeat: no-repeat; /* Do not repeat the icon image */
    width: 100%; /* Full-width */
    font-size: 16px; /* Increase font-size */
    padding: 12px 20px 12px 40px; /* Add some padding */
    border: 1px solid #ddd; /* Add a grey border */
    margin-bottom: 12px; /* Add some space below the input */
}
#myTable {
    border-collapse: collapse; /* Collapse borders */
    width: 100%; /* Full-width */
    border: 1px solid #ddd; /* Add a grey border */
    font-size: 18px; /* Increase font-size */
}

#myTable th, #myTable td {
    text-align: left; /* Left-align text */
    padding: 12px; /* Add padding */
}

#myTable tr {
    /* Add a bottom border to all table rows */
    border-bottom: 1px solid #ddd; 
}

#myTable tr.header, #myTable tr:hover {
    /* Add a grey background color to the table header and on hover */
    background-color: #f1f1f1;
}

</style>

<script>
        document.getElementById('b05').style.backgroundColor='purple';
        document.getElementById('b05').style.color='white';
</script>    


    <div id="detail" style="float:left;border:1px solid black;z-index:-2;background-color: white;margin-left:5%">
 
        <p id="pheader">Company</p>
        
        <table id="myTable">
        <tr class="header">
        <th>Name</th>
        <th>Location</th>
        </tr>
<%
try
{   
    Class.forName("com.mysql.jdbc.Driver");
    
    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/waftap","root","root");
    
    PreparedStatement stmt1=con.prepareStatement("select co_id,co_name,co_location from company_placement");
    
    ResultSet rs1=stmt1.executeQuery();
    
    while(rs1.next())
    {
        int co_id=rs1.getInt(1);
        String c_name=rs1.getString(2);
        String c_location=rs1.getString(3);
       
        %>
        <tr>
        <td><%=c_name%></td>
        <td><%=c_location%>&emsp; &emsp;</td>
        </tr>
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
        </table>
  
    </div>

<div id="ptotal" style="margin-top: -4%;padding-left: 40%;">

<div id="pcontainer" style="z-index: -6">

    <form  action="add_company_details_db.jsp" method="post" enctype="multipart/form-data">
        <p id="pheader">Add Company Details<span onclick="document.getElementById('ptotal').style.display='none';document.getElementById('detail').style.display='none'" id="pclose" title="Close Modal">&times;
</span></p>

<div id="info" style="padding-left:30px">
<div style="padding:25px">

<div class="pdetails">
      
        <Label id="pl01">Company Name:</Label>&emsp;&emsp;&nbsp;
        <input id="pt03" type="text" name="name"  style="background-color: white;font-size: 15px" required/></br></br>
        
        <Label id="pl01">Company Location:</Label>&nbsp;&nbsp;&nbsp;
        <input id="pt03" type="text" name="location"  style="background-color: white;font-size: 15px" required/></br></br>
 
        <Label id="pl01">HR Email:</Label>&emsp;&emsp;&emsp;&emsp;&emsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <input id="pt03" type="email" name="email" style="background-color: white;font-size: 15px" required/></br></br>
        
        <Label id="pl01">HR Contact:</Label>&emsp;&emsp;&emsp;&nbsp;&emsp;&nbsp;&nbsp;
        <input id="pt03" type="tel" name="contact" style="background-color: white;font-size: 15px" required/></br></br></br>
        

        <textarea id="addesc" name="desc" rows="12" cols="70" placeholder="Add company details here (max 500 characters)." maxlength="500" required></textarea></br></br></br>
</br>

<button id="psubmit" type="submit">ADD</button>

</div></br></br></br>

</div>

</form>
</div>

</div>
</body>


</html>