package com.model;

import java.util.Date;

public class Student {
    private int studentId;
    private String studentName;
    private String roomNumber;
    private Date admissionDate;
    private double feesPaid;
    private double pendingFees;

    // Constructors
    public Student() {}

    public Student(int studentId, String studentName, String roomNumber, 
                   Date admissionDate, double feesPaid, double pendingFees) {
        this.studentId = studentId;
        this.studentName = studentName;
        this.roomNumber = roomNumber;
        this.admissionDate = admissionDate;
        this.feesPaid = feesPaid;
        this.pendingFees = pendingFees;
    }

    // Getters and Setters
    public int getStudentId() { return studentId; }
    public void setStudentId(int studentId) { this.studentId = studentId; }
    
    public String getStudentName() { return studentName; }
    public void setStudentName(String studentName) { this.studentName = studentName; }
    
    public String getRoomNumber() { return roomNumber; }
    public void setRoomNumber(String roomNumber) { this.roomNumber = roomNumber; }
    
    public Date getAdmissionDate() { return admissionDate; }
    public void setAdmissionDate(Date admissionDate) { this.admissionDate = admissionDate; }
    
    public double getFeesPaid() { return feesPaid; }
    public void setFeesPaid(double feesPaid) { this.feesPaid = feesPaid; }
    
    public double getPendingFees() { return pendingFees; }
    public void setPendingFees(double pendingFees) { this.pendingFees = pendingFees; }
}