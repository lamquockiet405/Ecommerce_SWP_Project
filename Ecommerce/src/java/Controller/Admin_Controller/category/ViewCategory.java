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
import java.util.List;

@WebServlet(name = "view_category", urlPatterns = "/view_category")
public class ViewCategory extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Users user = (Users) request.getSession().getAttribute("acc");
        if (user == null || !user.getUserRole().equalsIgnoreCase("Admin")) {
            response.sendRedirect(request.getContextPath() + "/LogOutController");
            return;
        }
        try {
            int pageSize = 10;
            int page = getCurrentPage(request);

            if (request.getParameter("errorAddCategory") != null && !request.getParameter("errorAddCategory").trim().isEmpty()) {
                request.setAttribute("errorAddCategory", request.getParameter("errorAddCategory"));
            }
            if (request.getParameter("successAddCategory") != null && !request.getParameter("successAddCategory").trim().isEmpty()) {
                request.setAttribute("successAddCategory", "Add new category successfully!");
            }
            if (request.getParameter("errorUpdateCategory") != null && !request.getParameter("errorUpdateCategory").trim().isEmpty()) {
                request.setAttribute("errorUpdateCategory", request.getParameter("errorUpdateCategory"));
            }
            if (request.getParameter("successUpdateCategory") != null && !request.getParameter("successUpdateCategory").trim().isEmpty()) {
                request.setAttribute("successUpdateCategory", "Update category successfully!");
            }

            String ctype = request.getParameter("ctype") == null ? "all" : request.getParameter("ctype");
            String status = ctype.equals("live") ? "1" : ctype.equals("unlisted") ? "0" : null;
            String search = request.getParameter("search") != null ? request.getParameter("search").trim().replaceAll("\\s+", " ") : request.getParameter("search");
            String sort = request.getParameter("sort") == null ? "ASC" : request.getParameter("sort");
            int totalPage = CategoryProcess.INSTANCE.getTotalPage(pageSize, search, sort, status);
            List<Category> listCategory = CategoryProcess.INSTANCE.getAllCategories(page, pageSize, search, sort, status);

            request.setAttribute("currentPage", page);
            request.setAttribute("totalPages", totalPage);
            request.setAttribute("listCategory", listCategory);
            request.setAttribute("sort", sort);
            request.setAttribute("ctype", ctype);
            request.setAttribute("search", search);
        } catch (Exception e) {
            request.setAttribute("error", "The server is busy! Plese try again.");
        }
        request.getRequestDispatcher("/View/AdminPage/category/view_category.jsp").forward(request, response);
    }

    private int getCurrentPage(HttpServletRequest request) {
        String pageParam = request.getParameter("page");
        int page = 1;
        if (pageParam != null) {
            try {
                page = Integer.parseInt(pageParam);
                if (page < 1) {
                    page = 1;
                }
            } catch (NumberFormatException e) {
                page = 1;
            }
        }
        return page;
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Users user = (Users) request.getSession().getAttribute("acc");
        if (user == null || !user.getUserRole().equalsIgnoreCase("Admin")) {
            response.sendRedirect(request.getContextPath() + "/LogOutController");
            return;
        }
        try {
            String statusAction = request.getParameter("c_select");
            String[] splitData = statusAction.split("\\|");
            CategoryProcess.INSTANCE.updateStatus(splitData[0], splitData[1]);
            request.setAttribute("successUpdateProduct", "Change status category is successfully!");
        } catch (Exception e) {
            request.setAttribute("errorUpdateProduct", e.getMessage());
        }
        doGet(request, response);
    }
}
