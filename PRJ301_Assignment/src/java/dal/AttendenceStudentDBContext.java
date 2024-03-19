/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import entity.Attendence;
import entity.Group;
import entity.Lecturer;
import entity.Lesson;
import entity.Student;
import entity.Subject;
import entity.TimeSlot;
import java.util.ArrayList;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Vu Minh Quan
 */
public class AttendenceStudentDBContext extends DBContext<Attendence> {

    public ArrayList<Attendence> arrAttAll(String coreName, String subName) {
        ArrayList<Attendence> arrAttend = new ArrayList<>();
        try {
            String sql = "SELECT \n"
                    + "s.sId, s.coreName, sub.suId, sub.suName,le.leId, le.idAttend, ts.tId, ts.tDescript, le.lDate,le.lId,gr.gName\n"
                    + "FROM Student s\n"
                    + "join Enroll en on en.sId=s.sId\n"
                    + "join [Group] gr on gr.gId=en.gId\n"
                    + "join Lesson le on le.gId=gr.gId\n"
                    + "join Subject sub on sub.suId= gr.suId\n"
                    + "join Time_Slot ts on ts.tId=le.tId\n"
                    + "Where s.coreName=? and sub.suId=?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, coreName);
            stm.setString(2, subName);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Attendence att = new Attendence();
                Student s = new Student();
                Group gr = new Group();
                Subject sub = new Subject();
                Lesson les = new Lesson();
                TimeSlot time = new TimeSlot();
                Lecturer l = new Lecturer();
                s.setsID(rs.getString("sId"));
                s.setCoreName(rs.getString("coreName"));
                att.setStudent(s);
                sub.setSuID(rs.getString("suId"));
                sub.setSuName(rs.getString("suName"));
                gr.setSubject(sub);
                gr.setgName(rs.getString("gName"));
                time.settID(rs.getString("tId"));
                les.setLeID(rs.getString("leId"));
                l.setlID(rs.getString("lId"));
                les.setLecturer(l);
                time.settDescript(rs.getString("tDescript"));
                les.setAttended(rs.getBoolean("idAttend"));
                les.setGroup(gr);
                les.setDate(rs.getDate("lDate"));
                les.setSlot(time);
                att.setLesson(les);
                arrAttend.add(att);

            }
        } catch (SQLException ex) {
            Logger.getLogger(AttendenceStudentDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return arrAttend;

    }

    public ArrayList<Attendence> arrAtt(String coreName, String subName) {
        ArrayList<Attendence> arrAttend = new ArrayList<>();
        try {
            String sql = "SELECT \n"
                    + "s.sId, s.coreName, sub.suId, sub.suName,att.isPresent,le.leId, le.idAttend, ts.tId, ts.tDescript, le.lDate,le.lId,gr.gName\n"
                    + "FROM Student s\n"
                    + "join Attendence att on att.sId=s.sId\n"
                    + "join Lesson le on le.leId=att.leId\n"
                    + "join [Group] gr on gr.gId=le.gId\n"
                    + "join Subject sub on sub.suId= gr.suId\n"
                    + "join Time_Slot ts on ts.tId=le.tId\n"
                    + "Where s.coreName=? and sub.suId=?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, coreName);
            stm.setString(2, subName);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Attendence att = new Attendence();
                Student s = new Student();
                Group gr = new Group();
                Subject sub = new Subject();
                Lesson les = new Lesson();
                Lecturer l = new Lecturer();
                TimeSlot time = new TimeSlot();
                att.setIsPresent(rs.getBoolean("isPresent"));
                s.setsID(rs.getString("sId"));
                s.setCoreName(rs.getString("coreName"));
                att.setStudent(s);
                sub.setSuID(rs.getString("suId"));
                sub.setSuName(rs.getString("suName"));
                gr.setSubject(sub);
                gr.setgName(rs.getString("gName"));
                time.settID(rs.getString("tId"));
                time.settDescript(rs.getString("tDescript"));
                les.setAttended(rs.getBoolean("idAttend"));
                les.setLeID(rs.getString("leId"));
                l.setlID(rs.getString("lId"));
                les.setLecturer(l);
                les.setGroup(gr);
                les.setDate(rs.getDate("lDate"));
                les.setSlot(time);
                att.setLesson(les);
                arrAttend.add(att);

            }
        } catch (SQLException ex) {
            Logger.getLogger(AttendenceStudentDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return arrAttend;

    }

    @Override
    public ArrayList<Attendence> list() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void insert(Attendence entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void update(Attendence entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete(Attendence entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public Attendence get(int id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    public static void main(String[] args) {
        AttendenceStudentDBContext dbContext = new AttendenceStudentDBContext();

        // Gọi phương thức arrAtt() để lấy danh sách dữ liệu
        ArrayList<Attendence> attendenceList = dbContext.arrAtt("coreName_value", "subName_value");

        // In ra danh sách dữ liệu
        for (Attendence att : attendenceList) {
            System.out.println("Student ID: " + att.getStudent().getsID());
            System.out.println("Core Name: " + att.getStudent().getCoreName());
            System.out.println("Subject ID: " + att.getLesson().getGroup().getSubject().getSuID());
            System.out.println("Subject Name: " + att.getLesson().getGroup().getSubject().getSuName());
            System.out.println("Attendance ID: " + att.getLesson().isAttended());
            System.out.println("Time Slot ID: " + att.getLesson().getSlot().gettID());
            System.out.println("Time Slot Description: " + att.getLesson().getSlot().gettDescript());
            System.out.println("Lesson Date: " + att.getLesson().getDate());
            System.out.println("-----------------------------------");
        }
    }

}
