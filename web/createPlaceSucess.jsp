<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String uname = (String) session.getAttribute("user");
	if (null == uname) {
		session.setAttribute("errorMessage", "Access Denied !");
		response.sendRedirect("register2.jsp");
	}
%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Create Place Success</title>
	</head>
	
	<body>
		    <h1>Create Place Success !</h1>
			<a href="${pageContext.request.contextPath}/home.jsp">Go to Login page</a>
	</body>
</html>