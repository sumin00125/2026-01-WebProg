<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Error</title>
</head>
<body>
    <h2>오류 발생</h2>
    <p><%= request.getAttribute("error") != null ? request.getAttribute("error") : "알 수 없는 오류" %></p>
    <p><a href="<%= request.getContextPath() %>/student/list">목록으로</a></p>
</body>
</html>
