<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Week11 - StudentJDBC</title>
</head>
<body>
    <h1>Week11 — StudentJDBC</h1>
    <ul>
        <li><a href="<%= request.getContextPath() %>/student/list">학생 목록</a></li>
        <li><a href="<%= request.getContextPath() %>/student/form">학생 등록</a></li>
        <li><a href="student-class-diagram.png">클래스 다이어그램 보기</a></li>
    </ul>
</body>
</html>
