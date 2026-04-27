<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hostel Management System</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body { background: linear-gradient(135deg, #667eea 0%, #764ba2 100%); min-height: 100vh; }
        .dashboard-card { transition: transform 0.3s; border-radius: 15px; box-shadow: 0 10px 20px rgba(0,0,0,0.1); }
        .dashboard-card:hover { transform: translateY(-5px); }
        .card-icon { font-size: 2.5rem; margin-bottom: 1rem; }
        .navbar-brand { font-weight: bold; font-size: 1.5rem; }
    </style>
</head>
<body>
    <nav class="navbar navbar-dark bg-dark">
        <div class="container">
            <span class="navbar-brand">🏠 Hostel Management System</span>
        </div>
    </nav>
    <div class="container mt-5">
        <div class="row g-4">
            <div class="col-md-4">
                <div class="card dashboard-card text-center p-3">
                    <div class="card-body">
                        <div class="card-icon">➕</div>
                        <h5 class="card-title">Add Student</h5>
                        <p class="card-text">Register new hostel students</p>
                        <a href="studentadd.jsp" class="btn btn-primary">Go →</a>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card dashboard-card text-center p-3">
                    <div class="card-body">
                        <div class="card-icon">✏️</div>
                        <h5 class="card-title">Update Student</h5>
                        <p class="card-text">Modify student details</p>
                        <a href="studentupdate.jsp" class="btn btn-warning">Go →</a>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card dashboard-card text-center p-3">
                    <div class="card-body">
                        <div class="card-icon">❌</div>
                        <h5 class="card-title">Delete Student</h5>
                        <p class="card-text">Remove student records</p>
                        <a href="studentdelete.jsp" class="btn btn-danger">Go →</a>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card dashboard-card text-center p-3">
                    <div class="card-body">
                        <div class="card-icon">📋</div>
                        <h5 class="card-title">View Students</h5>
                        <p class="card-text">List all or search by ID</p>
                        <a href="DisplayStudentsServlet" class="btn btn-info">Go →</a>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card dashboard-card text-center p-3">
                    <div class="card-body">
                        <div class="card-icon">📊</div>
                        <h5 class="card-title">Reports</h5>
                        <p class="card-text">Pending fees, Room-wise, Date range</p>
                        <a href="reports.jsp" class="btn btn-success">Go →</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>