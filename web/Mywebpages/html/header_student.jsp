<html>
    
<head>
    <link rel="stylesheet" type="text/css" href="..\css\student.css">
    <link rel="stylesheet" type="text/css" href="..\css\student_career.css">
    <script src="../js/student.js"></script>
</head>

<body>

    
<%
String s_id=(String)session.getAttribute("uid");
%>

<div id="total">
<div class="container">
<img src="logo.png" alt="banasthali logo" id="logo">
Internship and Placements</div>

<nav>
    
<div class="tab">

<a href="home_page.jsp"><button id="b01" >Home</button></a>
<a href="fill_proforma.jsp" ><button class="nav_option" id="b03" >Apply For Internship</button></a>
<a href="if_resume_exists.jsp"><button class="nav_option" id="b05">Build Your Resume</button></a>
<a href="com.jsp"><button class="nav_option" id="b06">Company Details</button></a>
<a href="share_exp.jsp"><button class="nav_option" id="b07">Share your Experience</button></a>

</div>

</nav> 

<nav>

</div>

<div id="dcc">
    
<div id="dropcc">
    <button id="bcc1">Internships</button></br>
    <button id="bcc2">Placements</button>
</div>
    
</div>

</body>

</html>