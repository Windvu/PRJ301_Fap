/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import entity.Lecturer;
import java.util.ArrayList;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Vu Minh Quan
 */
public class LecturerDBContext extends DBContext<Lecturer> {

    public ArrayList<Lecturer> listLecturer(String id) {
        ArrayList<Lecturer> arrLec = new ArrayList<>();
        try {
            String sql = """
                         SELECT TOP (1000) [lId]
                               ,[lName]
                               ,[gender]
                               ,[dob]
                               ,[gmail]
                           FROM [Attend_Task].[dbo].[Lecturer]
                           Where lId=?""";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, id);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Lecturer lec = new Lecturer();
                lec.setlID(rs.getString("lId"));
                lec.setlName(rs.getString("lName"));
                lec.setDob(rs.getDate("dob"));
                lec.setGender(rs.getBoolean("gender"));
                lec.setGmail(rs.getString("gmail"));
                arrLec.add(lec);
            }
        } catch (SQLException ex) {
            Logger.getLogger(LecturerDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return arrLec;
    }

    @Override
    public ArrayList<Lecturer> list() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void insert(Lecturer entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void update(Lecturer entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete(Lecturer entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public Lecturer get(int id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    public static void main(String[] args) {
        LecturerDBContext db = new LecturerDBContext();
        String id = "sonnt5";
        ArrayList<Lecturer> arr = db.listLecturer(id);
        for (Lecturer lecturer : arr) {
            System.out.println("id=" + lecturer.getlID());
            System.out.println("id=" + lecturer.getlName());
            System.out.println("id=" + lecturer.getDob());
        }
    }
}
