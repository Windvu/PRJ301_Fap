/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import entity.Assessment;
import entity.Grade;
import entity.Student;
import entity.Subject;
import java.util.ArrayList;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Vu Minh Quan
 */
public class AssessmentDBContext extends DBContext<Assessment> {

    public ArrayList<Student> studentArray() {
        ArrayList<Student> studentArr = new ArrayList<>();
        try {

            String sql = "SELECT sId, coreName FROM Student";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while(rs.next())
            {
                Student student= new Student();
                student.setsID(rs.getString("sId"));
                student.setCoreName(rs.getString("coreName"));
                studentArr.add(student);
            }
        } catch (SQLException ex) {
            Logger.getLogger(AssessmentDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return studentArr;
    }
//The score of subjects

    public ArrayList<Assessment> assessmentGrade(String sID) {
        ArrayList<Assessment> assDB = new ArrayList<>();
        try {
            String sql = "SELECT \n"
                    + "ass.aId, ass.name, ass.suId,ass.weight,ass.gid, ass.category,\n"
                    + "gr.sId, gr.score, gr.comment\n"
                    + "FROM Assessment ass\n"
                    + "join Grade gr on gr.gid=ass.gid\n"
                    + "where gr.sId=?";

            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, sID);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Assessment ass = new Assessment();
                Subject sub = new Subject();
                Grade gr = new Grade();
                Student st = new Student();
                ass.setAssID(rs.getInt("aId"));
                ass.setAssName(rs.getString("name"));
                sub.setSuID(rs.getString("suId"));
                ass.setSubject(sub);
                ass.setWeight(rs.getFloat("weight"));
                gr.setGrID(rs.getInt("gid"));
                st.setsID(rs.getString("sId"));
                gr.setStudent(st);
                gr.setScore(rs.getFloat("score"));
                gr.setComment(rs.getString("comment"));
                ass.setGrade(gr);
                ass.setCategory(rs.getString("category"));
                assDB.add(ass);
            }
        } catch (SQLException ex) {
            Logger.getLogger(AssessmentDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return assDB;
    }
//The list of subject    

    public ArrayList<Subject> subjectGrade() {
        ArrayList<Subject> subGrade = new ArrayList<>();
        try {
            String sql = "SELECT suId, suName from Subject";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Subject sub = new Subject();
                sub.setSuID(rs.getString("suId"));
                sub.setSuName(rs.getString("suName"));
                subGrade.add(sub);
            }
        } catch (SQLException ex) {
            Logger.getLogger(AssessmentDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return subGrade;
    }

    @Override
    public ArrayList<Assessment> list() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void insert(Assessment entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void update(Assessment entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete(Assessment entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public Assessment get(int id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}
