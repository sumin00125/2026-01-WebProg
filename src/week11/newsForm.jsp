<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="bean_exam.News" %>
<%
    News news = (News) request.getAttribute("news");
    String mode = (String) request.getAttribute("mode");
    boolean editMode = news != null && "edit".equals(mode);
    String actionUrl = editMode ? "/news/update" : "/news/insert";
    String buttonLabel = editMode ? "수정" : "등록";
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title><%= editMode ? "뉴스 수정" : "뉴스 등록" %></title>
    <style>
        body { font-family: Arial, sans-serif; }
        .panel { border: 1px solid #ccc; border-radius: 8px; padding: 16px; margin-bottom: 16px; background: #fafafa; }
        .news-card { border-left: 4px solid #0b6e4f; background: #eefbf5; }
        label { display: block; margin: 8px 0 4px; }
        input, textarea { width: 520px; max-width: 100%; padding: 8px; }
        textarea { min-height: 180px; }
        .buttons { margin-top: 16px; }
        .btn { padding: 8px 14px; border: 1px solid #bbb; border-radius: 4px; text-decoration: none; cursor: pointer; }
    </style>
</head>
<body>
    <h2><%= editMode ? "뉴스 수정" : "뉴스 등록" %></h2>

    <%
        if (editMode) {
    %>
    <div class="panel news-card">
        <strong>수정 중인 뉴스</strong>
        <div>ID: <%= news.getId() %></div>
        <div>Title: <%= news.getTitle() %></div>
        <div>Writer: <%= news.getWriter() %></div>
        <div>Date: <%= news.getDate() %></div>
    </div>
    <%
        }
    %>

    <form class="panel" action="<%= request.getContextPath() %><%= actionUrl %>" method="post">
        <%
            if (editMode) {
        %>
        <input type="hidden" name="id" value="<%= news.getId() %>">
        <%
            }
        %>
        <label>Title</label>
        <input type="text" name="title" value="<%= editMode ? news.getTitle() : "" %>" required>

        <label>Content</label>
        <textarea name="content" required><%= editMode ? news.getContent() : "" %></textarea>

        <label>Writer</label>
        <input type="text" name="writer" value="<%= editMode ? news.getWriter() : "" %>" required>

        <label>Date</label>
        <input type="date" name="date" value="<%= editMode ? news.getDate() : "" %>">

        <div class="buttons">
            <button class="btn" type="submit"><%= buttonLabel %></button>
            <a class="btn" href="<%= request.getContextPath() %>/news/list">목록으로</a>
        </div>
    </form>
</body>
</html>