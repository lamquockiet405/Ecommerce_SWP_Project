/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controller.Admin_Controller.category;

import DAO.DAO_Seller.category.CategoryProcess;
import Model.Category;
import Model.Users;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "update_category", urlPatterns = "/update_category")
public class UpdateCategory extends HttpServlet{
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Users user = (Users) request.getSession().getAttribute("acc");
        if (user == null || !user.getUserRole().equalsIgnoreCase("Admin")) {
            response.sendRedirect(request.getContextPath() + "/LogOutController");
            return;
        } 
        String categoryName = request.getParameter("categoryName");
        String status = request.getParameter("status");
        String categoryId = request.getParameter("categoryId");
        
        Category category = new Category();
        category.setCategoryId(Integer.parseInt(categoryId));
        category.setCategoryName(categoryName);
        category.setStatus(Integer.parseInt(status));
        try {
            CategoryProcess.INSTANCE.updateCategory(category);
            response.sendRedirect(request.getContextPath() + "/view_category?successUpdateCategory=success");
        } catch (Exception e) {
            response.sendRedirect(request.getContextPath() + "/view_category?errorUpdateCategory=" + e.getMessage());
        }
    }
}
