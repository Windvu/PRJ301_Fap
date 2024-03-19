/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.student;

import controller.authentication.BaseRBACController;
import dal.AssessmentDBContext;
import dal.AttendenceStudentDBContext;
import dal.SubjectDBContext;
import entity.Account;
import entity.Attendence;
import entity.Role;
import entity.Student;
import entity.Subject;
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
public class AttendStudentController extends BaseRBACController {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp, Account account, ArrayList<Role> roles) throws ServletException, IOException {
        AttendenceStudentDBContext db = new AttendenceStudentDBContext();
        SubjectDBContext dbSub = new SubjectDBContext();
        String subID = req.getParameter("subID");
        ArrayList<Attendence> attStAll = db.arrAttAll(account.getUsername(), subID);
        ArrayList<Attendence> attSt = db.arrAtt(account.getUsername(), subID);
        ArrayList<Subject> sub = dbSub.list();
        AssessmentDBContext gradeDB = new AssessmentDBContext();
        ArrayList<Student> stArr=gradeDB.studentArray();
        String sID=null;    
        for(Student student: stArr){
            if(student.getCoreName().equals(account.getUsername())){
                sID=student.getsID();
            }
        }
        req.setAttribute("ID", sID);
        req.setAttribute("coreName", account.getUsername());
        req.setAttribute("students", stArr);
        req.setAttribute("subject", sub);
        req.setAttribute("attendStudent", attSt);
        req.setAttribute("attendStudentAll", attStAll);
        req.getRequestDispatcher("../view/student/attendStudent.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp, Account account, ArrayList<Role> roles) throws ServletException, IOException {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}
