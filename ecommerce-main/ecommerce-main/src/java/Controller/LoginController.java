package Controller;

import DAO.DAO_Admin.DAOAdmin;
import DAO.DAO_User.DAOUsers;
import Model.Forgotpassword.MaHoa;

import Model.Users;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;

public class LoginController extends HttpServlet {


    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        MaHoa ma = new MaHoa();
        HttpSession session = request.getSession();
        String email = request.getParameter("email");
        String password = request.getParameter("pass");
        DAOUsers dao = new DAOUsers();
        DAOAdmin daoa = new DAOAdmin();
      

        Users acc = dao.login(email, ma.toSHA1(password));
        
        if (acc == null) {
            request.setAttribute("message", "Wrong User Or Password");
            request.getRequestDispatcher("./View/Login/Login.jsp").forward(request, response);
           
        }
        

        else if (acc.getStatus().equals("banned") || acc.getStatus().equals("Banned")) {
            request.setAttribute("message", "Your Account Has Been Banned");
            request.getRequestDispatcher("./View/Login/Login.jsp").forward(request, response);
        }
        
        else {
            session.setAttribute("acc", acc);
            if (acc.getUserRole().equals("shipper") || acc.getUserRole().equals("Shipper")) {
                request.getRequestDispatcher("./ShipperPage/Shipper_Login_Success.jsp").forward(request, response);
            } else if (acc.getUserRole().equals("admin") || acc.getUserRole().equals("Admin")) {
                
                int totalUsers = daoa.GetTotalUsers();
                int totalOrders = daoa.GetTotalOrder();
                int totalProducts = daoa.GetTotalProducts();
             
                request.setAttribute("totalUsers", totalUsers);
                request.setAttribute("totalOrders", totalOrders);
                request.setAttribute("totalProducts", totalProducts);
            

                request.getRequestDispatcher("./View/AdminPage/AdminHome.jsp").forward(request, response);
            
            }else {
           
                response.sendRedirect("homePage");
            }
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
