<%@ page import="java.io.*,java.util.*"%>
<%@ page import="java.sql.*"%>

<html>

<head>
    <%@ include file="header.html" %>
    <link rel="stylesheet" type="text/css" href="../css/alumni_share_exp.css"> 
    <link rel="stylesheet" type="text/css" href="../css/home_alumni_more.css">  	
</head>

<body>

<div id="alumni" style="margin-top: 12%">

<div class="row">

    <%
    try
    {
        Class.forName("com.mysql.jdbc.Driver");

        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/waftap","root","root");
    
        PreparedStatement stmt1=con.prepareStatement("select name,intern,placed,experience,s_id14,serial_no,photo from alumni_exp_admin where approved=?");
    
        stmt1.setString(1,"yes");
        
        ResultSet rs1=stmt1.executeQuery();
        
        int i=0;
        
        while(rs1.next())
        {
            i++;
            String name=rs1.getString(1);
            String intern=rs1.getString(2);
            String placed=rs1.getString(3);
            String experience=rs1.getString(4);
            String s_id=rs1.getString(5);
            int serial_no=rs1.getInt(6);
            String photo=rs1.getString(7);
        %>    
            <div class="column">
                <div class="card" style="height:22%" >
                   
                        <div  id="<%=serial_no%>" class="content">
                    
                        <p class="name" style="text-transform: capitalize;"><%=name%></p>
                        <p><b style="color:blue">Intern:&emsp;</b><%=intern%></p>
                        <p><b style="color:blue">Placed:&emsp;</b><%=placed%></p>
                        <button class="more" id="<%=serial_no%>" style="width:100%;background-color: springgreen;font-size: 17px;padding-top: 5px;border:none" onclick="db(this.id);">more</button>
                        
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
                 
                 window.location.replace("more.jsp?s_no="+id);
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