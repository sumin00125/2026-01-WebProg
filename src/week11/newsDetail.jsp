<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="bean_exam.News" %>
<%
    News news = (News) request.getAttribute("news");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>News Detail</title>
    <style>
        body { font-family: Arial, sans-serif; }
        .panel { border: 1px solid #ccc; border-radius: 8px; padding: 16px; background: #fafafa; }
        .label { color: #666; font-size: 14px; margin-top: 10px; }
        .value { font-size: 18px; margin-top: 4px; }
        .content { white-space: pre-wrap; line-height: 1.6; }
        .buttons { margin-top: 16px; }
        .btn { padding: 8px 14px; border: 1px solid #bbb; border-radius: 4px; text-decoration: none; cursor: pointer; margin-right: 6px; }
    </style>
</head>
<body>
    <h2>뉴스 상세</h2>

    <div class="panel">
        <div class="label">ID</div>
        <div class="value"><%= news.getId() %></div>

        <div class="label">Title</div>
        <div class="value"><%= news.getTitle() %></div>

        <div class="label">Writer</div>
        <div class="value"><%= news.getWriter() %></div>

        <div class="label">Date</div>
        <div class="value"><%= news.getDate() %></div>

        <div class="label">Content</div>
        <div class="value content"><%= news.getContent() %></div>

        <div class="buttons">
            <a class="btn" href="<%= request.getContextPath() %>/news/form?id=<%= news.getId() %>">수정</a>
            <a class="btn" href="<%= request.getContextPath() %>/news/list">목록으로</a>
        </div>
    </div>
</body>
</html>