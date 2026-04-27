package com.servlet;

import com.dao.HostelDAO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/DeleteStudentServlet")
public class DeleteStudentServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        try {
            int id = Integer.parseInt(request.getParameter("studentId"));
            HostelDAO dao = new HostelDAO();
            boolean success = dao.deleteStudent(id);

            if (success) {
                request.setAttribute("message", "Student deleted successfully!");
            } else {
                request.setAttribute("error", "Student ID not found!");
            }
        } catch (Exception e) {
            request.setAttribute("error", "Error: " + e.getMessage());
        }
        request.getRequestDispatcher("studentdelete.jsp").forward(request, response);
    }
}