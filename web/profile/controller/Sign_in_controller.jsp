<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@page import="net.roadbuddy.modal.Login_Modal"%>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>Insert title here</title>
</head>
<body>
<jsp:useBean id="obj_Login_Bean" class="net.roadbuddy.bean.Login_Bean"></jsp:useBean>
<jsp:setProperty property="*" name="obj_Login_Bean"/>
<%
    System.out.println(obj_Login_Bean.getEmail());
    System.out.println(obj_Login_Bean.getPassword());
    Login_Modal obj_Login_Modal=new Login_Modal();
    boolean flag=obj_Login_Modal.check_user_name(obj_Login_Bean);
    if(flag){
        session.setAttribute("user_session", obj_Login_Bean);
%>
<script type="text/javascript">
    window.location.href="https://roadbuddy.social/user-home-page/<%=obj_Login_Bean.getEmail()%>";
</script>
<%
}else{
    session.setAttribute("login_message", "Login Failed, User name and Password is Wrong");
%>
<script type="text/javascript">
    window.location.href="../../login.jsp";
</script>
<%
    }
%>
</body>
</html>