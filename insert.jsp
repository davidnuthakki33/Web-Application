<%@page import="java.sql.*" errorPage="/MyError.jsp"%>
<html>
<body bgcolor="lightgreen">
<% 
	int i;
	Connection con=null;
	PreparedStatement psmt;
	int no=Integer.parseInt(request.getParameter("rno"));
	String sname=request.getParameter("name");
	String course=request.getParameter("course");
	String query="insert into student values(?,?,?)";
	try {
		Class.forName("oracle.jdbc.driver.OracleDriver");
		con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","india");


psmt=con.prepareStatement(query);
psmt.setInt(1,no);
psmt.setString(2,sname);
psmt.setString(3,course);
i=psmt.executeUpdate();
if(i!=0)
	{%>
		<h1>record inserted</h1><br/><h4 align="left"><a href="home.html">home</a></h4>
<%
		
}
else
{
%>
<h1>record not inserted</h1>
<%
}
}catch(Exception e)
{
%><h1 align="center">&nbsp;Error ... plz enter valid data</h1><a href="home.html">home</a><%
}
finally{
con.close();
}
%>
</body>
</html>