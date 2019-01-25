<html>
    
    <head>
        <%@ include file="header_student.jsp" %>

	    <link rel="stylesheet" type="text/css" href="..\css\student_resume_oexp_por.css">
        <script src="../js/student.js"></script>
    </head>
    
<body>
        
<script>
        document.getElementById('b05').style.backgroundColor='purple';
        document.getElementById('b05').style.color='white';
</script>
        
<div id="portotal">
<form action="oexp_pos_db.jsp">
<div class="porcontainer">
<div class="porheader">Position Of Responsibility<a href="student_resume_oexp.jsp"><span class="porclose" title="close">&times;</span></a>
</div>
<div class="pordetails">
<p id="pori01">Ex: Project leader in Swechha foundation's cleanliness in 2015</p>

<label class="porlabel">Description:</label>
</br>
<textarea id="pordesc" name="desc" rows="6" cols="50" placeholder="Add details here(maximum 250 characters)." style="margin-top:10px;" required></textarea>
</br></br>
<a href="student.html"><button type="submit" id="porsave">SAVE</button></a>

</div>
</div>
</form>
</div>

    </body>
</html>