<%@page import="java.sql.*" errorPage="/MyError.jsp"%>
<html><body bgcolor="lightgreen"><h4 align="right"><a href="home.html">home</a></h4>
<% 
String tuname=request.getParameter("uid");
String tpwd=request.getParameter("pwd");
String query="select * from userinfo where uname='"+tuname + "' and pwd='"+tpwd+"'";
	Connection con=null;
	PreparedStatement psmt;
	ResultSet rs=null;
	try {
		Class.forName("oracle.jdbc.driver.OracleDriver");
	con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","india");
psmt=con.prepareStatement(query);
rs=psmt.executeQuery();
if(rs.next())	
{%>
  <jsp:forward page="home.html"/>
<%
}
else{
	%>
	<h2>Invalid User id/ password</h2>
<%}
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