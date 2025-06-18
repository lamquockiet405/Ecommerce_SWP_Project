/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO.DAO_Admin;

import DAO.DAO_User.DAOUsers;
import Model.Shops;
import Model.Users;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author lenovo
 */
public class DAOAdmin extends DAO.DBcontext {

    

    public void UpdateAccountStatus(Users user) { ////Checked

        try {
            String sql = "UPDATE [Users]\n"
                    + "   SET [Status] = ?\n"
                    + " WHERE UserID = ?";
            PreparedStatement stm = conn.prepareStatement(sql);
            stm.setString(1, user.getStatus());
            stm.setInt(2, user.getUserID());
            stm.executeUpdate();
            
        } catch (SQLException ex) {
            Logger.getLogger(DAOUsers.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    public List<Users> GetUserList() { //// Checked
        List<Users> list = new ArrayList<>();
        String sql = "select * from Users where UserRole = 'User' or UserRole = 'Seller'";
        try {
            PreparedStatement stm = conn.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Users user = new Users();
                user.setUserID(rs.getInt(1));
                user.setUsername(rs.getString(2));
                user.setPassword(rs.getString(3));
                user.setEmail(rs.getString(4));
                user.setFirstName(rs.getString(5));
                user.setLastName(rs.getString(6));
                user.setAddress(rs.getString(7));
                user.setDateOfBirth(rs.getString(8));
                user.setGender(rs.getBoolean(9));
   
                user.setPhoneNumber(rs.getString(10));
                user.setImage(rs.getString(11));
                user.setUserRole(rs.getString(12));
                user.setStatus(rs.getString(13));
                user.setCreateAt(rs.getString(14));
               
                list.add(user);
            }
            System.out.println(list);
        } catch (Exception e) {
            System.out.println(e);
        }
        System.out.println(list);
        return list;
    }

    public List<Shops> GetShopList() { //// Checked
        List<Shops> list = new ArrayList<>();
        String sql = "select * from Shops ";
        try {
           PreparedStatement stm = conn.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Shops shop = new Shops();
                shop.setId(rs.getInt(1));
                shop.setName(rs.getString(2));
                shop.setTax(rs.getString(3));
                shop.setDescribe(rs.getString(4));
                shop.setLogo(rs.getString(5));
                shop.setUserId(rs.getInt(6));
              
                list.add(shop);
            }
            System.out.println(list);
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public Users getUserById(int id) { ////Checked
        String sql = "select * from [Users] where UserID = '" + id + "'  ";
        try {
            Statement state = conn.createStatement(
                    ResultSet.TYPE_SCROLL_SENSITIVE,
                    ResultSet.CONCUR_UPDATABLE);
            ResultSet rs = state.executeQuery(sql);

            while (rs.next()) {
               int UsersID = rs.getInt(1);
                String Username = rs.getString(2);
                String Password = rs.getString(3);
                String Email = rs.getString(4);
                String FirstName = rs.getString(5);
                String LastName = rs.getString(6);
                String Address = rs.getString(7);
                String DateOfBirth = rs.getString(8);
                boolean Gender = rs.getBoolean(9);
                
                String PhoneNumber = rs.getString(10);
                String Image = rs.getString(11);
                String UserRole = rs.getString(12);
                String Status = rs.getString(13);
                String CreateAt = rs.getString(14);

                Users ac = new Users(UsersID, Username, Password, Email, FirstName, LastName, Address, DateOfBirth, Gender, PhoneNumber, Image, UserRole, Status, CreateAt);
                System.out.println(ac);
                return ac;
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOUsers.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
     public Shops getShopById(int id) { ////Checked
        String sql = "select * from [Shops] where id = '" + id + "'  ";
        try {
            Statement state = conn.createStatement(
                    ResultSet.TYPE_SCROLL_SENSITIVE,
                    ResultSet.CONCUR_UPDATABLE);
            ResultSet rs = state.executeQuery(sql);

            while (rs.next()) {
               int shopid = rs.getInt(1);
                String name = rs.getString(2);
                String tax = rs.getString(3);
                String describe = rs.getString(4);
                String logo = rs.getString(5);
                int userId = rs.getInt(6);
              
                Shops shop = new Shops(shopid, name, tax, describe, logo, userId);

                
               System.out.println(shop);
                return shop;
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOUsers.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
    
    
    
    public List<Shops> GetShopListByEmail(String email) { //// Checked
        List<Shops> list = new ArrayList<>();
        String sql = "select * from [Shops] INNER JOIN users ON users.userId=Shops.userId where users.Email like '" + email + "%'  ";
        try {
           PreparedStatement stm = conn.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Shops shop = new Shops();
                shop.setId(rs.getInt(1));
                shop.setName(rs.getString(2));
                shop.setTax(rs.getString(3));
                shop.setDescribe(rs.getString(4));
                shop.setLogo(rs.getString(5));
                shop.setUserId(rs.getInt(6));
              
                list.add(shop);
            }
            System.out.println(list);
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }
    
     public List<Users> GetUserListByEmail(String email) { //// Checked
        List<Users> list = new ArrayList<>();
        String sql = "select * from Users where email like '" + email +"%'";
        try {
            PreparedStatement stm = conn.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Users user = new Users();
                user.setUserID(rs.getInt(1));
                user.setUsername(rs.getString(2));
                user.setPassword(rs.getString(3));
                user.setEmail(rs.getString(4));
                user.setFirstName(rs.getString(5));
                user.setLastName(rs.getString(6));
                user.setAddress(rs.getString(7));
                user.setDateOfBirth(rs.getString(8));
                user.setGender(rs.getBoolean(9));
   
                user.setPhoneNumber(rs.getString(10));
                user.setImage(rs.getString(11));
                user.setUserRole(rs.getString(12));
                user.setStatus(rs.getString(13));
                user.setCreateAt(rs.getString(14));
               
                list.add(user);
            }
            System.out.println(list);
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }
    
      public void AddPaymentMethod(String paymentMethod) { ////Checked
        String sql = "INSERT INTO [dbo].[Payment] ([PaymentMethod],[status]) VALUES (?,?)";

        PreparedStatement pre;
        try {
            pre = conn.prepareStatement(sql);
            pre.setString(1, paymentMethod);
            pre.setInt(2, 1);
            pre.executeUpdate();

        } catch (Exception e) {
            System.out.println(e);
        }
    }         
    
    public void UpdatePaymentStatus(int status, int paymentId) { ////Checked

        try {
            String sql = "UPDATE [Payment]\n"
                    + "   SET [status] = ?\n"
                    + " WHERE PaymentID = ?";
            PreparedStatement stm = conn.prepareStatement(sql);
            stm.setInt(1, status);
            stm.setInt(2, paymentId);
            stm.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(DAOUsers.class.getName()).log(Level.SEVERE, null, ex);
        }

    }


    
    public void DeletePaymentMethod(int id) { ////Checked

        try {
            String sql = "DELETE FROM [dbo].[Payment] WHERE PaymentID = ? ";
            PreparedStatement stm = conn.prepareStatement(sql);
            stm.setInt(1, id);
            
            stm.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(DAOUsers.class.getName()).log(Level.SEVERE, null, ex);
        }

    }
    
    public int GetTotalUsers() { //// Checked
        int total = 0;
        String sql = "  select COUNT(*) from Users";
        try {
            PreparedStatement stm = conn.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                
               

                total = rs.getInt(1);
            }
            System.out.println(total);
        } catch (Exception e) {
            System.out.println(e);
        }
        return total;
    }
    
      public int GetTotalOrder() { //// Checked
        int total = 0;
        String sql = "  select COUNT(*) from Orders";
        try {
            PreparedStatement stm = conn.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                
               

                total = rs.getInt(1);
            }
            System.out.println(total);
        } catch (Exception e) {
            System.out.println(e);
        }
        return total;
    }
            public int GetTotalProducts() { //// Checked
        int total = 0;
        String sql = "  select COUNT(*) from Products";
        try {
            PreparedStatement stm = conn.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                
               

                total = rs.getInt(1);
            }
            System.out.println(total);
        } catch (Exception e) {
            System.out.println(e);
        }
        return total;
    }
    
   
    public static void main(String[] args) {
        Users user = new Users();
        user.setUserID(2);
        user.setStatus("Active");
        DAOAdmin test = new DAOAdmin();
    } 
}
