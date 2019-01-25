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

<div id="alumni">

<div class="row" style="margin-top: 8%">

    <%
    try
    {
        String co_id=request.getParameter("co_id");
               
        Class.forName("com.mysql.jdbc.Driver");

        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/waftap","root","root");
    
        PreparedStatement stmt1=con.prepareStatement("select co_name,co_location,description,photo from company_placement where co_id=?");
    
        stmt1.setInt(1,Integer.parseInt(co_id));
        
        ResultSet rs1=stmt1.executeQuery();
        
        while(rs1.next())
        {
            String name=rs1.getString(1);
            String location=rs1.getString(2);
            String desc=rs1.getString(3);
            String photo=rs1.getString(4);
           
        %>    
             <div id="ncolumn" style="margin-top: 30px;padding-left: 23%;">
                <div id="ncard">
                
                        <div class="ncontent">
                            <div class="nprofile" style="height:10%">
                                <div id=close_alumni"><a href="com.jsp"><span id="nclose" title="Close Modal">&times;</span></a></div>
                                    <p class="nname" style="text-transform: capitalize;font-size: 21px;padding-left: 10px"><%=name%></p>
                                    <p style="font-size:17px"><b style="color:blue;padding-left: 10px">Location:</b>&emsp;<%=location%></p>
                                   
                                </div>
                                
                                <div class="words"> 
                                <p id="para" style="height:60%"><%=desc%></p>
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