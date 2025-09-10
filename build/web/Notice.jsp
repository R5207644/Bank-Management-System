<%-- 
    Document   : Notice
    Created on : 14 Aug 2025, 4:44:27 pm
    Author     : local user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Send Notice</title>
    </head>
    <body>
        <%
            String u_type, email;
            u_type = (String) session.getAttribute("u_type");
            email = (String) session.getAttribute("email");

            if (u_type == null || email == null) {
                response.sendRedirect("Login");
                return;
            }

            if (!(u_type.equals("manager"))) {
                response.sendRedirect("Login");
            }

            long account_no = Long.parseLong(request.getParameter("account_no"));
        %>

        <jsp:include page="nav.jsp"/>

        <div class="col-8 offset-2">
            <form action="Notice" method="post">
                <h2 class="text-info text-center my-5">Send Notice</h2>
                <div class="mb-2 text-center">
                    <label for="notice" class="form-label">Enter Notice</label>
                    <textarea name="notice" id="notice" cols="10" rows="4" class="form-control"></textarea>
                </div>
                <input type="hidden" name="account_no" value=<%=account_no%>>
                <div class="text-center"><input type="submit" value="send" class="btn btn-info"></div>
            </form>
        </div>
    </body>
</html>
