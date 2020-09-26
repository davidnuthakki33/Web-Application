<%@page import="java.sql.*" errorPage="/MyError.jsp"%>
<html><body bgcolor="lightgreen">
<h4 align="right"><a href="login1.html">home</a></h4>
<%  
try{
Connection con=null;	 	
		Class.forName("oracle.jdbc.driver.OracleDriver");
con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","india");
		String uid=request.getParameter("uid");
	String pwd=request.getParameter("pwd");
 
	  
	  String query="select * from userinfo where uname='"+uid+ "' and pwd='"+pwd+"'";
	  Statement st=con.createStatement();
	  ResultSet rs=st.executeQuery(query);
	  if(rs.next())
	  {
		  out.println("welcome");
		  response.sendRedirect("home.html");
	  }
	  else
	  {
		  out.println("Invalid user id/password..!");
	  }
			st.close();
			con.close();
	}
	catch(Exception e)
	{
		System.out.println(e);
	}


	
	
%>

</body>
</html>
			
			


	