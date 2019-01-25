<%@ page import="java.io.*,java.util.*"%>
<%@ page import="java.sql.*"%>

<html>

<head>
    <%@ include file="header_student.jsp" %>
    <link rel="stylesheet" type="text/css" href="../css/alumni_share_exp.css"> 
    <link rel="stylesheet" type="text/css" href="../css/home_alumni_more.css">  	
</head>

<body>

<script>
        document.getElementById('b06').style.backgroundColor='purple';
        document.getElementById('b06').style.color='white';
</script>  

<div id="alumni" >

<div class="row" style="margin-top: 12%">

    <%
    try
    {
        Class.forName("com.mysql.jdbc.Driver");

        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/waftap","root","root");
    
        PreparedStatement stmt1=con.prepareStatement("select co_name,co_location,description,co_id,photo from company_placement");
    
        ResultSet rs1=stmt1.executeQuery();
        
        int i=0;
        
        while(rs1.next())
        {
            i++;
            String name=rs1.getString(1);
            String location=rs1.getString(2);
            String description=rs1.getString(3);
            int co_id=rs1.getInt(4);
            String photo=rs1.getString(5);
            
        %>    
            <div class="column">
                <div class="card" style="height:10%">
                   
                       <div  id="<%=co_id%>" class="content">
                         
                        <p class="name" style="text-transform: capitalize;"><%=name%>&nbsp(<%=location%>)</p>
                         <button class="more" id="<%=co_id%>" onclick="db(this.id);" style="width:100%;background-color: springgreen;font-size: 17px;padding-top: 5px;border:none">More Information</button>
                        </div>
                </div>
            </div>          
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
	     
</div>
</div>
        <script>
             
             function db(click_id)
             {
                 var id=click_id;
                 
                 window.location.replace("morecompany.jsp?co_id="+id);
             }
            // Click on a close button to hide the current list item
            var more = document.getElementsByClassName("more");
            var i;
            for (i = 0; i < more.length; i++) {
                
            var more_id=this.id;
            close[more_id].onclick = function() {
            document.getElementById('more_id').style.backgroundColor="red";   
            var id1=this.parentElement.id;
            
            window.location.replace("test.jsp?serial_no="+id1);                        
           
            }
            }
        </script>
</body>
</html>