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
	
		<div class="limg_container">
		<div id="top"><span onclick="closelog()" id="lclose" title="Close Modal">
		&times;</span></div>
	<br><br><br>	
        
        
<%
    String email=request.getParameter("email");
    String ans=request.getParameter("s_ans");
    
    
    
    try
        {   
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/waftap","root","root");
    			
            PreparedStatement stmt=con.prepareStatement("select s_ans from signup where e_mail=?");
            stmt.setString(1,email);
            ResultSet rs = stmt.executeQuery();
            
            
            if(rs.next())
            {
                if(ans.equals(rs.getString(1)))
                {
                    %>
          <form id="lmodal-content animate"  action="update_pwd.jsp" method="post">          
 <label id="ll01">Email Id</label></br><br>
<input type="text"  name="email" id="lt02"   value="<%=email%>"></br></br><br>               
<label id="ll01">New Password</label></br><br>
<input type="password" placeholder="Enter password" name="pwd" id="lt01" required></br></br><br>
<label id="ll01">Confirm Password</label></br><br>
<input type="password" placeholder="Confirm Password" name="c_pwd" id="lt01" required></br></br><br>
<button type="submit"  id="delbtn" class="log">Submit</button></br></br>

                <%
                }
               else
                {%>
                <h3 style="margin-left: 180px"> Answer not matched</h3><br><br>
                        
                   <%
                 }
            }
        }
    catch(Exception e)
    {
        out.println(e.toString());
    }
                
            
            
            
%>

          </form>
</div>
</div>
</div>
</body>
</html>