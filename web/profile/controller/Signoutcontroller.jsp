<%
    session.removeAttribute("user_session");
    session.setAttribute("login_message", "Sign out Successfull");
%>
<script type="text/javascript">
    window.location.href="http://localhost:8080/Roadbuddy_war_exploded/login2.jsp";
</script>