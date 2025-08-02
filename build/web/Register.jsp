<%-- 
    Document   : Register
    Created on : 28 Jul 2025, 5:50:13 pm
    Author     : local user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="Bootstrap.html"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register</title>
    </head>
    <body>
        <div class="main">
            <form method="post" action="Register">
                <input type="email" name="email" class="form-control" placeholder="email" required>
                <input type="password" name="pass" class="form-control" placeholder="enter password" required>
                <input type="password" name="confirm_pass" class="form-control" placeholder="confirm password" required>
                <input type="submit" value="Register" class="btn btn-primary form-control">
                <p><a href="Login.jsp">Already registered</a></p>
            </form>
        </div>
    </body>
</html>
