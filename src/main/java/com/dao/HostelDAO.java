package com.dao;

import com.model.Student;
import com.db.DBConnection;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class HostelDAO {

    // Add new student
    public boolean addStudent(Student student) {
        String sql = "INSERT INTO HostelStudents VALUES (?,?,?,?,?,?)";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pst = conn.prepareStatement(sql)) {
            pst.setInt(1, student.getStudentId());
            pst.setString(2, student.getStudentName());
            pst.setString(3, student.getRoomNumber());
            pst.setDate(4, new java.sql.Date(student.getAdmissionDate().getTime()));
            pst.setDouble(5, student.getFeesPaid());
            pst.setDouble(6, student.getPendingFees());
            return pst.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // Update student
    public boolean updateStudent(Student student) {
        String sql = "UPDATE HostelStudents SET StudentName=?, RoomNumber=?, AdmissionDate=?, FeesPaid=?, PendingFees=? WHERE StudentID=?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pst = conn.prepareStatement(sql)) {
            pst.setString(1, student.getStudentName());
            pst.setString(2, student.getRoomNumber());
            pst.setDate(3, new java.sql.Date(student.getAdmissionDate().getTime()));
            pst.setDouble(4, student.getFeesPaid());
            pst.setDouble(5, student.getPendingFees());
            pst.setInt(6, student.getStudentId());
            return pst.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // Delete student
    public boolean deleteStudent(int studentId) {
        String sql = "DELETE FROM HostelStudents WHERE StudentID=?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pst = conn.prepareStatement(sql)) {
            pst.setInt(1, studentId);
            return pst.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // Get student by ID
    public Student getStudentById(int studentId) {
        String sql = "SELECT * FROM HostelStudents WHERE StudentID=?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pst = conn.prepareStatement(sql)) {
            pst.setInt(1, studentId);
            ResultSet rs = pst.executeQuery();
            if (rs.next()) {
                return extractStudentFromResultSet(rs);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    // Get all students
    public List<Student> getAllStudents() {
        List<Student> list = new ArrayList<>();
        String sql = "SELECT * FROM HostelStudents ORDER BY StudentID";
        try (Connection conn = DBConnection.getConnection();
             Statement st = conn.createStatement();
             ResultSet rs = st.executeQuery(sql)) {
            while (rs.next()) {
                list.add(extractStudentFromResultSet(rs));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    // Pending fees students
    public List<Student> getStudentsWithPendingFees() {
        List<Student> list = new ArrayList<>();
        String sql = "SELECT * FROM HostelStudents WHERE PendingFees > 0";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pst = conn.prepareStatement(sql);
             ResultSet rs = pst.executeQuery()) {
            while (rs.next()) {
                list.add(extractStudentFromResultSet(rs));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    // Students by room
    public List<Student> getStudentsByRoom(String roomNumber) {
        List<Student> list = new ArrayList<>();
        String sql = "SELECT * FROM HostelStudents WHERE RoomNumber=?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pst = conn.prepareStatement(sql)) {
            pst.setString(1, roomNumber);
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                list.add(extractStudentFromResultSet(rs));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    // Students by date range
    public List<Student> getStudentsByDateRange(java.util.Date date, java.util.Date date2) {
        List<Student> list = new ArrayList<>();
        String sql = "SELECT * FROM HostelStudents WHERE AdmissionDate BETWEEN ? AND ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pst = conn.prepareStatement(sql)) {
            pst.setDate(1, new java.sql.Date(date.getTime()));
            pst.setDate(2, new java.sql.Date(date2.getTime()));
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                list.add(extractStudentFromResultSet(rs));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    private Student extractStudentFromResultSet(ResultSet rs) throws SQLException {
        Student s = new Student();
        s.setStudentId(rs.getInt("StudentID"));
        s.setStudentName(rs.getString("StudentName"));
        s.setRoomNumber(rs.getString("RoomNumber"));
        s.setAdmissionDate(rs.getDate("AdmissionDate"));
        s.setFeesPaid(rs.getDouble("FeesPaid"));
        s.setPendingFees(rs.getDouble("PendingFees"));
        return s;
    }
}