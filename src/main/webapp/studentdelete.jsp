<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Delete Student</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>body { background: #f0f2f5; } .form-container { max-width: 500px; margin: 100px auto; background: white; padding: 30px; border-radius: 15px; }</style>
</head>
<body>
<div class="container">
    <div class="form-container">
        <h2 class="text-center mb-4 text-danger">❌ Delete Student</h2>
        <% if(request.getAttribute("message") != null) { %>
            <div class="alert alert-success"><%= request.getAttribute("message") %></div>
        <% } %>
        <% if(request.getAttribute("error") != null) { %>
            <div class="alert alert-danger"><%= request.getAttribute("error") %></div>
        <% } %>
        <form action="DeleteStudentServlet" method="post">
            <div class="mb-3">
                <label class="form-label">Student ID to Delete</label>
                <input type="number" name="studentId" class="form-control" required>
            </div>
            <button type="submit" class="btn btn-danger w-100" onclick="return confirm('Are you sure?')">Delete Permanently</button>
            <a href="index.jsp" class="btn btn-secondary w-100 mt-2">Back</a>
        </form>
    </div>
</div>
</body>
</html>