package com.servlet;

import com.dao.HostelDAO;
import com.model.Student;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/AddStudentServlet")
public class AddStudentServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        try {
            int id = Integer.parseInt(request.getParameter("studentId"));
            String name = request.getParameter("studentName");
            String room = request.getParameter("roomNumber");
            Date admissionDate = new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("admissionDate"));
            double feesPaid = Double.parseDouble(request.getParameter("feesPaid"));
            double pendingFees = Double.parseDouble(request.getParameter("pendingFees"));

            Student student = new Student(id, name, room, admissionDate, feesPaid, pendingFees);
            HostelDAO dao = new HostelDAO();
            boolean success = dao.addStudent(student);

            if (success) {
                request.setAttribute("message", "Student added successfully!");
            } else {
                request.setAttribute("error", "Failed to add student. ID may already exist.");
            }
        } catch (Exception e) {
            request.setAttribute("error", "Error: " + e.getMessage());
        }
        request.getRequestDispatcher("studentadd.jsp").forward(request, response);
    }
}