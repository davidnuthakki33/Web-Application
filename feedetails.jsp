<%@page import="java.sql.*" errorPage="/MyError.jsp"%>
<html><body bgcolor="lightgreen">
<% 
	int rno=Integer.parseInt(request.getParameter("rno"));
	int totalfee=Integer.parseInt(request.getParameter("totalfee"));
	int feepaid=Integer.parseInt(request.getParameter("feepaid"));
String query="insert into fee values(?,?,?)";
Connection con=null;
	PreparedStatement psmt;
	try {
		Class.forName("oracle.jdbc.driver.OracleDriver");
		con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","india");
psmt=con.prepareStatement(query);
psmt.setInt(1,rno);
psmt.setInt(2,totalfee);
psmt.setInt(3,feepaid);
int i=psmt.executeUpdate();
if(i!=0)
	{
		%><h1>fee details are updated</h1>
<a href="home.html">home</a>

<%}
else
{
%>
<h1>FEE DETAILS NOT UPDATED</h1>
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