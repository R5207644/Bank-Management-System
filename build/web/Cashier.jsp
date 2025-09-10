<%-- 
    Document   : Cashier
    Created on : 21 Aug 2025, 4:49:06 pm
    Author     : local user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*, BankServlet.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cashier</title>
        <link rel="stylesheet" href="static/styles.css"/>
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

            if (!(u_type.equals("cashier"))) {
                response.sendRedirect("Login");
            }
        %>

        <jsp:include page="nav.jsp"/>

        <div class="account-main col-8 offset-2 mt-5">
            <div class="accounts-top">
                <h5 text-center>Account Information</h5>
            </div>
            <div class="accounts-hero">
                <div class="p-3">
                    <form class="col-8 offset-2 my-3" method="post" action="Cashier.jsp">
                        <h4 class="text-center py-2">Enter Account no.</h4>
                        <input type="text" name="account_no" class="form-control" required>
                        <div class="text-center my-2">
                            <input type="submit" value="Get Account info" class="btn btn-primary">
                        </div>
                    </form>
                </div>

                <div class="row p-3">
                    <%
                        // handling post request
                        long account_no = 0;
                        ResultSet rs = null;

                        if ("POST".equalsIgnoreCase(request.getMethod())) {
                            account_no = Long.parseLong(request.getParameter("account_no"));

                            try {
                                rs = TellerDao.getDetails(account_no);

                                if (rs.next()) {
                                    out.print("<div class='col-6'>");
                                    out.print("<p class='text-center'>Account no.</p>");
                                    out.print("<input type='text' value='" + rs.getLong(2) + "' disabled class='form-control mb-3'>");
                                    out.print("<p class='text-center'>Account Holder Name</p>");
                                    out.print("<input type='text' value='" + rs.getString(1) + "' disabled class='form-control'>");
                                    out.print("<p class='text-center'>Bank Balance</p>");
                                    out.print("<input type='text' value='" + rs.getLong(4) + "' disabled class='form-control'>");
                                    out.print("</div>");

                                    out.print("<div class='col-6 gap-1'>");

                                    out.print("<form method='post' action='Withdraw'>");
                                    out.print("<p class='text-center'>Transaction Process</p>");
                                    out.print("<input type='hidden' value='" + account_no + "' name='account_no'>");
                                    out.print("<input type='text' class='form-control' name='checkNo' placeholder='Write Check No'>");
                                    out.print("<input type='text' class='form-control' name='ammount' placeholder='Enter Ammount to withdraw'>");
                                    out.print("<p class='text-center'><input type='submit' value='Withdraw' class='btn btn-primary'></p>");
                                    out.print("</form>");

                                    out.print("<form method='post' action='Deposite'>");
                                    out.print("<input name='account_no' type='hidden' value='" + account_no + "' name='account_no'>");
                                    out.print("<input type='text' class='form-control' name='checkNo' placeholder='Write Check No'>");
                                    out.print("<input type='text' class='form-control' name='ammount' placeholder='Enter Ammount to Deposite'>");
                                    out.print("<p class='text-center'><input type='submit' value='Deposite' class='btn btn-success'></p>");
                                    out.print("</form>");

                                    out.print("</div>");
                                }
                            } catch (Exception ex) {
                                System.out.println(ex);
                            }
                        }
                    %>
                </div>
            </div>
            <div class="accounts-bottom">
                <h6 class="text-center">My Bank</h6>
            </div>
        </div>
    </body>
</html>
