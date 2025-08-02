/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Users;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

/**
 *
 * @author Sarvesh Kumar
 */
public class Register extends HttpServlet {

    @Override
    public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

        String u_type, email, pass, confirm_pass;
        PrintWriter out = res.getWriter();
        res.setContentType("text/html");

        u_type = "user";
        email = req.getParameter("email");
        pass = req.getParameter("pass");
        confirm_pass = req.getParameter("confirm_pass");

        if (email.equals("") || pass.equals("") || confirm_pass.equals("")) {
            out.print("<h4>All fields necessary</h4>");
            RequestDispatcher rd = req.getRequestDispatcher("/Register.jsp");
            rd.include(req, res);
            return;
        } else if (!(pass.equals(confirm_pass))) {
            out.print("<h4>Password not matched confirm password</h4>");
            RequestDispatcher rd = req.getRequestDispatcher("/Register.jsp");
            rd.include(req, res);
            return;
        }

        User u = new User();
        u.setU_type(u_type);
        u.setEmail(email);
        u.setPass(pass);

        int status = UserDao.save(u);
        if (status > 0) {
            out.print("<h4 class='text-success'>Registration successful</h4>");
            RequestDispatcher rd = req.getRequestDispatcher("/Register.jsp");
            rd.include(req, res);
      
            
        } else {
            out.print("<h4>Registration failed</h4>");
            RequestDispatcher rd = req.getRequestDispatcher("/Register.jsp");
            rd.include(req, res);
        }
    }
}
