/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Users;

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

            PreparedStatement ps = con.prepareStatement("INSERT INTO users (u_type, email, pass) values(?, ?, ?)");
            ps.setString(1, u.getU_type());
            ps.setString(2, u.getEmail());
            ps.setString(3, u.getPass());

            status = ps.executeUpdate();

        } catch (Exception ex) {
            System.out.println(ex);
        }
        
        return status;
    }
    
    public static int read(User u) {
        int validation = 0; 
        
        try {
            Connection con = UserDao.getConnection();
            PreparedStatement ps = con.prepareStatement("select * from users where u_type=? and email=?");
            ps.setString(1, u.getU_type());
            ps.setString(2, u.getEmail());
            
            ResultSet rs = ps.executeQuery();
            
            if (rs.next()) {
                if(rs.getString(3).equals(u.getPass())) {
                    validation = 1;
                } else{
                    validation = 2;
                }
            }
            
        } catch(Exception ex) {
            System.out.println(ex);
        }
        
        return validation;
    }
}
