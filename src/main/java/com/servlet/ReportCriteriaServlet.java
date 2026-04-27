package com.servlet;

import com.dao.HostelDAO;
import com.model.Student;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ReportCriteriaServlet")
public class ReportCriteriaServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        String reportType = request.getParameter("reportType");
        HostelDAO dao = new HostelDAO();
        List<Student> students = null;

        try {
            if ("pending".equals(reportType)) {
                students = dao.getStudentsWithPendingFees();
                request.setAttribute("reportTitle", "Students with Pending Fees");
            } 
            else if ("room".equals(reportType)) {
                String roomNo = request.getParameter("roomNumber");
                students = dao.getStudentsByRoom(roomNo);
                request.setAttribute("reportTitle", "Students in Room: " + roomNo);
            } 
            else if ("date".equals(reportType)) {
                String fromDate = request.getParameter("fromDate");
                String toDate = request.getParameter("toDate");
                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                students = dao.getStudentsByDateRange(sdf.parse(fromDate), sdf.parse(toDate));
                request.setAttribute("reportTitle", "Students Admitted from " + fromDate + " to " + toDate);
            }
            
            if (students == null || students.isEmpty()) {
                request.setAttribute("error", "No records found!");
            } else {
                request.setAttribute("students", students);
            }
        } catch (Exception e) {
            request.setAttribute("error", "Error generating report: " + e.getMessage());
        }
        request.getRequestDispatcher("report_result.jsp").forward(request, response);
    }
}