/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import entity.Attendence;
import entity.Group;
import entity.Lecturer;
import entity.Lesson;
import entity.Room;
import entity.Student;
import entity.Subject;
import entity.TimeSlot;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Vu Minh Quan
 */
public class LessonDBContext extends DBContext<Lesson> {
    
//Retake attendence
    
    //Update the status of students
    public void UpdateAttendence(String leID, String sID, boolean isPresent, String aDescript) {
        try {
            // Kiểm tra xem mô tả mới có khác với mô tả hiện tại không
            String sql = "UPDATE Attendence SET isPresent=?, aDescript=?, aDate=GETDATE() "
                    + "WHERE leId=? AND sId=? AND (aDescript<>? OR (aDescript=? AND isPresent<>?))";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setBoolean(1, isPresent);
            stm.setString(2, aDescript);
            stm.setString(3, leID);
            stm.setString(4, sID);
            stm.setString(5, aDescript);
            stm.setString(6, aDescript);
            stm.setBoolean(7, isPresent);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(LessonDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    //Take the data in DB to compare
    public ArrayList<Lesson> retakeAttendent() {
        ArrayList<Lesson> lessons = new ArrayList<>();
        try {
            String sql = "SELECT leId,idAttend,  gName, l.lId, l.lName  FROM Lesson les\n"
                    + "join [Group] g on g.gId= les.gId\n"
                    + "join Lecturer l on l.lId=les.lId";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()){
                Lesson les = new Lesson();
                Group gr = new Group();
                Lecturer le = new Lecturer();
                les.setLeID(rs.getString("leId"));
                les.setAttended(rs.getBoolean("idAttend"));
                le.setlName(rs.getString("lName"));
                gr.setgName(rs.getString("gName"));
                les.setGroup(gr);
                le.setlID(rs.getString("lId"));
                les.setLecturer(le);
                lessons.add(les);
            }
        } catch (SQLException ex) {
            Logger.getLogger(LessonDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lessons;
    }

//Attendent lesson   
    public int takeAttendance(String leid, ArrayList<Attendence> atts) {
        int result = 0;
        try {
            connection.setAutoCommit(false);
            //Delete lesson that you want to attend
            String sql_remove_atts = "DELETE Attendence WHERE leId=?";
            PreparedStatement stm_remove_atts = connection.prepareStatement(sql_remove_atts);
            stm_remove_atts.setString(1, leid);
            stm_remove_atts.executeUpdate();
         
            //Insert lesson that you want to attend
            String sql_insert_att = "INSERT INTO [dbo].[Attendence]\n"
                    + "           ([leId]\n"
                    + "           ,[sId]\n"
                    + "           ,[isPresent]\n"
                    + "           ,[aDescript]\n"
                    + "           ,[aDate])\n"
                    + "     VALUES\n"
                    + "           (?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,GETDATE())";
            for (Attendence att : atts) {
                PreparedStatement stm_insert_att = connection.prepareStatement(sql_insert_att);
                stm_insert_att.setString(1, leid);
                stm_insert_att.setString(2, att.getStudent().getsID());
                stm_insert_att.setBoolean(3, att.isIsPresent());
                stm_insert_att.setString(4, att.getaDescription());
                result += stm_insert_att.executeUpdate();
            }

            //Upadte the status of the slot that lecturer attended
            String sql_update_less = "UPDATE Lesson SET idAttend = 1 WHERE leId = ?";
            PreparedStatement stm_update_less = connection.prepareStatement(sql_update_less);
            stm_update_less.setString(1, leid);
            stm_update_less.executeUpdate();
            connection.commit();
        } catch (SQLException ex) {
            Logger.getLogger(LessonDBContext.class.getName()).log(Level.SEVERE, null, ex);
            try {
                connection.rollback();
            } catch (SQLException ex1) {
                Logger.getLogger(LessonDBContext.class.getName()).log(Level.SEVERE, null, ex1);
            }
        } finally {
            try {
                connection.setAutoCommit(true);
            } catch (SQLException ex) {
                Logger.getLogger(LessonDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return result;
    }
    
    //Take the lesson that you choose
    public ArrayList<Attendence> getAttendencesByLesson(String leid) {
        ArrayList<Attendence> atts = new ArrayList<>();
        try {
            String sql = "SELECT\n"
                    + "s.sId, s.sName,\n"
                    + "a.aId,a.isPresent,a.aDescript,a.aDate\n"
                    + "FROM Student s join Enroll e on s.sId=e.sId\n"
                    + "join [Group] g on g.gId= e.gId\n"
                    + "join Lesson les on les.gId=g.gId\n"
                    + "left join Attendence a on a.leId=les.leId\n"
                    + "and a.sId=s.sId\n"
                    + "WHERE les.leId=?";

            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, leid);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Attendence att = new Attendence();
                Student s = new Student();
                Lesson les = new Lesson();
                s.setsID(rs.getString("sId"));
                s.setsName(rs.getString("sName"));
                att.setStudent(s);
                les.setLeID(leid);
                att.setLesson(les);
                att.setaDescription(rs.getString("aDescript"));
                att.setIsPresent(rs.getBoolean("isPresent"));
                att.setaDate(rs.getTimestamp("aDate"));
                atts.add(att);
            }

        } catch (SQLException ex) {
            Logger.getLogger(LessonDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }

        return atts;

    }

    
    
    
//Timetable
    public ArrayList<Lesson> getLessonBy(String lid, Date from, Date to) {
        ArrayList<Lesson> arrLesson = new ArrayList<>();
        try {
            String sql = "SELECT \n"
                    + "le.leId, le.lDate, le.idAttend,\n"
                    + "g.gId, g.gName, sub.suId,sub.suName,\n"
                    + "r.rId, r.rNumber,\n"
                    + "ts.tId,ts.tName, ts.tDescript,\n"
                    + "l.lId, l.lName\n"
                    + "FROM Lesson le \n"
                    + "join Room r on r.rId=le.rId\n"
                    + "join Time_Slot ts on ts.tId=le.tId\n"
                    + "join Lecturer l on l.lId= le.lId\n"
                    + "join [Group] g on g.gId=le.gId\n"
                    + "join Subject sub on sub.suId=g.suId\n"
                    + "WHERE l.lId=? AND le.lDate >=? AND le.lDate <=?";

            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, lid);
            stm.setDate(2, from);
            stm.setDate(3, to);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Lesson le = new Lesson();
                Group g = new Group();
                Subject sub = new Subject();
                Lecturer l = new Lecturer();
                Room r = new Room();
                TimeSlot slot = new TimeSlot();
                le.setLeID(rs.getString("leId"));
                le.setDate(rs.getDate("lDate"));
                le.setAttended(rs.getBoolean("idAttend"));

                g.setgID(rs.getString("gId"));
                g.setgName(rs.getString("gName"));
                sub.setSuID(rs.getString("suId"));
                sub.setSuName(rs.getString("suName"));
                g.setSubject(sub);
                le.setGroup(g);

                l.setlID(rs.getString("lId"));
                l.setlName(rs.getString("lName"));
                le.setLecturer(l);

                r.setrID(rs.getInt("rId"));
                r.setrName(rs.getString("rNumber"));
                le.setRoom(r);

                slot.settID(rs.getString("tId"));
                slot.settName(rs.getString("tName"));
                slot.settDescript(rs.getString("tDescript"));
                le.setSlot(slot);

                arrLesson.add(le);
            }
        } catch (SQLException ex) {
            Logger.getLogger(LessonDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return arrLesson;
    }

    
    
    
    @Override
    public void insert(Lesson entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void update(Lesson entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete(Lesson entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public Lesson get(int id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public ArrayList<Lesson> list() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}
