/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.lecturer;

import controller.authentication.BaseRequire;
import dal.LessonDBContext;
import dal.StudentDBContext;
import entity.Account;
import entity.Attendence;
import entity.Lesson;
import entity.Student;
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
public class LecturerAttendentController extends BaseRequire {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp, Account account) throws ServletException, IOException {
        String leid = req.getParameter("id");
        LessonDBContext lesDB = new LessonDBContext();
        ArrayList<Lesson> less = lesDB.retakeAttendent();
        //ArrayList<Attendence> attDB = lesDB.getAttendencesByLesson(leid);
//Take date from Screen       
        StudentDBContext db = new StudentDBContext();
        ArrayList<Student> students = db.getStudentsByLessionId(leid);
        Lesson lesson = new Lesson();
        lesson.setLeID(leid);
        ArrayList<Attendence> atts = new ArrayList<>();
        for (Student student : students) {
            Attendence att = new Attendence();
            att.setStudent(student);
            att.setLesson(lesson);
            att.setaDescription(req.getParameter("description" + student.getsID()));
            att.setIsPresent(req.getParameter("present" + student.getsID()).equals("yes"));
            atts.add(att);
        }
//Change data 

        for (Lesson les : less) {
            if (les.getLeID().equals(leid)) {
                lesson = les;
            }
        }
        //First Attendence
        if (lesson.isAttended() == false) {
            lesDB.takeAttendance(leid, atts);
            resp.sendRedirect("attendence?id=" + leid);
        }
        //Re-attendent  
        if (lesson.isAttended() == true) {
            for (Attendence attSrceen : atts) {//Data from Screen                                                  
                lesDB.UpdateAttendence(leid, attSrceen.getStudent().getsID(), attSrceen.isIsPresent());
            }
        }
        resp.sendRedirect("attendence?id=" + leid);

    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp, Account account) throws ServletException, IOException {
        String leid = req.getParameter("id");
        LessonDBContext lesDB = new LessonDBContext();
        ArrayList<Attendence> atts = lesDB.getAttendencesByLesson(leid);
        ArrayList<Lesson> less = lesDB.retakeAttendent();
        req.setAttribute("lessons", less);
        req.setAttribute("atts", atts);
        req.getRequestDispatcher("../view/lecturer/attendence.jsp").forward(req, resp);
    }

}
