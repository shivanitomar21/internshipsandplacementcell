<%@page import="java.sql.*"%>
<%@ page import="java.io.*,java.util.*"%>

<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
* {
  box-sizing: border-box;
}

#myInput {
  background-image: url('../css/searchicon.png');
  background-position: 10px 10px;
  background-repeat: no-repeat;
  width: 100%;
  font-size: 16px;
  padding: 12px 20px 12px 40px;
  border: 1px solid #ddd;
  margin-bottom: 12px;
}

#myTable {
  border-collapse: collapse;
  width: 100%;
  border: 1px solid #ddd;
  font-size: 18px;
}

#myTable th, #myTable td {
  text-align: left;
  padding: 12px;
}

#myTable tr {
  border-bottom: 1px solid #ddd;
}

#myTable tr.header, #myTable tr:hover {
  background-color: #f1f1f1;
}
</style>
</head>
<body>

<h2>Student Proformas List</h2>

<input type="text" id="myInput" onkeyup="myFunction()" placeholder="Search for company names.." title="Type in a name">

<table id="myTable">
    
  <tr class="header">
      
    <th style="width:12%;border-right: 1px solid gray;text-align: center">Smart card Id</th>
    <th style="width:12%;border-right: 1px solid gray;text-align: center">Name</th>    
    <th style="width:12%;border-right: 1px solid gray;text-align: center">Father's Name</th>  
    <th style="width:12%;border-right: 1px solid gray;text-align: center">Program</th>     
    <th style="width:12%;border-right: 1px solid gray;text-align: center">Preference 1</th>
    
    <th style="width:12%;border-right: 1px solid gray;text-align: center">Preference 2</th>
    <th style="width:12%;border-right: 1px solid gray;text-align: center">Preference 3</th>
    <th style="width:12%;border-right: 1px solid gray;text-align: center">Aggregate</th>
    <th style="width:12%;border-right: 1px solid gray;text-align: center">Resume</th>
    
  </tr>
  
<%
try
{   
    Class.forName("com.mysql.jdbc.Driver");
    
    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/waftap","root","root");

    PreparedStatement stmt3=con.prepareStatement("select s_id15,name,father_name,program,pre1,pre2,pre3,aggregate,resume from student_proforma order by aggregate desc");
    
    ResultSet rs3=stmt3.executeQuery();
    
    while(rs3.next())
    {
        String s_id=rs3.getString(1);
        String name=rs3.getString(2);
        String father=rs3.getString(3);
        String program=rs3.getString(4);
        String pre1=rs3.getString(5);
        String pre2=rs3.getString(6);
        String pre3=rs3.getString(7);
        float aggregate=rs3.getFloat(8);
         String resume=rs3.getString(9);
       
    %>
    <tr>
        
    <td style="border-right: 1px solid gray"><%=s_id%></td>
    <td style="border-right: 1px solid gray"><%=name%></td>
    <td style="border-right: 1px solid gray"><%=father%></td>
    <td style="border-right: 1px solid gray"><%=program%></td>
    <td style="border-right: 1px solid gray"><%=pre1%></td>
    <td style="border-right: 1px solid gray"><%=pre2%></td>
    <td style="border-right: 1px solid gray"><%=pre3%></td>
    <td style="border-right: 1px solid gray"><%=aggregate%></td>
    <td style="border-right: 1px solid gray"><a href="../resume/<%=resume%>" download><%=resume%></a></td>
    
    </tr>
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

</table>

<script>
function myFunction()
{    
  var input, filter, table, tr, td,td1,td2, i;
  input = document.getElementById("myInput");
  filter = input.value.toUpperCase();
  table = document.getElementById("myTable");
  tr = table.getElementsByTagName("tr");
  
  for (i = 0; i < tr.length; i++) {
          
    td = tr[i].getElementsByTagName("td")[5];
    td1 = tr[i].getElementsByTagName("td")[6];
     td2 = tr[i].getElementsByTagName("td")[7];
    if (td) {
      if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {
        tr[i].style.display = "";
      } else {
        tr[i].style.display = "none";
   
            
       if (td1) {
            if (td1.innerHTML.toUpperCase().indexOf(filter) > -1) {
            tr[i].style.display = "";
            }   else {
                    tr[i].style.display = "none";
               
                   
                   if (td2) {
                    if (td2.innerHTML.toUpperCase().indexOf(filter) > -1) {
                    tr[i].style.display = "";
                    } else {
                    tr[i].style.display = "none";
                    }
                   }
                  }
            }
            }
        }
       }
    }
                 
 

</script>

</body>

<!-- Mirrored from www.w3schools.com/howto/tryit.asp?filename=tryhow_js_filter_table by HTTrack Website Copier/3.x [XR&CO'2014], Tue, 16 Jan 2018 18:41:12 GMT -->
</html>
