package com.servlet;

import com.dao.HostelDAO;
import com.model.Student;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/DisplayStudentsServlet")
public class DisplayStudentsServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        HostelDAO dao = new HostelDAO();
        String searchId = request.getParameter("searchId");
        
        if (searchId != null && !searchId.isEmpty()) {
            try {
                int id = Integer.parseInt(searchId);
                Student student = dao.getStudentById(id);
                if (student != null) {
                    request.setAttribute("student", student);
                } else {
                    request.setAttribute("error", "Student ID not found!");
                }
            } catch (NumberFormatException e) {
                request.setAttribute("error", "Invalid ID format");
            }
        } else {
            List<Student> students = dao.getAllStudents();
            request.setAttribute("students", students);
        }
        request.getRequestDispatcher("studentdisplay.jsp").forward(request, response);
    }
}