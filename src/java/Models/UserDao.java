/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

import java.sql.*;

/**
 *
 * @author Sarvesh Kumar
 */
public class UserDao {

    public static Connection getConnection() {

        Connection con = null;

        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bank", "root", "");
        } catch (Exception ex) {
            System.out.println(ex);
        }

        return con;
    }

    public static int save(User u) {
        int status = 0;

        try {
            Connection con = UserDao.getConnection();

            PreparedStatement ps1 = con.prepareStatement("INSERT INTO users (account_no, email, pass) values(?, ?, ?)");
            ps1.setDouble(1, u.getAccount_no());
            ps1.setString(2, u.getEmail());
            ps1.setString(3, u.getPass());

            status += ps1.executeUpdate();

            PreparedStatement ps2 = con.prepareStatement("INSERT INTO accounts (name, account_no, branch, balance, account_type, contact) values (?, ?, ?, ?, ?, ?)");
            ps2.setString(1, u.getName());
            ps2.setDouble(2, u.getAccount_no());
            ps2.setString(3, u.getBranch());
            ps2.setDouble(4, u.getBalance());
            ps2.setString(5, u.getAccount_type());
            ps2.setDouble(6, u.getContact());

            status += ps2.executeUpdate();

        } catch (Exception ex) {
            System.out.println(ex);
        }

        return status;
    }

    public static int read(User u) {
        int validation = 0;

        try {
            Connection con = UserDao.getConnection();
            PreparedStatement ps = con.prepareStatement("select * from users where email=?");
            ps.setString(1, u.getEmail());

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                if (rs.getString(3).equals(u.getPass())) {
                    validation = 1;
                } else {
                    validation = 2;
                }
            }

        } catch (Exception ex) {
            validation = 3;
            System.out.println(ex);
        }

        return validation;
    }

    public static User Account_Details(String email) {
        User u = new User();

        try {
            Connection con = getConnection();
            PreparedStatement ps = con.prepareStatement("select * from accounts where account_no=(select account_no from users where email=?)");
            ps.setString(1, email);
            
            ResultSet rs = ps.executeQuery();
            
            if(rs.next()) {
                u.setName(rs.getString(1));
                u.setAccount_no(rs.getDouble(2));
                u.setBranch(rs.getString(3));
                u.setBalance(rs.getDouble(4));
                u.setAccount_type(rs.getString(5));
                u.setContact(rs.getDouble(6));
            }
        } catch (Exception ex) {
            System.out.println(ex);
        }
        return u;
    }
}
