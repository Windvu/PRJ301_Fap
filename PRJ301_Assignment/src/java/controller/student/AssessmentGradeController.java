/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.student;

import controller.authentication.BaseRBACController;
import controller.authentication.BaseRequire;
import dal.AssessmentDBContext;
import entity.Account;
import entity.Assessment;
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
public class AssessmentGradeController extends BaseRBACController {


    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp, Account account, ArrayList<Role> roles) throws ServletException, IOException {
        String sID=null;        
        AssessmentDBContext gradeDB = new AssessmentDBContext();
        ArrayList<Subject> subArr = gradeDB.subjectGrade();        
        ArrayList<Student> stArr=gradeDB.studentArray();
        for(Student student: stArr){
            if(student.getCoreName().equals(account.getUsername())){
                sID=student.getsID();
            }
        }
        
        ArrayList<Assessment> assArr = gradeDB.assessmentGrade(sID);
        req.setAttribute("students", stArr);
        req.setAttribute("grade", assArr);
        req.setAttribute("subject", subArr);
        req.getRequestDispatcher("../view/student/grade.jsp").forward(req, resp);    
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp, Account account, ArrayList<Role> roles) throws ServletException, IOException {
       String sID=null;        
        AssessmentDBContext gradeDB = new AssessmentDBContext();
        ArrayList<Subject> subArr = gradeDB.subjectGrade();        
        ArrayList<Student> stArr=gradeDB.studentArray();
        for(Student student: stArr){
            if(student.getCoreName().equals(account.getUsername())){
                sID=student.getsID();
            }
        }
        
        ArrayList<Assessment> assArr = gradeDB.assessmentGrade(sID);
        req.setAttribute("grade", assArr);
        req.setAttribute("subject", subArr);
        req.getRequestDispatcher("../view/student/grade.jsp").forward(req, resp);  }

}
