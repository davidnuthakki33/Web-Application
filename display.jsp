<%@page import="java.sql.*" errorPage="/MyError.jsp"%>
<html><body bgcolor="lightgreen"><h4 align="right"><a href="home.html">home</a></h4>
<% 
	String  course=request.getParameter("course");
String query="select * from student where course='"+course + "'";
	Connection con=null;
	PreparedStatement psmt;
	ResultSet rs=null;
	try {
		Class.forName("oracle.jdbc.driver.OracleDriver");
	con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","india");
psmt=con.prepareStatement(query);
rs=psmt.executeQuery();
%>
<h2 align="center">List of Students Joined for The Course </h2>
<table border="1" align="center">
<tr>
<th>RegNo</th>
<th>Student Name</th>
<th>Course</th>
</tr>
<%
while(rs.next())	
{%>
<tr>
<td><%=rs.getString("rno")%></td>
<td><%=rs.getString("sname")%></td>
<td><%=rs.getString("course")%></td>
</tr>
<%
}
}catch(Exception e)
{
out.println(e);
}
finally{
con.close();
}
%>
</body>
</html>