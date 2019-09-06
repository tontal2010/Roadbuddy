<%
    session.removeAttribute("user_session");
    session.setAttribute("login_message", "Sign out Successfull");
%>
<script type="text/javascript">
    window.location.href="https://roadbuddy.social/w/login2.jsp";
</script>