/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.lecturer;

import controller.authentication.BaseRBACController;
import dal.LessonDBContext;
import dal.TimeSlotDBContext;
import entity.Account;
import entity.Lesson;
import entity.Role;
import entity.TimeSlot;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Date;
import java.util.ArrayList;
import util.DateTimeHelper;

/**
 *
 * @author Vu Minh Quan
 */
public class TimeTableController extends BaseRBACController {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp, Account account, ArrayList<Role> roles) throws ServletException, IOException {
        String lID= req.getParameter("id");
        TimeSlotDBContext timeDB = new TimeSlotDBContext();
        ArrayList<TimeSlot> slots = timeDB.list();

        String raw_from = req.getParameter("from");
        String raw_to = req.getParameter("to");
        Date from = null;
        Date to = null;
        java.util.Date today = new java.util.Date();
        
        //Take the begin day
        if (raw_from == null) {
            from = DateTimeHelper.convertUtilToSql(DateTimeHelper.getBeginningOfWeek(today));
        } else {
            from = Date.valueOf(raw_from);
        }

        //Take the end day        
        if (raw_to == null) {
            java.util.Date beginWeek = DateTimeHelper.getBeginningOfWeek(today);
            to = DateTimeHelper.convertUtilToSql(DateTimeHelper.addDaysToDate(beginWeek, 6));
        } else {
            to = Date.valueOf(raw_to);
        }

        LessonDBContext lessDB = new LessonDBContext();
        ArrayList<Lesson> lessons = lessDB.getLessonBy(lID, from, to);

        req.setAttribute("coreName", account.getUsername());
        req.setAttribute("dates", DateTimeHelper.toList(from, to));
        req.setAttribute("from", from);
        req.setAttribute("to", to);
        req.setAttribute("slots", slots);
        req.setAttribute("lessons", lessons);
        req.getRequestDispatcher("../view/lecturer/timetable.jsp").forward(req, resp);    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp, Account account, ArrayList<Role> roles) throws ServletException, IOException {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}
