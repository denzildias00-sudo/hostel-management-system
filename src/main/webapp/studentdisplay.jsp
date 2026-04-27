<%@ page import="java.util.List, com.model.Student" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    List<Student> students = (List<Student>) request.getAttribute("students");
    Student singleStudent = (Student) request.getAttribute("student");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>View Students</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-4">
    <h2 class="text-center mb-4">📋 Student Records</h2>
    <form class="row g-3 mb-4" method="get" action="DisplayStudentsServlet">
        <div class="col-auto">
            <input type="number" name="searchId" class="form-control" placeholder="Search by Student ID">
        </div>
        <div class="col-auto">
            <button type="submit" class="btn btn-primary">Search</button>
            <a href="DisplayStudentsServlet" class="btn btn-secondary">Show All</a>
        </div>
    </form>
    
    <% if(request.getAttribute("error") != null) { %>
        <div class="alert alert-warning"><%= request.getAttribute("error") %></div>
    <% } %>
    
    <% if(singleStudent != null) { %>
        <table class="table table-bordered table-striped">
            <tr><th>ID</th><td><%= singleStudent.getStudentId() %></td></tr>
            <tr><th>Name</th><td><%= singleStudent.getStudentName() %></td></tr>
            <tr><th>Room</th><td><%= singleStudent.getRoomNumber() %></td></tr>
            <tr><th>Admission Date</th><td><%= singleStudent.getAdmissionDate() %></td></tr>
            <tr><th>Fees Paid</th><td>₹<%= singleStudent.getFeesPaid() %></td></tr>
            <tr><th>Pending Fees</th><td>₹<%= singleStudent.getPendingFees() %></td></tr>
        </table>
    <% } else if(students != null && !students.isEmpty()) { %>
        <table class="table table-bordered table-hover">
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
                    <td class="<%= s.getPendingFees() > 0 ? "text-danger fw-bold" : "" %>">₹<%= s.getPendingFees() %></td>
                </tr>
                <% } %>
            </tbody>
        </table>
    <% } else if(students != null) { %>
        <div class="alert alert-info">No students found.</div>
    <% } %>
    <a href="index.jsp" class="btn btn-secondary mt-3">Back to Dashboard</a>
</div>
</body>
</html>