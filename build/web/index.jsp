<%-- 
    Document   : index
    Created on : 25 Jul 2025, 4:51:24 pm
    Author     : local user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home</title>
    </head>
    <body>
        <%
            String email = (String) session.getAttribute("email");
            if (email == null) {
                response.sendRedirect("Login.jsp");
            }
        %>
        <jsp:include page="nav.jsp"/>
        <div class="container-fluid">
            
            <div class="row">
                <div class="col-6">
                    <h3>Welcome My Bank</h3>
                    <h6 class="bg-warning text-dark">Sample notice for our account holder</h6>
                </div>
                <div class="col-3"></div>
                <div class="col-3"></div>
            </div>
            
            <div class="row">
                <div class="col-6"></div>
                <div class="col-3"></div>
                <div class="col-3"></div>
            </div>
            
        </div>
    </body>
</html>
