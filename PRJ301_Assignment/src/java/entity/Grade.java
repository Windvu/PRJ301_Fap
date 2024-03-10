/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

/**
 *
 * @author Vu Minh Quan
 */
public class Grade {
    private int grID;
    private Student student;
    private float score;
    private String comment;

    public Grade() {
    }

    public Grade(int grID, Student student, float score, String comment) {
        this.grID = grID;
        this.student = student;
        this.score = score;
        this.comment = comment;
    }

    public int getGrID() {
        return grID;
    }

    public void setGrID(int grID) {
        this.grID = grID;
    }

    public Student getStudent() {
        return student;
    }

    public void setStudent(Student student) {
        this.student = student;
    }

    public float getScore() {
        return score;
    }

    public void setScore(float score) {
        this.score = score;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    @Override
    public String toString() {
        return super.toString(); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/OverriddenMethodBody
    }
    
    
}
