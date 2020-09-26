<%@page isErrorPage="true"%>
<html><body>
	An exception is raised while processing the request: <br/>
	<b>Exception : </b> <br/>
	&nbsp;&nbsp;&nbsp;&nbsp;<%=exception.getMessage()%>
</body> </html>
