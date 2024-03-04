/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import entity.TimeSlot;
import java.util.ArrayList;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Vu Minh Quan
 */
public class TimeSlotDBContext  extends DBContext<TimeSlot>{

    @Override
    public ArrayList<TimeSlot> list() {
        ArrayList<TimeSlot> slotArray= new ArrayList<>();
        try {
            String sql="select tId, tName, tDescript from Time_Slot";
            PreparedStatement stm= connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while(rs.next()){
                TimeSlot timeSlot= new TimeSlot();
                timeSlot.settID(rs.getString("tId"));
                timeSlot.settName(rs.getString("tName"));
                timeSlot.settDescript(rs.getString("tDescript"));
                slotArray.add(timeSlot);
            }
        } catch (SQLException ex) {
            Logger.getLogger(TimeSlotDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return slotArray;
    }

    @Override
    public void insert(TimeSlot entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void update(TimeSlot entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete(TimeSlot entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public TimeSlot get(int id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
    
}
