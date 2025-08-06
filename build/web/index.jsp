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
        <style>
            #bank-img {
                background-image: url("static/img/bank1.jpg");
            }
            .kg-card {
                height: 300px !important;
            }
            .kg-card-img-top {
                height: 200px !important;
            }
            
        </style>
    </head>
    <body>
        <%
            String email = (String) session.getAttribute("email");
            if (email == null) {
                response.sendRedirect("Login");
            }
        %>
        <jsp:include page="nav.jsp"/>
        <div class="container-fluid">

            <div class="row p-5">
                <div class="col-6">
                    <div class="card p-3 kg-card">
                        <h3>Welcome My Bank</h3>
                        <h6 class="bg-warning text-dark">Sample notice for our account holder</h6>
                    </div>
                </div>
                <div class="col-3">
                    <div class="card kg-card">
                        <img src="static/img/journal.jpg" class="card-img-top kg-card-img-top" alt="alt"/>
                        <div class="card-footer">
                            <a href="#" class="btn btn-outline-primary form-control">Account Summary</a>
                        </div>
                    </div>
                </div>
                <div class="col-3">
                    <div class="card kg-card">
                        <img src="static/img/mtransfer.jpg" class="card-img-top kg-card-img-top" alt="alt"/>
                        <div class="card-footer">
                            <a href="#" class="btn btn-outline-primary form-control">Transfer Money</a>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row p-5">
                <div class="col-6">
                    <div class="card kg-card" id="bank-img"></div>
                </div>
                <div class="col-3">
                    <div class="card kg-card">
                        <img src="static/img/notif.gif" class="card-img-top kg-card-img-top" alt="alt"/>
                        <div class="card-footer">
                            <a href="#" class="btn btn-outline-primary form-control">Check Notification</a>
                        </div>
                    </div>
                </div>
                <div class="col-3">
                    <div class="card kg-card">
                        <img src="static/img/send_mail.gif" class="card-img-top kg-card-img-top" alt="alt"/>
                        <div class="card-footer">
                            <a href="#" class="btn btn-outline-primary form-control">Contact us</a>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </body>
</html>
