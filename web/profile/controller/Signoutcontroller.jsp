<%
    session.removeAttribute("user_session");
    session.setAttribute("login_message", "Sign out Successfull");
%>
<script type="text/javascript">
    window.location.href="../../login.jsp";
</script>