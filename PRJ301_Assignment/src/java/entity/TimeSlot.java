/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

/**
 *
 * @author Vu Minh Quan
 */
public class TimeSlot {
    private String tID;
    private String tName;
    private String tDescript;

    public TimeSlot() {
    }

    public TimeSlot(String tID, String tName, String tDescript) {
        this.tID = tID;
        this.tName = tName;
        this.tDescript = tDescript;
    }

    public String gettName() {
        return tName;
    }

    public void settName(String tName) {
        this.tName = tName;
    }

   

    public String gettID() {
        return tID;
    }

    public void settID(String tID) {
        this.tID = tID;
    }

    public String gettDescript() {
        return tDescript;
    }

    public void settDescript(String tDescript) {
        this.tDescript = tDescript;
    }

    @Override
    public String toString() {
        return super.toString(); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/OverriddenMethodBody
    }


    
}
