/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO.DAO_User;

import DAO.*;
import Model.ProductsVariant;
import Model.Shops;
import Model.Users;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.stream.Collectors;

/**
 *
 * @author lenovo
 */
public class DAOUsers extends DBcontext {

    public Users login(String email, String pass) { ////Checked
        String sql = "select * from [Users] where [Email] ='" + email + "' and [Password] ='" + pass + "'";
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
                Date CreateAt = rs.getDate(14);

                Users ac = new Users(UsersID, Username, Password, Email, FirstName, LastName, Address, DateOfBirth, Gender, PhoneNumber, Image, UserRole, Status, Status);
                System.out.println(ac);
                return ac;
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOUsers.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;

    }

    public Users loginByGoogle(String email) { ////Checked
        String sql = "select * from [Users] where [Email] ='" + email + "'";
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
                Date CreateAt = rs.getDate(14);

                Users ac = new Users(UsersID, Username, Password, Email, FirstName, LastName, Address, DateOfBirth, Gender, PhoneNumber, Image, UserRole, Status, Status);
                System.out.println(ac);
                return ac;
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOUsers.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;

    }

    public Users checkUserName(String user) { ////Checked
        String sql = "select * from [Users] where [Username] ='" + user + "'";
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
                Date CreateAt = rs.getDate(14);

                Users ac = new Users(UsersID, Username, Password, Email, FirstName, LastName, Address, DateOfBirth, Gender, PhoneNumber, Image, UserRole, Status, Status);
                System.out.println(ac);
                return ac;
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOUsers.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;

    }

    public void signup(String user, String pass, String Email, String PhoneNumber, int Gender) { ////Checked
        String sql = "INSERT INTO [dbo].[Users]\n"
                + "           ([Username]\n"
                + "           ,[Password]\n"
                + "           ,[Email]\n"
                + "           ,[Gender]\n"
                + "           ,[PhoneNumber]\n"
                + "           ,[UserRole]\n"
                + "           ,[Status])\n"
                + "     VALUES\n"
                + "           (?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?)";

        PreparedStatement pre;
        try {
            pre = conn.prepareStatement(sql);
            pre.setString(1, user);
            pre.setString(2, pass);
            pre.setString(3, Email);
            pre.setInt(4, Gender);
            pre.setString(5, PhoneNumber);
            pre.setString(6, "User");
            pre.setString(7, "Active");
            pre.executeUpdate();

        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public void signupByGoogle(String user, String Email) { ////Checked
        String sql = "INSERT INTO [dbo].[Users]\n"
                + "           ([Username]\n"
                + "           ,[Email]\n"
                + "           ,[UserRole]\n"
                + "           ,[Status])\n"
                + "     VALUES\n"
                + "           (?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?)";

        PreparedStatement pre;
        try {
            pre = conn.prepareStatement(sql);
            pre.setString(1, user);
            pre.setString(2, Email);
            pre.setString(3, "User");
            pre.setString(4, "Active");
            pre.executeUpdate();

        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public Users CheckExitAccount(String email) { ////Checked
        String sql = "select * from [Users] where [email] ='" + email + "'";
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
                Date CreateAt = rs.getDate(14);

                Users ac = new Users(UsersID, Username, Password, Email, FirstName, LastName, Address, DateOfBirth, Gender, PhoneNumber, Image, UserRole, Status, Status);
                System.out.println(ac);
                return ac;
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOUsers.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;

    }

    public void RegisterShop(String ShopName, String tax, String describe, int userID) { ////Checked
        String sql = "INSERT INTO [dbo].[Shops]\n"
                + "           ([name]\n"
                + "           ,[tax]\n"
                + "           ,[describe]\n"
                + "           ,[userId])\n"
                + "     VALUES\n"
                + "           (?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?)";

        PreparedStatement pre;
        try {
            pre = conn.prepareStatement(sql);
            pre.setString(1, ShopName);
            pre.setString(2, tax);
            pre.setString(3, describe);

            pre.setInt(4, userID);

            pre.executeUpdate();

        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public Shops CheckExitShop(int UserID) { ////Checked
        String sql = "select * from [Shops] where [userId] =" + UserID + "";
        try {
            Statement state = conn.createStatement(
                    ResultSet.TYPE_SCROLL_SENSITIVE,
                    ResultSet.CONCUR_UPDATABLE);
            ResultSet rs = state.executeQuery(sql);

            while (rs.next()) {
                int id = rs.getInt(1);
                String name = rs.getString(2);
                String tax = rs.getString(3);
                String describe = rs.getString(4);
                String logo = rs.getString(5);
                int userId = rs.getInt(6);
                Shops shop = new Shops(id, name, tax, describe, logo, userId);
                System.out.println(shop);
                return shop;
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOUsers.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;

    }

    public void UpdateRoleToSeller(int userID) { ////Checked

        try {
            String sql = "UPDATE [Users]\n"
                    + "   SET [UserRole] = ?\n"
                    + " WHERE UserID = ?";
            PreparedStatement stm = conn.prepareStatement(sql);
            stm.setString(1, "Seller");
            stm.setInt(2, userID);
            stm.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(DAOUsers.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    //Checked
    public boolean checkUserbyEmail(String email) {
        String sql = "SELECT * FROM Users WHERE Email = ?";
        try {
            Statement state = conn.createStatement(
                    ResultSet.TYPE_SCROLL_SENSITIVE,
                    ResultSet.CONCUR_UPDATABLE);
            ResultSet rs = state.executeQuery(sql);
            while (rs.next()) {
                String getEmail = rs.getString(email);

                if (getEmail != null) {
                    return true;
                } else {
                    return false;
                }

            }
        } catch (SQLException e) {
            System.err.println(e);

        }
        return false;
    }

    public Users getUserByEmail(String email) {
    String sql = "SELECT * FROM Users WHERE Email = ?";
    try {
        PreparedStatement pstmt = conn.prepareStatement(
                sql,
                ResultSet.TYPE_SCROLL_SENSITIVE,
                ResultSet.CONCUR_UPDATABLE
        );
        pstmt.setString(1, email);
        ResultSet rs = pstmt.executeQuery();

        if (rs.next()) {
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
            Date CreateAt = rs.getDate(14);

            return new Users(UsersID, Username, Password, Email, FirstName, LastName,
                    Address, DateOfBirth, Gender, PhoneNumber, Image, UserRole, Status, Status);
        }

    } catch (SQLException e) {
        System.err.println("Lỗi khi truy vấn user: " + e.getMessage());
    }
    return null;
}


    public boolean updatePassword(String email, String newPassword) {
        try {
            String sql = "UPDATE [dbo].[Users] SET [Password] = ? WHERE [Email] = ?";
            try (PreparedStatement ps = conn.prepareStatement(sql)) {
                ps.setString(1, newPassword);
                ps.setString(2, email);
                int rowCount = ps.executeUpdate();
                return rowCount > 0;
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
            return false;
        }
    }

    public int AddAddress(String username, String phoneNumber, String address, int userId) { ////Checked
        int generatedId = -1;
        String sql = "INSERT INTO [dbo].[ShippingAddresses] ([username],[phoneNumber],[address] ,[status],[userId]) VALUES(?,?,?,?,?)";
        
        PreparedStatement pre;
        try {
            pre = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            pre.setString(1, username);
            pre.setString(2, phoneNumber);
            pre.setString(3, address);
            pre.setInt(4, 0);
            pre.setInt(5, userId);
            pre.executeUpdate();
            
            try(ResultSet rs = pre.getGeneratedKeys()){
                if(rs.next()){
                    generatedId = rs.getInt(1);
                }
            
            }

        } catch (Exception e) {
            System.out.println(e);
        }
        return generatedId;
    }

    public void UpdateEachAddressStatus(int status, int userId, int addressId) { ////Checked

        try {
            String sql = "UPDATE [ShippingAddresses]\n"
                    + "   SET [status] = ?\n"
                    + " WHERE userId = ? AND id = ? ";
            PreparedStatement stm = conn.prepareStatement(sql);
            stm.setInt(1, status);
            stm.setInt(2, userId);
            stm.setInt(3, addressId);
            stm.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(DAOUsers.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    public void UpdateAllAddressStatus(int status, int userId) { ////Checked

        try {
            String sql = "UPDATE [ShippingAddresses]\n"
                    + "   SET [status] = ?\n"
                    + " WHERE userId = ?";
            PreparedStatement stm = conn.prepareStatement(sql);
            stm.setInt(1, status);
            stm.setInt(2, userId);
            stm.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(DAOUsers.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    public void UpdateAddress(String username, String phoneNumber, String address, int id) { ////Checked
        try {
            String sql = "UPDATE [ShippingAddresses] SET [username] = ?, [phoneNumber] = ?, [address] = ? WHERE id = ?";
            PreparedStatement stm = conn.prepareStatement(sql);
            stm.setString(1, username);
            stm.setString(2, phoneNumber);
            stm.setString(3, address);
            stm.setInt(4, id);
            stm.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(DAOUsers.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

  

    public void AddOrder(int userID, String totalAmount, String status, String shippingAddress, int paymentId) { ////Checked
        String sql = "INSERT INTO [dbo].[Orders] ([UserID],[TotalAmount] ,[Status],[ShipingAddress],[PaymentID]) VALUES(?,?,?,?,?)";
        PreparedStatement pre;
        try {
            pre = conn.prepareStatement(sql);
            pre.setInt(1, userID);
            pre.setString(2, totalAmount);
            pre.setString(3, status);
            pre.setString(4, shippingAddress);
            pre.setInt(5, paymentId);
            pre.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public void AddOrderItems(int OrderID, int ProductVariantID, int Quantity, String ProductName, String ProductVariantName, String Image) { ////Checked
        String sql = "INSERT INTO [dbo].[OrderItems] ([OrderID],[ProductVariantID],[Quantity] ,[Price],[ProductName],[ProductVariantName],[Image]) VALUES(?,?,?,?,?,?,?)";
        PreparedStatement pre;
        try {
            pre = conn.prepareStatement(sql);
            pre.setInt(1, OrderID);
            pre.setInt(2, ProductVariantID);
            pre.setInt(3, Quantity);
            pre.setFloat(4, getPriceByVariantId(ProductVariantID));
            pre.setString(5, ProductName);
            pre.setString(6, ProductVariantName);
            pre.setString(7, Image);
            pre.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public float getPriceByVariantId(int variantId) {
        String sql = "SELECT price FROM ProductsVariant WHERE ProductVariantID = ?";
        try (PreparedStatement pre = conn.prepareStatement(sql)) {
            pre.setInt(1, variantId);
            ResultSet rs = pre.executeQuery();
            if (rs.next()) {
                return rs.getFloat("price");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }

    public void DeleteAddress(int userId, int id) { ////Checked

        try {
            String sql = "DELETE FROM [dbo].[ShippingAddresses] WHERE userId = ? and id = ?";
            PreparedStatement stm = conn.prepareStatement(sql);
            stm.setInt(1, userId);
            stm.setInt(2, id);
            stm.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(DAOUsers.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    public int CreateOrder(int userId, float totalAmount) {
        int orderId = 0;
        String sql = "INSERT INTO [dbo].[Orders] ([UserID], [TotalAmount], [Status], [PaymentID]) VALUES (?, ?, ?, ?)";

        try (PreparedStatement pre = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            pre.setInt(1, userId);
            pre.setFloat(2, totalAmount);
            pre.setString(3, "Pending");
            pre.setInt(4, 1);
            pre.executeUpdate();

            // Lấy OrderID vừa tạo
            try (ResultSet rs = pre.getGeneratedKeys()) {
                if (rs.next()) {
                    orderId = rs.getInt(1);
                }
            }
            System.out.println(orderId);
        } catch (SQLException e) {
            e.printStackTrace(); // In lỗi để dễ debug
        }

        return orderId;
    }

   

    public ProductsVariant getProductsVariantById(int id) {
        String sql = "SELECT * FROM ProductsVariant WHERE [ProductVariantID] = " + id;
        try {
            Statement state = conn.createStatement(
                    ResultSet.TYPE_SCROLL_SENSITIVE,
                    ResultSet.CONCUR_UPDATABLE);
            ResultSet rs = state.executeQuery(sql);

            while (rs.next()) {
                int ProductVariantID = rs.getInt(1);
                String ProductVariantName = rs.getString(2);
                int ProductID = rs.getInt(3);
                float Price = rs.getFloat(4);
                int StockQuantity = rs.getInt(5);
                String Image = rs.getString(6);

                ProductsVariant pv = new ProductsVariant(ProductVariantID, ProductVariantName, ProductID, Price, StockQuantity, Image, ProductVariantName);
                System.out.println(pv);
                return pv;
            }

        } catch (SQLException e) {
            System.err.println("Lỗi khi truy vấn user: " + e.getMessage());
        }
        return null;  // Trả về null nếu không tìm thấy user
    }

  

    

    public ProductsVariant getProductVariantById(int productVariantID) {
        ProductsVariant variant = null;
        String sql = "SELECT * FROM ProductsVariant WHERE productVariantID = ?";

        try (PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, productVariantID);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                variant = new ProductsVariant(
                        rs.getInt("ProductVariantID"),
                        rs.getString("ProductVariantName"),
                        rs.getInt("ProductID"),
                        rs.getFloat("Price"),
                        rs.getInt("StockQuantity"),
                        rs.getString("Image"),
                        rs.getString("ProductName")
                );
            }
            System.out.println(variant);

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return variant;
    }

    public int CreateBill(String username, String shippingAddress, String paymentMethod, double totalAmount, int userId, int orderId) throws SQLException {
        String sql = "INSERT INTO Bill (username, shippingAddress, status, paymentMethod, orderDate, totalAmount,userId, orderId) VALUES (?, ?, ?, ?,?,?, ?,?)";
        try (PreparedStatement pstmt = conn.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS)) {
            pstmt.setString(1, username);
            pstmt.setString(2, shippingAddress);
            pstmt.setInt(3, 2);
            pstmt.setString(4, paymentMethod);
            pstmt.setTimestamp(5, new Timestamp(System.currentTimeMillis())); // Thời gian hiện tại
            pstmt.setDouble(6, totalAmount);
            pstmt.setInt(7, userId);
            pstmt.setInt(8, orderId);
            int rowsAffected = pstmt.executeUpdate();
            if (rowsAffected > 0) {
                ResultSet generatedKeys = pstmt.getGeneratedKeys();
                if (generatedKeys.next()) {
                    System.out.println(generatedKeys.getInt(1));
                    return generatedKeys.getInt(1); // Trả về ID của Bill vừa tạo
                }
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return -1; // Trả về -1 nếu thất bại
    }

    public boolean updateStatusBillDetail(String status, String orderItemId) {
        String sql = "UPDATE [BillDetails] SET [status] = ? WHERE [orderItemId] = ?";
        boolean isUpdated = false;

        try (PreparedStatement ps = this.conn.prepareStatement(sql)) {
            ps.setString(1, status);
            ps.setString(2, orderItemId);

            int affectedRows = ps.executeUpdate();
            isUpdated = affectedRows > 0;  // Kiểm tra có bản ghi nào bị ảnh hưởng không
        } catch (Exception e) {
            System.out.println("Error: " + e.getMessage());
        }

        return isUpdated;
    }

    public void addBillDetails(int billId, String productVariantName, String productVariantImage, int quantity, double price, int status, int orderItemId) throws SQLException {
        String sql = "INSERT INTO BillDetails (billId, productVariantName, productVariantImage, quantity, price, status, orderItemId) VALUES (?, ?, ?, ?, ?,?,?)";
        try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, billId);
            pstmt.setString(2, productVariantName);
            pstmt.setString(3, productVariantImage);
            pstmt.setInt(4, quantity);
            pstmt.setDouble(5, price);
            pstmt.setInt(6, status);
            pstmt.setInt(7, orderItemId);
            pstmt.executeUpdate();
        }
    }

    public Users getUserById(int id) { ////Checked
        String sql = "select * from [Users] where [UserID] ='" + id + "'";
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
                Date CreateAt = rs.getDate(14);

                Users ac = new Users(UsersID, Username, Password, Email, FirstName, LastName, Address, DateOfBirth, Gender, PhoneNumber, Image, UserRole, Status, Status);
                System.out.println(ac);
                return ac;
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOUsers.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;

    }

    public static void main(String[] args) {
        Users user = new Users();
        user.setUserID(1);
        List<Integer> testa = Arrays.asList(3, 9);
        DAOUsers test = new DAOUsers();
        test.AddAddress("123", "123", "123", 1);

    }

}
