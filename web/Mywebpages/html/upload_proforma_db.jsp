<%@page import="java.sql.*"%>
<%@ page import="java.io.*,java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="org.apache.commons.fileupload.servlet.ServletFileUpload" %>
<%@ page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@ page import="org.apache.commons.fileupload.*"%>
<%@ page import="java.util.Iterator"%>
<%@ page import="java.util.List"%>
<%@ page import="java.io.File"%>
<%@ include file="getcon.jsp"%>


<%
try
{
String s_id="";
String name="";
String fathername="";
String class1="";

String aggregate="";

String resume = "";
String pre1="";
String pre2="";
String pre3="";
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
    if(item.getFieldName().equals("s_id"))
    s_id=item.getString();
    
    if(item.getFieldName().equals("name"))
    name=item.getString();
    
    if(item.getFieldName().equals("father"))
    fathername=item.getString();
    
    if(item.getFieldName().equals("program"))
    class1=item.getString();
    
    if(item.getFieldName().equals("aggregate"))
    aggregate=item.getString();
    
    if(item.getFieldName().equals("pre1"))
    pre1=item.getString();
    
    if(item.getFieldName().equals("pre2"))
    pre2=item.getString();
    
    if(item.getFieldName().equals("pre3"))
    pre3=item.getString();
}
else{
try
{
resume = item.getName();
System.out.println("here is"+resume);
File savedFile = new File("C:"+File.separator+"Users"+File.separator+"Pragati"+File.separator+"Desktop"+File.separator+"Project"+File.separator+"web"+File.separator+"resume"+File.separator+resume);
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
    
    PreparedStatement stmt1=con.prepareStatement("insert into student_proforma (s_id15,name,pre1,pre2,pre3,aggregate,father_name,program,applied,resume) values(?,?,?,?,?,?,?,?,?,?)");
    
    stmt1.setString(1,s_id);
    
    stmt1.setString(2,name);
    
    stmt1.setString(3,pre1);

    stmt1.setString(4,pre2);
    
    stmt1.setString(5,pre3);
    
    stmt1.setFloat(6,Float.parseFloat(aggregate));
    
    stmt1.setString(7,fathername);
    
    stmt1.setString(8,class1);
    
    stmt1.setString(9,"yes");
    
    stmt1.setString(10,resume);
    
    stmt1.execute();
    
con.close();

%>
       <script> window.confirm("Registration successful !!!");</script>
        <jsp:forward page="fill_proforma.jsp"/>
        window.confirm("Registration successful !!!");
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
