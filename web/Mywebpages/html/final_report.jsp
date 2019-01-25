<%@page import="java.sql.*"%>
<%@ page import="java.io.*,java.util.*"%>
<%@ page import="org.jfree.chart.*"%>
<%@ page import="org.jfree.data.category.*"%>
<%@ page import="org.jfree.data.general.DefaultPieDataset"%>
<%@ page import="org.jfree.data.xy.*"%>
<%@ page import="org.jfree.data.*"%>
<%@ page import="org.jfree.chart.renderer.category.*"%>
<%@ page import="org.jfree.chart.plot.*"%>
<%@ page import="java.awt.*"%>



<html>
<head>
	
    <link rel="stylesheet" type="text/css" href="..\css\admin.css">
    <link rel="stylesheet" type="text/css" href="..\css\admin_career.css">
	<link rel="stylesheet" type="text/css" href="..\css\programMaster.css">
	<link rel="stylesheet" type="text/css" href="..\css\report.css">
	
	
    <script src="../js/admin.js"></script>
	<script src="../js/program.js"></script>
	

	
</head>
<body>	


<div id="cri">
<h2>Select Crteria for Report</h2>
<input type="radio" id="cri1" name="myradio" value="program">Program Wise<br>
<input type="radio" id="cri2" name="myradio" value="branch">Branch Wise<br>
<input type="radio" id="cri3" name="myradio" value="company">Company Wise<br>
<input type="radio" id="cri4" name="myradio" value="year">Year Wise<br>
</div>
<input type="submit" id="gen1" value="Generate Report" onclick="conertTableIntoArray("table_id")><br>
<div id="maindiv">
	<div id="li01" class="lmodal">
	<form id="lmodal-content animate"  action="final_report.jsp" >
		<div class="limg_container">
		<div id="top"><span onclick="closelog()" id="lclose" title="Close Modal">
		&times;</span></div>
		
		
		<br><br><br>

	<%	
String b=request.getParameter("myradio");

if(b.equals("program")) 
{	
	
    
  %>
  <table  align="center" id="table_id">
		<tr>
			<th>Program Name</th>
			<th>Number</th>
		</tr>
		
		<%
			String[] company=new String[100];
			Integer[] count=new Integer[100];
			int i=0,j=0;
			try
			{
				
				Class.forName("com.mysql.jdbc.Driver");
    			Connection con1=DriverManager.getConnection("jdbc:mysql://localhost:3306/waftap","root","root");
    			
				Statement stmt=con1.createStatement();
				ResultSet rs=stmt.executeQuery("select * from program_count");
    
    			while(rs.next())
    			{
				
    				%>
    				<tr><td><%=rs.getString(1)%></td>
    				<td><%=rs.getInt(2)%></td></tr>

				<%
				company[i]=rs.getString(1);
				count[j]=rs.getInt(2);
				out.println(company[i]);
				out.println(count[j]);
				i++;
				j++;
				}%>
				</table>
				
				<%
				rs.close();
				stmt.close();
				con1.close();
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
	try{		
DefaultCategoryDataset dataset = new DefaultCategoryDataset();
for(int k=0;k<count.length;k++)
{
dataset.setValue(count[k],"Placed",company[k]);
  JFreeChart chart = ChartFactory.createBarChart
  ("BarChart using JFreeChart","Company", "Placed", dataset, 
   PlotOrientation.VERTICAL, false,true, false);
  chart.setBackgroundPaint(Color.yellow);
  chart.getTitle().setPaint(Color.blue); 
  CategoryPlot p = chart.getCategoryPlot(); 
  p.setRangeGridlinePaint(Color.red); 
  ChartFrame frame1=new ChartFrame("Bar Chart",chart);
  frame1.setVisible(true);
  frame1.setSize(400,350);
  }
        }
        catch(Exception e)
        {
        }
        
}	%>
</form>

</body>
</html>