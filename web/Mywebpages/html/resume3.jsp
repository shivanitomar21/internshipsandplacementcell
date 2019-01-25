<%@ page import="java.io.*,java.util.*,java.sql.*"%>

<!Doctype html>
<html>
    <head>

         
            <link rel="stylesheet" type="text/css" href="..\css\resume.css">
            <script type="text/javascript" src="../js/fontawesome-all.js"></script>
             <script type="text/javascript" src="../js/jspdf.debug.js"></script>
              <script type="text/javascript" src="../js/html2pdf.js"></script>
               <script type="text/javascript" src="../js/jquery-1.7.1.min.js"></script>
                <script type="text/javascript" src="../js/html2canvas.js"></script>
                 <script type="text/javascript" src="../js/jspdf.min.js"></script>
           
    </head>
    
    <body>
    
        <div id="resume-body" style="width:60%;" >
        
            <div id="outer" style="width:100%;" >
        
          <div id="myresume">
      <div id="p1">
    
        
           
          <%
              String s_id=(String)session.getAttribute("uid");
            try{
                Class.forName("com.mysql.jdbc.Driver");
    
                Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/waftap","root","root");
                     
                PreparedStatement stmt1=con.prepareStatement("select f_name,l_name,contact_no,e_mail,city from signup where s_id=?");
                    
                stmt1.setString(1,s_id);
                    
                ResultSet rs=stmt1.executeQuery();
                    
                if(rs.next())
                {%>
   
                <div  class="eduhead" >
                            
                    <h2 style="text-transform:capitalize"><%=rs.getString(1)%>&nbsp;&nbsp;<%=rs.getString(2)%></h2>
                            
                    <p  style="color:graytext;text-transform:capitalize">
                
                    <%=rs.getString(4)%><br>
                                
                    <%=rs.getString(3)%><br>
                                 
                    <%=rs.getString(5)%></p>
                
                    <%}  stmt1.execute();%></div>
                
            <hr style="width:95%">
            
            <div id="educational_details" style="display:inline; ">
            
                <h3 class="eduhead" style="width:10%;">Education:</h3>
            
                <div class="content"  style=" width:40%; color:graytext;float:right;padding-top:5px;">
              
               <% int i1=0;
          
               PreparedStatement stmt7=con.prepareStatement("select program,branch,yoc,college,obt_marks,max_marks from college_edu_pg where s_id11=?");
            
          
               stmt7.setString(1,s_id);
     
                ResultSet rs7=stmt7.executeQuery();
   
                if(rs7.next())
   
                {
                    i1=1;
                int obt_marks=rs7.getInt(5);
                
                int max_marks=rs7.getInt(6);
                
                float per=(float)(obt_marks*100)/max_marks;     
            %>             
           
            <h4 style="color:black;"><%=rs7.getString(1)%>&emsp;&emsp;&emsp;&nbsp;</h4>
                       
            <%=rs7.getString(2)%>(<%=rs7.getString(3)%>)<br>
                        
            <%=rs7.getString(4)%><br>Percentage :<%=per%>%<br><%} stmt7.execute();%>
                   
       
            <% int i2=0;
            
            PreparedStatement stmt9=con.prepareStatement("select program,branch,yoc,college,obt_marks,max_marks from college_edu_ug where s_id9=?");
	
            stmt9.setString(1,s_id);
     
            ResultSet rs9=stmt9.executeQuery();
   
            if(rs9.next())
   
            {
       
                i2=1;
       
                int obt_marks=rs9.getInt(5);
       
                int max_marks=rs9.getInt(6);
       
                float per=(float)(obt_marks*100)/max_marks;     
            %>  
            
            <h4 style="color:black;"><%=rs9.getString(1)%>&emsp;&emsp;</h4>
 
            <%=rs9.getString(2)%>(<%=rs9.getString(3)%>)<br>
 
            <%=rs9.getString(4)%><br>Percentage :<%=per%>%<br><%} stmt9.execute();%>
                   
               
            <% int i3=0;
                         
            PreparedStatement stmt10=con.prepareStatement("select s_class,yop,board,obt_marks,max_marks,stream from school_edu_xii where s_id8=?");
	
            stmt10.setString(1,s_id);
     
            ResultSet rs10=stmt10.executeQuery();
   
            if(rs10.next())
            {
       
                i3=1;
       
                int obt_marks=rs10.getInt(4);
       
                int max_marks=rs10.getInt(5);
       
                float per=(float)(obt_marks*100)/max_marks;     
            %>  

            <h4 style="color:black;"><%=rs10.getString(1)%>(Senior Secondary),<%=rs10.getString(6)%>&emsp;&emsp;</h4><br>

            Year of Completion:<%=rs10.getString(2)%><br><%=rs10.getString(3)%><br>Percentage :<%=per%>%<br><%} stmt10.execute();%>
                                         
            <% int i4=0;
                     
            PreparedStatement stmt11=con.prepareStatement("select s_class,yop,board,obt_marks,max_marks from school_edu_X where s_id1=?");
	
            stmt11.setString(1,s_id);
     
            ResultSet rs11=stmt11.executeQuery();
   
            if(rs11.next())
   
            {
                i4=1;
       
                int obt_marks=rs11.getInt(4);
       
                int max_marks=rs11.getInt(5);
       
                float per=(float)(obt_marks*100)/max_marks;     
            %>             

            <h4 style="color:black;"><%=rs11.getString(1)%>(Secondary)&emsp;&emsp;</h4><br>

            Year of Completion:<%=rs11.getString(2)%><br><%=rs11.getString(3)%><br>Percentage :<%=per%>%<br><%} stmt11.execute();
            
 %>                      
                
     </div>
            
            </div>
                <hr style="width:95%">
                
               
                        <% 
               
                            PreparedStatement stmt2=con.prepareStatement("select profile,organization,location,sdate,edate,cwh from student_job_exp where s_id2=?");
               
                            stmt2.setString(1,s_id);
     
                            ResultSet rs2=stmt2.executeQuery();
   
                            if(rs2.next())
    
                            {%>
                                 <div id="jobdetails">
            
                    <h3 class="eduhead" style="width:10%;">Jobs:</h3>
                        
                    <div class="content" id="jobcon" style="color:graytext;float:right;padding-top:5px;width:40%;" >
                    
                            <h4 style="color:black;"><%=rs2.getString(1)%>&emsp;&emsp;</h4>
       
                            <%if(rs2.getString(6).equals("no"))
       
                            {%>
        
                            <%=rs2.getString(2)%>(<%=rs2.getString(3)%>)
       
                            <%}else{ %> <%=rs2.getString(2)%>(virtual)<br>
              
                            <%=rs2.getString(4)%>-<%=rs2.getString(5)%>
  
                                   </div>   
                        
                        </div>
      </div>
                            <div id="p2">
          <hr style="width:95%">
                            <%}}stmt2.execute();%>
  
                            

        
                 
        
          
              
                  <%
                  
                      PreparedStatement stmt4=con.prepareStatement("select profile,organization,location,wfh,sdate,edate from student_internship_exp where s_id=?");
                    
                      stmt4.setString(1,s_id);
     
                      ResultSet rs4=stmt4.executeQuery();
   
                      if(rs4.next())
   
                      {%>
                        <div id="internshipdetails" style="display:inline;">
          
              <h3 class="eduhead" style="width:10%;">Internships:</h3>
              
              <div class="content" id="intcon" style="color:graytext;float:right;padding-top:5px;width:40%;" >
   
                        <h4 style="color:black;"><%=rs4.getString(1)%>&emsp;&emsp;&nbsp;</h4>
       
                        <%if(rs4.getString(4).equals("no"))
       
                        {%>
        
                        <%=rs4.getString(2)%>(<%=rs4.getString(3)%>)
       
                        <%}else{ %> <%=rs4.getString(2)%>(virtual)<br>
           
                        <%=rs4.getString(5)%>-<%=rs4.getString(6)%>
  
                        <%}
%> </div>
          
                </div><%}stmt4.execute();%>
  
                        

        
             
                        <hr style="width:95%">
            
            
                        
                     
                                <%
                    
                                    PreparedStatement stmt3=con.prepareStatement("select description from student_pos_oexp where s_id5=?");
                    
                                    stmt3.setString(1,s_id);
                    
                                    ResultSet rs3=stmt3.executeQuery();
                    
                                    if(rs3.next())
                    
                                    {%>
                                     <div id="posofres" style="display:inline; ">
            
                            <h3 class="eduhead" style="width:10%;">Positions of<br>responsibility:</h3>
                 
                            <div class="content" style="color:graytext;float:right;padding-top:5px;width:40%;">
                                    <h4 style="float:right;text-align:left; color:graytext;"><%=rs3.getString(1)%>&emsp;&emsp;&nbsp;</h4>
                     
                                     </div>
                        
                        </div><%}stmt3.execute();%>
                    
                                   
                 
                           
                 
                                    <hr style="width:95%">
                 
                                    <div id="training" style="display:inline; ">
                 
                                        <h3 class="eduhead" style="width:10%;" >Training:</h3>
                
                                        <div class="content" style="color:graytext;float:right;padding-top:5px;width:40%;">
                                
                                            <%
                                        
                                                PreparedStatement stmt5=con.prepareStatement("select program,organization,location,sdate,edate,online from student_training_oexp where s_id4=?");
                    
                                                stmt5.setString(1,s_id);
     
                                                ResultSet rs5=stmt5.executeQuery();
   
                                                while(rs5.next())
    
                                                {%>
        
                                                <h4 style="color:black;"><%=rs5.getString(1)%>&emsp;&emsp;&nbsp;</h4>
       
                                                <%if(rs5.getString(6).equals("no"))
                                                {%>
        
                                                <%=rs5.getString(2)%>(<%=rs5.getString(3)%>)
       
                                                <%}else{ %> <%=rs5.getString(2)%>(virtual)<%}%><br>
           
                                                <%=rs5.getString(4)%>-<%=rs5.getString(5)%>
  
                                                <%}stmt5.execute();%>
  
                                               
            
                                        </div>
          
                                    </div>
            
         <hr style="width:95%">
            
         
                 
                 <%
               
                     PreparedStatement stmt6=con.prepareStatement("select title,sdate,edate,description,c_ongoing from project_oexp where s_id3=?");
                    
                     stmt6.setString(1,s_id);
     
                     ResultSet rs6=stmt6.executeQuery();
   
                     if(rs6.next())
   
    {%>
        <div id="projects" style="display:inline; ">     
         
             <h3 style="color:blueviolet;padding-left:20px;float:left;width:20%;" >Projects:</h3>
             
             <div class="content" style="text-transform: capitalize;
  
                color:black;float:right;padding-top:5px;padding-bottom:5px;   margin-bottom:auto; padding-right:50px;margin-right:100px;color:graytext;float:right;padding-top:5px;width:40%;">
    <h4 style="color:black;"><%=rs6.getString(1)%>&emsp;&emsp;&nbsp;</h4>
      
    <%if(rs6.getString(5).equals("no"))
     
    {%>
     
    <%=rs6.getString(2)%>-<%=rs6.getString(3)%>
     
    <%}else{ %> <%=rs6.getString(2)%>-Present<br><%}%>
    
    <%=rs6.getString(4)%><br>    
  
     </div>
       </div>
         <hr style="width:95%"><%}stmt6.execute();%>
  
    
      
           
                
                
            
       
           

          <% int skill_id=0;  
          
          PreparedStatement stmt12=con.prepareStatement("select skill_id from student_skill where s_id7=?");
          
          stmt12.setString(1,s_id);
            
            ResultSet rs12=stmt12.executeQuery();
    
            if(rs12.next())
            {
                skill_id=rs12.getInt(1);
    
        PreparedStatement stmt13=con.prepareStatement("select skill_name from skill_master where skill_id=?");
   
        stmt13.setInt(1,skill_id);
    
        ResultSet rs13=stmt13.executeQuery();

        if(rs13.next())
        {
            String s_name=rs13.getString(1);
            
          //  int skl_id=Integer.parseInt("skill_id");
            
            %> <div id="skills">
            
                <h3 class="eduhead" style="width:10%" >Skills:</h3>
        
                <div class="content" style="width:40%;color:black; float:right;padding-top:5px;">
             <%=s_name%>&nbsp&nbsp&nbsp
            
                    </div>
            
<hr style="width:95%"><%
        }
            stmt13.execute();
        }

stmt12.execute();%>


 
         
            
<div id="adddetails" style="display:inline;">

    <h3 class="eduhead" style="width:10%;">Additional details:</h3>&emsp;
    
    <div class="content" style="color:graytext;float:right;padding-left:50px; padding-top:5px;width:40%;"> <%
    
        PreparedStatement stmt8=con.prepareStatement("select desc1 from student_additional where s_id6=?");
        
        stmt8.setString(1,s_id);
        
        ResultSet rs8=stmt8.executeQuery();
        
        while(rs8.next())
        
        {%>
        
        <h4 style="float:right;padding-bottom:1px;color:graytext;"><%=rs8.getString(1)%>&emsp;&emsp;&emsp;&emsp;&emsp14;</h4>
        
        <%} stmt8.execute();%>
        
       
        
    </div>
    
</div>

        
            <hr style="width:95%">
       
                            </div>    
        <% 
            con.close();
            }catch(Exception e){}
	%>    
       
      
       
        </div>
        </div>
        </div>
        <script src="js/jspdf.js"></script>
    <script src="../js/jspdf.PLUGINTEMPLATE.js"></script>
   
   
   
    <script type="text/javascript" src="../js/FileSaver.js"></script>
    <script type="text/javascript" src="../js/addimage.js"></script>
    <script type="text/javascript" src="../js/split_text_to_size.js"></script>
    <script type="text/javascript" src="../js/standard_fonts_metrics.js"></script>

    <script type="text/javascript" src="../js/svg.js"></script>
   
        <script>
            
        html2canvas($("#myresume"), {
             background:'#ffffff',
             
    onrendered: function(canvas) {
       
        var ctx = canvas.getContext('2d');

                ctx.webkitImageSmoothingEnabled = false;
                ctx.mozImageSmoothingEnabled = false;
                ctx.imageSmoothingEnabled = false;
        var imgData = canvas.toDataURL(
            'image/jpeg',1.0);              
        var doc = new jsPDF('p', 'mm','a4');
        var options = {
    pagesplit: true,
    background:'#ffffff',
    
        };

    doc.addHTML($('#resume-body'), 0, 0, options, function(){
    doc.save("test.pdf");
    });
        doc.addImage(imgData,'jpeg',10, 10, 180, 300);
        
        doc.save('sample-file123.pdf');
    }
});


        </script>   
        </body>
   
</html>