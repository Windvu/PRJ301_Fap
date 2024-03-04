/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

/**
 *
 * @author Vu Minh Quan
 */
public class Subject {
    private String suID;
    private String suName;

    public Subject() {
    }

    public Subject(String suID, String suName) {
        this.suID = suID;
        this.suName = suName;
    }

    public String getSuID() {
        return suID;
    }

    public void setSuID(String suID) {
        this.suID = suID;
    }

    public String getSuName() {
        return suName;
    }

    public void setSuName(String suName) {
        this.suName = suName;
    }

    @Override
    public String toString() {
        return super.toString(); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/OverriddenMethodBody
    }


    
}
