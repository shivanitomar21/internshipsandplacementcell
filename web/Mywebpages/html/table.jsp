<html>
<head>
    <%@ include file="Admin_header.html" %>
    <link rel="stylesheet" type="text/css" href="..\css\report.css">
	<script src="../js/admin.js"></script>
</head>
<body>
<form action="report_table.jsp" method="post">
<div id="main">
<div id="pro" >
<h2>Select Program</h2>
<input type="checkbox" id="pro1" name="program" value="B.Tech">Bachelor of Technology<br>
<input type="checkbox" id="pro2" name="program" value="M.Tech">Master of Technology<br>
<input type="checkbox" id="pro3" name="program" value="BCA">Bachelors in Computer Application<br>
<input type="checkbox" id="pro4" name="program" value="MCA">Master of  Computer Application<br>
<input type="checkbox" id="pro5" name="program" value="M.Sc">Master of Science (Computer Science)
</div>
<div id="bran">
<h2>Select Branch</h2>
<input type="checkbox" id="bran1" name="branch" value="CS">Computer Science<br>
<input type="checkbox" id="bran2" name="branch" value="IT">Information Technology<br>
</div>
<div id="yr">
<h2>Select Year</h2>
<input type="checkbox" id="yr1" name="year" value="2017">2017<br>
<input type="checkbox" id="yr2" name="year" value="2016">2016<br>
<input type="checkbox" id="yr3" name="year" value="2015">2015<br>
<input type="checkbox" id="yr4" name="year" value="2014">2014<br>
<input type="checkbox" id="yr5" name="year" value="2013">2013<br>
</div>
<div id="cmp">
<h2>Select Company</h2>
<input type="checkbox" id="cmp1" name="company" value="tcs">TCS<br>
<input type="checkbox" id="cmp2" name="company" value="accenture">Accenture<br>
<input type="checkbox" id="cmp3" name="company" value="tivo">TIVO<br>
<input type="checkbox" id="cmp4" name="company" value="globallogic">Global Logics<br>
<input type="checkbox" id="cmp5" name="company" value="hsbc">HSBC<br>
<input type="checkbox" id="cmp5" name="company" value="nucleus">Nucleus Softwares<br>
</div>
</div>
<input type="submit" id="gen" value="Generate Report">
</form>
</body>
</html>