<%@ page import="com.dao.HostelDAO, com.model.Student" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String studentIdParam = request.getParameter("id");
    Student student = null;
    if(studentIdParam != null && !studentIdParam.isEmpty()) {
        student = new HostelDAO().getStudentById(Integer.parseInt(studentIdParam));
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update Student</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>body { background: #f0f2f5; } .form-container { max-width: 600px; margin: 50px auto; background: white; padding: 30px; border-radius: 15px; }</style>
</head>
<body>
<div class="container">
    <div class="form-container">
        <h2 class="text-center mb-4">✏️ Update Student</h2>
        <% if(request.getAttribute("message") != null) { %>
            <div class="alert alert-success"><%= request.getAttribute("message") %></div>
        <% } %>
        <% if(request.getAttribute("error") != null) { %>
            <div class="alert alert-danger"><%= request.getAttribute("error") %></div>
        <% } %>
        <form action="UpdateStudentServlet" method="post">
            <div class="mb-3">
                <label class="form-label">Enter Student ID to Update</label>
                <input type="number" name="studentId" id="searchId" class="form-control" value="<%= student != null ? student.getStudentId() : "" %>" required>
                <button type="button" class="btn btn-secondary mt-2" onclick="fetchStudent()">Load Details</button>
            </div>
            <div id="studentDetails">
                <div class="mb-3">
                    <label class="form-label">Student Name</label>
                    <input type="text" name="studentName" class="form-control" value="<%= student != null ? student.getStudentName() : "" %>" required>
                </div>
                <div class="mb-3">
                    <label class="form-label">Room Number</label>
                    <input type="text" name="roomNumber" class="form-control" value="<%= student != null ? student.getRoomNumber() : "" %>" required>
                </div>
                <div class="mb-3">
                    <label class="form-label">Admission Date</label>
                    <input type="date" name="admissionDate" class="form-control" value="<%= student != null ? student.getAdmissionDate() : "" %>" required>
                </div>
                <div class="mb-3">
                    <label class="form-label">Fees Paid</label>
                    <input type="number" step="0.01" name="feesPaid" class="form-control" value="<%= student != null ? student.getFeesPaid() : "" %>" required>
                </div>
                <div class="mb-3">
                    <label class="form-label">Pending Fees</label>
                    <input type="number" step="0.01" name="pendingFees" class="form-control" value="<%= student != null ? student.getPendingFees() : "" %>" required>
                </div>
            </div>
            <button type="submit" class="btn btn-warning w-100">Update Student</button>
            <a href="index.jsp" class="btn btn-secondary w-100 mt-2">Back</a>
        </form>
    </div>
</div>
<script>
function fetchStudent() {
    let id = document.getElementById("searchId").value;
    if(id) window.location.href = "studentupdate.jsp?id=" + id;
}
</script>
</body>
</html>