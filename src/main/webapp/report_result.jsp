<%@ page import="java.util.List, com.model.Student" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    List<Student> students = (List<Student>) request.getAttribute("students");
    String title = (String) request.getAttribute("reportTitle");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Report Result</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-4">
    <h3 class="text-center mb-3"><%= title %></h3>
    <% if(request.getAttribute("error") != null) { %>
        <div class="alert alert-warning"><%= request.getAttribute("error") %></div>
    <% } else if(students != null && !students.isEmpty()) { %>
        <table class="table table-bordered table-striped">
            <thead class="table-dark">
                <tr><th>ID</th><th>Name</th><th>Room</th><th>Admission Date</th><th>Fees Paid</th><th>Pending Fees</th></tr>
            </thead>
            <tbody>
                <% for(Student s : students) { %>
                <tr>
                    <td><%= s.getStudentId() %></td>
                    <td><%= s.getStudentName() %></td>
                    <td><%= s.getRoomNumber() %></td>
                    <td><%= s.getAdmissionDate() %></td>
                    <td>₹<%= s.getFeesPaid() %></td>
                    <td>₹<%= s.getPendingFees() %></td>
                </tr>
                <% } %>
            </tbody>
        </table>
    <% } else { %>
        <div class="alert alert-info">No records found matching the criteria.</div>
    <% } %>
    <div class="text-center mt-3">
        <a href="reports.jsp" class="btn btn-secondary">New Report</a>
        <a href="index.jsp" class="btn btn-primary">Dashboard</a>
    </div>
</div>
</body>
</html>