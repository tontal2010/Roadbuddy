<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String uname = (String) session.getAttribute("createuser");
	if (null == uname) {
		session.setAttribute("errorMessage", "Access Denied !");
		response.sendRedirect("register2.jsp");
	}
%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Create User Success</title>
	</head>
	
	<body>
		    <h1>Create User Success !</h1>
			<h1>Redirecting . . .</h1>
			<meta http-equiv="Refresh" content="3; url=${pageContext.request.contextPath}/login2.jsp" />
	</body>
</html>