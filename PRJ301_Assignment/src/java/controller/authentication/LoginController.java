/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.authentication;

import dal.AccountDBContext;
import dal.AssessmentDBContext;
import dal.RoleDBContext;
import entity.Account;
import entity.Role;
import entity.Student;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;

public class LoginController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("view/authentication/login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setCharacterEncoding("UTF-8");
        String sID = null;//take ID of student 
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        RoleDBContext roleDB = new RoleDBContext();
        ArrayList<Role> roleArr = roleDB.getByUsernameAndUrl(username, "/lecturer/timetable");
        AccountDBContext db = new AccountDBContext();
        Account account = db.getAccountByUsernamePassword(username, password);
        AssessmentDBContext gradeDB = new AssessmentDBContext();
        ArrayList<Student> stArr = gradeDB.studentArray();

        if (account != null) {
            for (Student student : stArr) {
                if (student.getCoreName().equals(account.getUsername())) {
                    sID = student.getsID();
                }
            }
            HttpSession session = request.getSession();

            //implement remember me!
            Cookie c_username = new Cookie("username", username);
            c_username.setMaxAge(3600 * 24 * 7);

            Cookie c_password = new Cookie("password", password);
            c_password.setMaxAge(3600 * 24 * 7);

            response.addCookie(c_username);
            response.addCookie(c_password);
            session.setAttribute("account", account);
            // Redirect hoặc thông báo đăng nhập thành công

            if (roleArr.size() >= 1) {
                response.sendRedirect("lecturer/timetable?id=" + account.getUsername());
            } else {
                response.sendRedirect("student/grade?id=" + sID);
            }

        } else {
            // Không tìm thấy tài khoản, thông báo đăng nhập không thành công
            request.setAttribute("error", "***Username or password wrong***");
            request.getRequestDispatcher("view/authentication/login.jsp").forward(request, response);

        }

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
