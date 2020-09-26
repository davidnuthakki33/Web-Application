<%@page import="java.sql.*" errorPage="/MyError.jsp"%>
<html><body bgcolor="lightgreen">
<% 
	int rno=Integer.parseInt(request.getParameter("rno"));
	int totalfee,feepaid;
            Connection con=null;
	PreparedStatement psmt;
	try {
		Class.forName("oracle.jdbc.driver.OracleDriver");
		con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","india");
		Statement st=con.createStatement();

		String Query="select * from fee where rno="+rno;

		ResultSet rs=st.executeQuery(Query);
		int bal;
		if(rs.next())
		{	
			totalfee=rs.getInt("totalfee");
  		                  feepaid=rs.getInt("feepaid");
			bal=totalfee-feepaid;
		%> 
<h3><center> Total Fee : <%=totalfee%> </center> <h3>  <br> <br>
<h3><center>Paid Amount : <%=feepaid%></center></h3><br> <br>
<h3><center>Balance Amount : <%=bal %></center></h3><br> <br>
<%
    }
    else
         out.println("Roll no not found !");
%>
<a href="home.html">home</a>
<%
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