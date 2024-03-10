/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

/**
 *
 * @author Vu Minh Quan
 */
public class Assessment {
    private int assID;
    private String assName;
    private Subject subject;
    private float weight;
    private String category;
    private Grade grade;

    public Assessment() {
    }

    public Assessment(int assID, String assName, Subject subject, float weight, String category, Grade grade) {
        this.assID = assID;
        this.assName = assName;
        this.subject = subject;
        this.weight = weight;
        this.category = category;
        this.grade = grade;
    }

    public int getAssID() {
        return assID;
    }

    public void setAssID(int assID) {
        this.assID = assID;
    }

    public String getAssName() {
        return assName;
    }

    public void setAssName(String assName) {
        this.assName = assName;
    }

    public Subject getSubject() {
        return subject;
    }

    public void setSubject(Subject subject) {
        this.subject = subject;
    }

    public float getWeight() {
        return weight;
    }

    public void setWeight(float weight) {
        this.weight = weight;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public Grade getGrade() {
        return grade;
    }

    public void setGrade(Grade grade) {
        this.grade = grade;
    }

    @Override
    public String toString() {
        return super.toString(); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/OverriddenMethodBody
    }
    
    
}