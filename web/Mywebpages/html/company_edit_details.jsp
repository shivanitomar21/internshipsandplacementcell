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

<div id="detail" style="float:left;border:1px solid black;z-index:-2;margin-left:35%;background-color: white">
 
        <p id="pheader">Company</p>
        <input type="text" id="myInput" onkeyup="myFunction()" placeholder="Search for company names..">
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
        <td><%=c_location%>&emsp; &emsp;&emsp;&emsp;<span style="float:right"><a id="<%=co_id%>" onclick="edit(this.id)"><i class="fa fa-edit" style="color:gray"></i></a> &nbsp&nbsp <a id="<%=co_id%>" onclick="deletec(this.id)"><i class="fa fa-trash" style="color:gray"></i></a> </span></td>
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
</body>
<script>
function myFunction() {
  // Declare variables 
  var input, filter, table, tr, td, i;
  input = document.getElementById("myInput");
  filter = input.value.toUpperCase();
  table = document.getElementById("myTable");
  tr = table.getElementsByTagName("tr");

  // Loop through all table rows, and hide those who don't match the search query
  for (i = 0; i < tr.length; i++) {
    td = tr[i].getElementsByTagName("td")[0];
    if (td) {
      if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {
        tr[i].style.display = "";
      } else {
        tr[i].style.display = "none";
      }
    } 
  }
}

function edit(id)
{
    var id=id;
    window.location.replace("edit_company_details.jsp?c_id="+id);
}
function deletec(id)
{
    var id=id;
    window.location.replace("delete_company.jsp?c_id="+id);
}
</script>


</html>