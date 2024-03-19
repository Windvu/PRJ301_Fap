/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import entity.Subject;
import java.util.ArrayList;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;
/**
 *
 * @author Vu Minh Quan
 */
public class SubjectDBContext extends DBContext<Subject> {

    @Override
    public ArrayList<Subject> list() {
        ArrayList<Subject>  arrSubject= new ArrayList<>();
        try {
            String sql = "SELECT TOP (1000) [suId]\n"
                    + "      ,[suName]\n"
                    + "  FROM [Attend_Task].[dbo].[Subject]";
            PreparedStatement stm=connection.prepareStatement(sql);
            ResultSet rs= stm.executeQuery();
            while(rs.next()){
                Subject sub = new Subject();
                sub.setSuID(rs.getString("suId"));
                sub.setSuName(rs.getString("suName"));
                arrSubject.add(sub);
            }
        } catch (SQLException ex) {
            Logger.getLogger(SubjectDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return arrSubject;
    }

    @Override
    public void insert(Subject entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void update(Subject entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete(Subject entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public Subject get(int id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}
