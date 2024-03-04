/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.authentication;

import dal.AccountDBContext;
import entity.Account;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author sonnt
 */
public class LoginController extends HttpServlet {

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
        request.getRequestDispatcher("view/authentication/login.jsp").forward(request, response);
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

        response.setCharacterEncoding("UTF-8");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String usernameStudent = request.getParameter("usernameStudent");
        String passwordStudent = request.getParameter("passwordStudent");
        AccountDBContext db = new AccountDBContext();
        Account account = null;
        Account accountStudent = null;

// Kiểm tra account
        if (username != null && password != null) {
            account = db.getAccountByUsernamePassword(username, password);
            if (account != null) {
                String gmail = account.getGmail();
                if (!(gmail != null && gmail.contains("fe") && gmail.length() >= 2)) {
                    account = null; // Đặt account thành null nếu không thỏa mãn điều kiện
                }
            }
            if (account != null) {
                HttpSession session = request.getSession();
                session.setAttribute("account", account);
                // Redirect hoặc thông báo đăng nhập thành công
                response.sendRedirect("lecturer/timetable");
            } else {
                // Không tìm thấy tài khoản, thông báo đăng nhập không thành công
                request.setAttribute("errorLecturer", "***Username or password wrong***");
                request.getRequestDispatcher("view/authentication/login.jsp").forward(request, response);
            }

        }

// Kiểm tra accountStudent nếu không tìm thấy account
        if (account == null && usernameStudent != null && passwordStudent != null) {
            accountStudent = db.getAccountByUsernamePassword(usernameStudent, passwordStudent);
            if (accountStudent != null) {
                String gmail = accountStudent.getGmail();
                if (!(gmail != null && gmail.contains("fpt") && gmail.length() >= 3)) {
                    accountStudent = null; // Đặt accountStudent thành null nếu không thỏa mãn điều kiện
                }
            }
            if (accountStudent != null) {
                HttpSession session = request.getSession();
                session.setAttribute("account", accountStudent);
                // Redirect hoặc thông báo đăng nhập thành công
                response.getWriter().println("login successful!");
            } else {
                // Không tìm thấy tài khoản, thông báo đăng nhập không thành công
                request.setAttribute("errorStudent", "***Username or password wrong***");
                request.getRequestDispatcher("view/authentication/login.jsp").forward(request, response);
            }

        }

// Nếu account hoặc accountStudent được tìm thấy, đăng nhập thành công
      
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
