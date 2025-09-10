<%-- 
    Document   : index
    Created on : 25 Jul 2025, 4:51:24 pm
    Author     : local user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*, BankServlet.*"%>
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
            .notice {
                overflow: scroll;
            }

        </style>
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

            if (!(u_type.equals("user"))) {
                response.sendRedirect("Login");
            }
        %>
        <jsp:include page="nav.jsp"/>
        <div class="container-fluid">

            <div class="row p-5">
                <div class="col-6">
                    <div class="card p-3 kg-card notice">
                        <h3>Welcome My Bank</h3>
                        <%
                            try {
                                ResultSet rs = Dao.getNotification(email);

                                while (rs.next()) {
                                    out.print("<p class='mb-3 btn btn-warning form-control text-start'>" + rs.getString(2) + "</p>");
                                }
                            } catch (Exception ex) {
                                System.out.println(ex);
                            }
                        %>
                    </div>
                </div>
                <div class="col-3">
                    <div class="card kg-card">
                        <img src="static/img/journal.jpg" class="card-img-top kg-card-img-top" alt="alt"/>
                        <div class="card-footer">
                            <a href="Statement.jsp" class="btn btn-outline-primary form-control">Account Summary</a>
                        </div>
                    </div>
                </div>
                <div class="col-3">
                    <div class="card kg-card">
                        <img src="static/img/mtransfer.jpg" class="card-img-top kg-card-img-top" alt="alt"/>
                        <div class="card-footer">
                            <a href="FundTransfer.jsp" class="btn btn-outline-primary form-control">Transfer Money</a>
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
                            <a href="Notification.jsp" class="btn btn-outline-primary form-control">Check Notification</a>
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
