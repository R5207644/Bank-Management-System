/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controller;

import Models.User;
import Models.UserDao;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

/**
 *
 * @author Sarvesh Kumar
 */
public class Register extends HttpServlet {

    public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        RequestDispatcher rd = req.getRequestDispatcher("/Register.jsp");
        rd.include(req, res);
    }

    @Override
    public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

        String name, branch, account_type, email, pass, confirm_pass;
        double account_no, balance, contact;
        PrintWriter out = res.getWriter();
        res.setContentType("text/html");

        name = req.getParameter("name");
        branch = req.getParameter("branch");
        account_type = req.getParameter("account_type");
        account_no = Double.parseDouble(req.getParameter("account_no"));
        balance = Double.parseDouble(req.getParameter("balance"));
        contact = Double.parseDouble(req.getParameter("contact"));
        email = req.getParameter("email");
        pass = req.getParameter("pass");
        confirm_pass = req.getParameter("confirm_pass");

        if (!(pass.equals(confirm_pass))) {
            out.print("<h4>Password not matched confirm password</h4>");
            RequestDispatcher rd = req.getRequestDispatcher("/Register.jsp");
            rd.include(req, res);
            return;
        }

        if (balance < 500) {
            out.print("<h4>minimum balance must be 500</h4>");
            RequestDispatcher rd = req.getRequestDispatcher("/Register.jsp");
            rd.include(req, res);
            return;
        }

        User u = new User();
        u.setName(name);
        u.setBranch(branch);
        u.setAccount_type(account_type);
        u.setAccount_no(account_no);
        u.setBalance(balance);
        u.setContact(contact);
        u.setEmail(email);
        u.setPass(pass);

        int status = UserDao.save(u);
        if (status > 1) {
            out.print("<h4 class='text-success'>user id and password successfully created</h4>");
            RequestDispatcher rd = req.getRequestDispatcher("/Register.jsp");
            rd.include(req, res);

        } else {
            out.print("<h4>not created</h4>");
            RequestDispatcher rd = req.getRequestDispatcher("/Register.jsp");
            rd.include(req, res);
        }
    }
}
