<html>
<head>
    <%@ include file="Admin_header.html" %>
    <link rel="stylesheet" type="text/css" href="..\css\admin.css">
    <link rel="stylesheet" type="text/css" href="..\css\admin_career.css">
    <script src="../js/admin.js"></script>
</head>
<body>
<form action="report_table.jsp" method="post">

<div id="dgr" style="display:block">
<div class="kcontainer" style="display:block">

<pre>
<button id="kb01" onclick="kfun1()">Select Program <label id="ka01"> &#9662 </label> </button></br>
</pre>
<div id="kd01">

<p id="kp01"><input type="radio" name="program" value="B.Tech">Bachelor of Technology</p>
<p id="kp02"><input type="radio" name="program" value="M.Tech">Master of Technology</p>
<p id="kp03"><input type="radio" name="program" value="BCA">Bachelors in Computer Application</p>
<p id="kp04"><input type="radio" name="program" value="MCA">Master of  Computer Application</p> 
<p id="kp05"><input type="radio" name="program" value="M.sc">Master of Science (Computer Science)</p></br>

</div>

<pre>
<button id="kb01" onclick="kfun2()">Select Branch <label id="ka01"> &#9662 </label> </button></br>
</pre>
<div id="kd02">
<input id="kp11" type="radio" name="branch" value="CS">Computer Science </br>
<input id="kp12" type="radio" name="branch" value="IT">Information Technology</br></br></br>
</div>


<button id="kb01" onclick="kfun3()">Select Year <label id="ka01"> &#9662 </label> </button></br></br></br>
<div id="kabc"><button id="kdb01"></button><button id="kdb02"></button></div>
<div id="kd03">
<input id="kc01" type="radio" name="year" value="2018" onclick="kfun11(id)">2018<input id="kc10" type="radio" name="year" value="2013" onclick="kfun11(id)">2013</br>
<input id="kc02" type="radio" name="year" value="2017" onclick="kfun11(id)">2017<input id="kc09" type="radio" name="year" value="2012" onclick="kfun11(id)">2012</br>
<input id="kc03" type="radio" name="year" value="2016" onclick="kfun11(id)">2016<input id="kc08" type="radio" name="year" value="2011" onclick="kfun11(id)">2011</br>
<input id="kc04" type="radio" name="year" value="2015" onclick="kfun11(id)">2015<input id="kc07" type="radio" name="year" value="2010" onclick="kfun11(id)">2010</br>
<input id="kc05" type="radio" name="year" value="2014" onclick="kfun11(id)">2014<input id="kc06" type="radio" name="year" value="2009" onclick="kfun11(id)">2009</br>
</br></br>
</div>

<!--<button id="kb01">Select Mode </button></br></br>

<div id="kd04">
<input type="radio" id="kr01" value="internship" name="mode">Internship</br>
<input type="radio" id="kr02" value="placement" name="mode">Placement</br>
</br></br>
</div>-->

<!--<button id="kb01">Select Report Type </button></br></br>

<div id="kd05">

<input type="radio" id="kr11" name="type" value="table" name="report">Table</br>
<input type="radio" id="kr12" name="type" value="pie" name="report">Pie Chart</br>
<input type="radio" id="kr13" name="type" value="bar" name="report">Bar Graphs</br> </br></br>

</div>-->

<input type="submit" id="kbg" value="Generate Report" \>
</div>
</div> 
</form>    
</body>
</html>
