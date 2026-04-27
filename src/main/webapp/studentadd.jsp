<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Student</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>body { background: #f0f2f5; } .form-container { max-width: 600px; margin: 50px auto; background: white; padding: 30px; border-radius: 15px; box-shadow: 0 0 20px rgba(0,0,0,0.1); }</style>
</head>
<body>
<div class="container">
    <div class="form-container">
        <h2 class="text-center mb-4">➕ Add New Student</h2>
        <% if(request.getAttribute("message") != null) { %>
            <div class="alert alert-success"><%= request.getAttribute("message") %></div>
        <% } %>
        <% if(request.getAttribute("error") != null) { %>
            <div class="alert alert-danger"><%= request.getAttribute("error") %></div>
        <% } %>
        <form action="AddStudentServlet" method="post">
            <div class="mb-3">
                <label class="form-label">Student ID</label>
                <input type="number" name="studentId" class="form-control" required>
            </div>
            <div class="mb-3">
                <label class="form-label">Student Name</label>
                <input type="text" name="studentName" class="form-control" required>
            </div>
            <div class="mb-3">
                <label class="form-label">Room Number</label>
                <input type="text" name="roomNumber" class="form-control" placeholder="e.g., A-101" required>
            </div>
            <div class="mb-3">
                <label class="form-label">Admission Date</label>
                <input type="date" name="admissionDate" class="form-control" required>
            </div>
            <div class="mb-3">
                <label class="form-label">Fees Paid (₹)</label>
                <input type="number" step="0.01" name="feesPaid" class="form-control" required>
            </div>
            <div class="mb-3">
                <label class="form-label">Pending Fees (₹)</label>
                <input type="number" step="0.01" name="pendingFees" class="form-control" required>
            </div>
            <button type="submit" class="btn btn-primary w-100">Register Student</button>
            <a href="index.jsp" class="btn btn-secondary w-100 mt-2">Back to Dashboard</a>
        </form>
    </div>
</div>
</body>
</html>