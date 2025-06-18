package Controller;

import DAO.DAO_Admin.DAOAdmin;
import DAO.DAO_User.DAOUsers;
import Model.Forgotpassword.MaHoa;
import Model.Orders;
import Model.Shops;
import Model.Users;

import java.io.IOException;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class LoginController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");

        HttpSession session = request.getSession();

        // Lấy email và password từ form
        String email = request.getParameter("email");
        String password = request.getParameter("pass");

        if (email == null || password == null || email.trim().isEmpty() || password.trim().isEmpty()) {
            request.setAttribute("message", "Email and Password are required.");
            request.getRequestDispatcher("./View/Login/Login.jsp").forward(request, response);
            return;
        }

        DAOUsers dao = new DAOUsers();
        DAOAdmin daoa = new DAOAdmin();
        MaHoa ma = new MaHoa();
        Shops shop = new Shops();

        // Mã hóa mật khẩu
        String hashedPass = ma.toSHA1(password);

        // Kiểm tra đăng nhập
        Users acc = dao.login(email, hashedPass);

        if (acc == null) {
            request.setAttribute("message", "Wrong User or Password");
            request.getRequestDispatcher("./View/Login/Login.jsp").forward(request, response);
            return;
        }

        if (acc.getStatus().equalsIgnoreCase("banned")) {
            request.setAttribute("message", "Your Account Has Been Banned");
            request.getRequestDispatcher("./View/Login/Login.jsp").forward(request, response);
            return;
        }

        // Đăng nhập thành công
        session.setAttribute("acc", acc);

        if (acc.getUserRole().equalsIgnoreCase("shipper")) {
            request.getRequestDispatcher("./ShipperPage/Shipper_Login_Success.jsp").forward(request, response);

        } else if (acc.getUserRole().equalsIgnoreCase("admin")) {
            int totalUsers = daoa.GetTotalUsers();
            int totalOrders = daoa.GetTotalOrder();
            int totalProducts = daoa.GetTotalProducts();
            List<Orders> orderList = daoa.GetOrderList();

            request.setAttribute("totalUsers", totalUsers);
            request.setAttribute("totalOrders", totalOrders);
            request.setAttribute("totalProducts", totalProducts);
            request.setAttribute("orderList", orderList);

            request.getRequestDispatcher("./View/AdminPage/AdminHome.jsp").forward(request, response);

        } else {
            shop = dao.CheckExitShop(acc.getUserID());
            session.setAttribute("shop", shop);
            response.sendRedirect("homePage");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
