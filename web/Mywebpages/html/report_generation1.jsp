<html>
<head>
    <%@ include file="Admin_header.html" %>
    <link rel="stylesheet" type="text/css" href="..\css\admin.css">
    <link rel="stylesheet" type="text/css" href="..\css\admin_career.css">
    <script src="../js/admin.js"></script>
</head>
<body>
<form action="display_type.jsp" method="post">
<h2 align="center"><b>Select Type Of Report</b></h2>
<input type="submit" name="type" id="t1" value="table" width="100px" style="margin-left:650px"><br><br>
<input type="submit" name="type" id="t2" value="bar graph" width="100px" style="margin-left:638px"><br><br>
<input type="submit" name="type" id="t3" value="pie chart" width="100px" style="margin-left:638px"><br><br>
</form>
</body>
</html>