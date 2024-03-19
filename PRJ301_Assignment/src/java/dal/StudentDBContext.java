/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.*;
import entity.Student;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Vu Minh Quan
 */
public class StudentDBContext extends DBContext<Student> {

    public ArrayList<Student> getStudentsByLessionId(String leid) {
        ArrayList<Student> students = new ArrayList<>();
        try {

            String sql = "SELECT\n"
                    + "s.sId, s.sName\n"
                    + "FROM Student s\n"
                    + "				join Enroll e on e.sId=s.sId\n"
                    + "				join [Group] g on e.gId=g.gId\n"
                    + "				join Lesson les on les.gId=g.gId\n"
                    + "where les.leId=?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, leid);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Student s = new Student();
                s.setsID(rs.getString("sId"));
                s.setsName(rs.getString("sName"));
                students.add(s);
            }

        } catch (SQLException ex) {
            Logger.getLogger(StudentDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return students;
    }

    public ArrayList<Student> list(String coreName) {
        ArrayList<Student> arrStudent = new ArrayList<>();
        try {
            String sql = "SELECT TOP (1000) [sId]\n"
                    + "      ,[sName]\n"
                    + "      ,[gender]\n"
                    + "      ,[dob]\n"
                    + "      ,[gmail]\n"
                    + "      ,[coreName]\n"
                    + "  FROM [Attend_Task].[dbo].[Student]\n"
                    + "  Where coreName=?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, coreName);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Student s = new Student();
                s.setsID(rs.getString("sId"));
                s.setsName(rs.getString("sName"));
                s.setGender(rs.getBoolean("gender"));
                s.setCoreName(rs.getString("coreName"));
                s.setGmail(rs.getString("gmail"));
                s.setDob(rs.getDate("dob"));
                arrStudent.add(s);
            }
        } catch (SQLException ex) {
            Logger.getLogger(StudentDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return arrStudent;
    }

    @Override
    public void insert(Student entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void update(Student entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete(Student entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public Student get(int id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public ArrayList<Student> list() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}
