/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.authentication;

import dal.RoleDBContext;
import entity.Account;
import entity.Role;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;

/**
 *
 * @author Vu Minh Quan
 */
public abstract class BaseRBACController extends BaseRequire {
 
     private ArrayList<Role> getRoles(Account account, HttpServletRequest req) {
        RoleDBContext db = new RoleDBContext();
        String url = req.getServletPath();
        return db.getByUsernameAndUrl(account.getUsername(), url);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp, Account account) throws ServletException, IOException {
        ArrayList<Role> roles = getRoles(account, req);
        if (roles.size() < 1) {
            resp.getWriter().println("<a href='../login'><h3>Login</h3></a>");
            resp.getWriter().println("<h3>access denied!</h3>");
        } else {
           doPost(req, resp, account, roles);
        }
    }

    protected abstract void doGet(HttpServletRequest req, HttpServletResponse resp, Account account, ArrayList<Role> roles)
            throws ServletException, IOException;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp, Account account) throws ServletException, IOException {
        ArrayList<Role> roles = getRoles(account, req);
        if (roles.size() < 1) {
            resp.getWriter().println("<a href='../login'><h3>Login</h3></a>");
            resp.getWriter().println("<h3>access denied!</h3>");
        } else {
            
             doGet(req, resp, account, roles);
        }
    }
     protected abstract void doPost(HttpServletRequest req, HttpServletResponse resp, Account account, ArrayList<Role> roles)
            throws ServletException, IOException;

}
