<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Reports</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>body { background: #f0f2f5; } .report-card { cursor: pointer; transition: 0.3s; } .report-card:hover { transform: scale(1.02); }</style>
</head>
<body>
<div class="container mt-5">
    <h2 class="text-center mb-4">📊 Reports Dashboard</h2>
    <div class="row g-4">
        <div class="col-md-4">
            <div class="card report-card text-center p-3" onclick="location.href='ReportServlet?type=pending'">
                <div class="card-body">
                    <h4>💰 Pending Fees</h4>
                    <p>Students with outstanding dues</p>
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="card report-card text-center p-3" onclick="location.href='ReportServlet?type=room'">
                <div class="card-body">
                    <h4>🚪 Room-wise Report</h4>
                    <p>Students in a specific room</p>
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="card report-card text-center p-3" onclick="location.href='ReportServlet?type=date'">
                <div class="card-body">
                    <h4>📅 Date Range Report</h4>
                    <p>Students admitted between dates</p>
                </div>
            </div>
        </div>
    </div>
    <div class="text-center mt-4"><a href="index.jsp" class="btn btn-secondary">← Back to Dashboard</a></div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>