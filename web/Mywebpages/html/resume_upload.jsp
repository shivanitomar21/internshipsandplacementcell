<%@page import="java.sql.*"%>
<%@ page import="java.io.*,java.util.*"%>
<%@page import="com.oreilly.servlet.MultipartRequest" %>  
<html>    
<%  
MultipartRequest m = new MultipartRequest(request, "e:/Library");  
out.print("successfully uploaded");  
  
%>
</html>