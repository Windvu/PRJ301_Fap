/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

import java.util.ArrayList;

/**
 *
 * @author Vu Minh Quan
 */
public class Role {
    private int roID;
    private String roName;
    private ArrayList<Account> accounts = new ArrayList<>();
    private ArrayList<Feature> features = new ArrayList<>();
    
    public Role() {
    }

    public ArrayList<Account> getAccounts() {
        return accounts;
    }

    public void setAccounts(ArrayList<Account> accounts) {
        this.accounts = accounts;
    }

    public ArrayList<Feature> getFeatures() {
        return features;
    }

    public void setFeatures(ArrayList<Feature> features) {
        this.features = features;
    }

    public Role(int roID, String roName) {
        this.roID = roID;
        this.roName = roName;
    }

    public int getRoID() {
        return roID;
    }

    public void setRoID(int roID) {
        this.roID = roID;
    }

    public String getRoName() {
        return roName;
    }

    public void setRoName(String roName) {
        this.roName = roName;
    }


    
    
}
