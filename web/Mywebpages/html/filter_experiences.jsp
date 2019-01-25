<%@ page import="java.io.*,java.util.*"%>
<%@ page import="java.sql.*"%>

<html>

<head>
<%@ include file="Admin_header.html" %>	
</head>

<body>

<div id="alumni" style="margin-top: 13.6%">
    
<div class="row">

    <%
    try
    {
        Class.forName("com.mysql.jdbc.Driver");

        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/waftap","root","root");
    
        PreparedStatement stmt1=con.prepareStatement("select serial_no,name,intern,placed,experience from alumni_exp_admin where approved=? ");
    
        stmt1.setString(1,"no");
        
        ResultSet rs1=stmt1.executeQuery();
        
        while(rs1.next())
        {
            String serial_no=rs1.getString(1);
            String name=rs1.getString(2);
            String intern=rs1.getString(3);
            String placed=rs1.getString(4);
            String experience=rs1.getString(5);
        
        %>    
            
            <div class="content" style="border:2px solid black;padding-left: 15px;background-color: white">
                  
		  <p class="name" style="text-transform: capitalize;font-size:20px;font-family: Arial Rounded MT"><%=name%></p>
                  <p><b style="color:blue;font-size:17px;font-family: Arial Rounded MT">Intern:&emsp;</b><%=intern%></p>
                  <p><b style="color:blue;font-size:17px;font-family: Arial Rounded MT">Placed:&emsp;</b><%=placed%></p>
                  <div style="font-size:17px;font-family: Arial Rounded MT;"><%=experience%></div>
                  
                  <div class="button" style="padding-bottom:30px;padding-right: 30px">
                  <div class="add"><button onclick="<%session.setAttribute("serial_no",serial_no);%>" style="float:right;margin-left: 30px"><a href="approve_exp.jsp">ADD</a></button></div> 
                  <div class="discard"><button onclick="<%session.setAttribute("serial_no",serial_no);%>" style="float:right"><a href="discard_exp.jsp">DISCARD</a></button></div></div>
                </div>
            </div>
            </br></br>
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