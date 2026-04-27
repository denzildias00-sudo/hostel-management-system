<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String reportType = (String) request.getAttribute("reportType");
    if(reportType == null) reportType = request.getParameter("type");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Report Form</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5">
    <div class="card shadow-lg p-4" style="max-width: 500px; margin: auto;">
        <h3 class="text-center mb-3">Generate Report</h3>
        <form action="ReportCriteriaServlet" method="post">
            <input type="hidden" name="reportType" value="<%= reportType %>">
            
            <% if("pending".equals(reportType)) { %>
                <p class="alert alert-info">Showing all students with pending fees > 0</p>
                <button type="submit" class="btn btn-primary w-100">Generate Report</button>
            <% } else if("room".equals(reportType)) { %>
                <div class="mb-3">
                    <label class="form-label">Room Number</label>
                    <input type="text" name="roomNumber" class="form-control" placeholder="e.g., A-101" required>
                </div>
                <button type="submit" class="btn btn-primary w-100">Get Room Report</button>
            <% } else if("date".equals(reportType)) { %>
                <div class="mb-3">
                    <label class="form-label">From Date</label>
                    <input type="date" name="fromDate" class="form-control" required>
                </div>
                <div class="mb-3">
                    <label class="form-label">To Date</label>
                    <input type="date" name="toDate" class="form-control" required>
                </div>
                <button type="submit" class="btn btn-primary w-100">Get Date Range Report</button>
            <% } %>
            <a href="reports.jsp" class="btn btn-secondary w-100 mt-2">Back</a>
        </form>
    </div>
</div>
</body>
</html>