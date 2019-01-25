<%@page import="java.sql.*"%>
<%@ page import="java.io.*,java.util.*"%>

<%
try{
    int i=0;
    int p_id=0,b_id=0;
    
        String sid=request.getParameter("sid");
        
        String fname=request.getParameter("fname");
    
        String lname=request.getParameter("lname");
      
        String pass=request.getParameter("pass");
        
        String dob=request.getParameter("dob");
        
        String program=request.getParameter("program");
        
        String branch=request.getParameter("branch");
          
        String email=request.getParameter("email");
        
        String contact_no=request.getParameter("contact_no");
        
        String address=request.getParameter("address");
          
        String city=request.getParameter("city");
      
        String state=request.getParameter("state");
        
        String pin=request.getParameter("pin");
          
        String nationality=request.getParameter("nationality");

        String s_que=request.getParameter("s_que");
        
        String s_ans=request.getParameter("s_ans");
          
           
    Class.forName("com.mysql.jdbc.Driver");
    
    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/waftap","root","root");
 
    PreparedStatement stmt1=con.prepareStatement("select program_id from program_master where program_name=?");
    
    stmt1.setString(1,program);
    
    ResultSet rs1=stmt1.executeQuery();
    
    while(rs1.next())
    {
       i=1;
       p_id=rs1.getInt(1);
    }
    
    if(i!=1)
    {
        PreparedStatement stmt4=con.prepareStatement("insert into program_master values(?,?)");
        
        stmt4.setInt(1,0);
        stmt4.setString(2,program);
        stmt4.execute();
        
        PreparedStatement stmt5=con.prepareStatement("select program_id from program_master where program_name=?");
    
        stmt5.setString(1,program);
    
        ResultSet rs5=stmt5.executeQuery();
    
        while(rs5.next())
        {
            p_id=rs5.getInt(1);
        }
            
    }
    i=0;
    PreparedStatement stmt2=con.prepareStatement("select branch_id from branch_master where branch_name=?");
    
    stmt2.setString(1,branch);
    
    ResultSet rs2=stmt2.executeQuery();
    
    while(rs2.next())
    {
       i=1;
       b_id=rs2.getInt(1);
    }

    if(i!=1)
    {
        PreparedStatement stmt6=con.prepareStatement("insert into branch_master values(?,?)");
        
        stmt6.setInt(1,0);
        stmt6.setString(2,branch);
        stmt6.execute();
        
        PreparedStatement stmt7=con.prepareStatement("select branch_id from branch_master where branch_name=?");
    
        stmt7.setString(1,branch);
    
        ResultSet rs7=stmt7.executeQuery();
    
        while(rs7.next())
        {
            b_id=rs7.getInt(1);
        }
            
    }
    
    PreparedStatement stmt3=con.prepareStatement("insert into signup (s_id,f_name,l_name,password,program_id,branch_id,dob,contact_no,address,city,state,pincode,nationality,e_mail,s_que,s_ans) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
    
    stmt3.setString(1,sid);
    stmt3.setString(2,fname);
 
    stmt3.setString(3,lname);
    stmt3.setString(4,pass);
    
    stmt3.setInt(5, p_id);
    stmt3.setInt(6,b_id);
    
    stmt3.setString(7,dob);
    stmt3.setString(8,contact_no);
    
    stmt3.setString(9,address);
    stmt3.setString(10,city);
    
    stmt3.setString(11,state);
    stmt3.setString(12,pin);
   
    stmt3.setString(13,nationality);
    stmt3.setString(14,email);
    
    stmt3.setString(15,s_que);
    stmt3.setString(16,s_ans);
    
stmt3.execute();
con.close();
%>
       <script> window.confirm("Registration successful !!!");</script>
        <jsp:forward page="header.html"/>
        window.confirm("Registration successful !!!");
<%
}
catch(Exception e)
{
    out.print(e);
}
%>