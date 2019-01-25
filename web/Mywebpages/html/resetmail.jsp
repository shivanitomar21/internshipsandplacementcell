<%@page import="java.sql.*"%>
<%@ page import="java.io.*,java.util.*"%>



<html>
<head>
    <%@ include file="Admin_header.html" %>
	<link rel="stylesheet" type="text/css" href="..\css\programMaster.css">
    <link rel="stylesheet" type="text/css" href="..\css\admin.css">
    <link rel="stylesheet" type="text/css" href="..\css\admin_career.css">
	
    <script src="../js/admin.js"></script>
	<script src="../js/program.js"></script>	
	
</head>

<body>

<div id="maindiv">
	<div id="li01" class="lmodal">
	<form id="lmodal-content animate"  action="reset_pwd.jsp" method="post">
		<div class="limg_container">
		<div id="top"><span onclick="closelog()" id="lclose" title="Close Modal">
		&times;</span></div>
	<br><br><br>	




<%
        String email=request.getParameter("email");
        
        try
        {   
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/waftap","root","root");
    			
            PreparedStatement stmt=con.prepareStatement("select s_que,e_mail from signup where e_mail=?");
            stmt.setString(1,email);
            ResultSet rs = stmt.executeQuery();
            
            if(rs.next())
            {%>

            
<label id="ll01">Email Id</label></br><br>
<input type="text"  name="email" id="lt02"   value="<%=rs.getString(2)%>"></br></br><br>            
<label id="ll01">Security Question</label></br><br>
<input type="text"  name="s_que" id="lt02" disabled  value="<%=rs.getString(1)%>"></br></br><br>
<label id="ll01">Security Answer</label></br><br>
<input type="text"  placeholder="Enter Security Answer" name="s_ans" id="lt03" required></br></br><br>

<button type="submit"  id="delbtn" class="log">Next</button></br></br>

            <%
            }
            stmt.close();
            con.close();
	}
	catch(Exception e)
	{
            e.printStackTrace();
	}
	
    %>
    </div>
</form>
</div>
</div>
</body>
</html>