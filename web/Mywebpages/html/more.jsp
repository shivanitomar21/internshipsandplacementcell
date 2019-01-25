<%@ page import="java.io.*,java.util.*"%>
<%@ page import="java.sql.*"%>

<html>

<head>
    <%@ include file="header.html" %>
    <link rel="stylesheet" type="text/css" href="../css/alumni_share_exp.css"> 
    <link rel="stylesheet" type="text/css" href="../css/home_alumni_more.css">  	
</head>

<body>

<script>
    document.getElementById('b05').style.backgroundColor='purple';
    document.getElementById('b05').style.color='white';
</script>  
    
<div id="alumni" >

<div class="row" style="margin-top: 8%">

    <%
    try
    {
        String s_no=request.getParameter("s_no");
               
        Class.forName("com.mysql.jdbc.Driver");

        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/waftap","root","root");
    
        PreparedStatement stmt1=con.prepareStatement("select name,intern,placed,experience,photo from alumni_exp_admin where serial_no=?");
    
        stmt1.setString(1,s_no);
        
        ResultSet rs1=stmt1.executeQuery();
        
        while(rs1.next())
        {
            String name=rs1.getString(1);
            String intern=rs1.getString(2);
            String placed=rs1.getString(3);
            String experience=rs1.getString(4);
            String photo=rs1.getString(5);
        %>    
             <div id="ncolumn" style="margin-top: 30px;padding-left: 23%;">
                <div id="ncard">
                
                        <div class="ncontent">
                            <div class="nprofile" style="height:10%">
                                <div id=close_alumni"><a href="student_experience_share.jsp"><span id="nclose" title="Close Modal">&times;</span></a></div>
                                    <p class="nname" style="text-transform: capitalize; font-size:20px;padding-left: 10px"><%=name%></p>
                                    <p style="font-size:17px"><b style="color:blue;padding-left: 10px">Intern:</b>&emsp;<%=intern%></p>
                                    <p style="font-size:17px"><b style="color:blue;padding-left: 10px">Placed:</b>&emsp;<%=placed%></br>
                                </div>
                                
                                <div class="words"> 
                                <p id="para" style="height:60%"><%=experience%></p>
                                </div>
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
   
</body>
</html>