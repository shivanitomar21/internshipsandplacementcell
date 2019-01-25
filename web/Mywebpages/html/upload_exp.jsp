<%@page import="java.sql.*"%>
<%@ page import="java.io.*,java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="org.apache.commons.fileupload.servlet.ServletFileUpload" %>
<%@ page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@ page import="org.apache.commons.fileupload.*"%>
<%@ page import="java.util.Iterator"%>
<%@ page import="java.util.List"%>
<%@ page import="java.io.File"%>
<%
try
{
String s_id=(String)session.getAttribute("uid");
   
    String name="";
    
    String intern="";
     
    String placed="";
      
    String photo="";
    String desc="";
    
boolean isMultipart = ServletFileUpload.isMultipartContent(request);
if (!isMultipart)
{
}
else
{
FileItemFactory factory = new DiskFileItemFactory();
ServletFileUpload upload = new ServletFileUpload(factory);
List items = null;
try
{
items = upload.parseRequest(request);
System.out.println("items are "+items);
}
catch (FileUploadException e)
{
e.getMessage();
}
 
Iterator itr = items.iterator();
while (itr.hasNext())
{
FileItem item = (FileItem) itr.next();
if(item.isFormField())
{
    
    
    if(item.getFieldName().equals("name"))
    name=item.getString();
    
    if(item.getFieldName().equals("intern"))
    intern=item.getString();
    
    if(item.getFieldName().equals("placed"))
    placed=item.getString();
    
    if(item.getFieldName().equals("desc"))
    desc=item.getString();
    
    
}
else{
try
{
photo= item.getName();
System.out.println("here is"+photo);
File savedFile = new File("C:"+File.separator+"Users"+File.separator+"Pragati"+File.separator+"Desktop"+File.separator+"Project"+File.separator+"web"+File.separator+"Image"+File.separator+photo);
//File savedFile = new File("D:"+File.separator+"imgs"+File.separator+itemName);
System.out.println("here we go "+savedFile);
item.write(savedFile);

}
catch (Exception e)
{
out.println("Error"+e.getMessage());
}
}
}
}
try{      
    

    Class.forName("com.mysql.jdbc.Driver");
    
    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/waftap","root","root");
    
    PreparedStatement stmt1=con.prepareStatement("insert into alumni_exp_admin (serial_no,s_id14,name,intern,placed,experience,photo,approved,submit) values(?,?,?,?,?,?,?,?,?)");
    
    stmt1.setInt(1,0);
    
    stmt1.setString(2,s_id);
    
    stmt1.setString(3,name);
 
    stmt1.setString(4,intern);
    
    stmt1.setString(5,placed);
    
    stmt1.setString(6,desc);
    
    stmt1.setString(7,photo);
    
    stmt1.setString(8,"no");
    
    stmt1.setString(9,"yes");
    
    stmt1.execute();
    
con.close();
session.setAttribute("status","submitted");
%>
        
      
        <jsp:forward page="share_exp.jsp"/>
       
<%
}
catch(Exception e)
{
    out.print(e);
}
}
catch (Exception e){
out.println(e.getMessage());
}
%>