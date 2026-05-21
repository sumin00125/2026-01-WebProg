<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="bean_exam.News" %>
<%
    List<News> newsList = (List<News>) request.getAttribute("newsList");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>News List</title>
    <style>
        body { font-family: Arial, sans-serif; }
        table { border-collapse: collapse; width: 100%; }
        th, td { border: 1px solid #ccc; padding: 8px; text-align: left; }
        th { background: #f4f4f4; }
        .actions { white-space: nowrap; }
        .icon-btn, .icon-link {
            display: inline-block;
            padding: 4px 8px;
            margin-right: 4px;
            text-decoration: none;
            border: 1px solid #bbb;
            border-radius: 4px;
            color: #222;
            background: #fff;
            font-size: 14px;
        }
        .icon-btn:hover, .icon-link:hover { background: #f0f0f0; }
        .delete-form { display: inline; }
    </style>
</head>
<body>
    <h2>뉴스 목록</h2>
    <p><a class="icon-link" href="<%= request.getContextPath() %>/news/form">+ 뉴스 등록</a></p>
    <table>
        <tr>
            <th>ID</th>
            <th>Title</th>
            <th>Writer</th>
            <th>Date</th>
            <th>비고</th>
        </tr>
        <%
            if (newsList != null && !newsList.isEmpty()) {
                for (News news : newsList) {
        %>
        <tr>
            <td><%= news.getId() %></td>
            <td><%= news.getTitle() %></td>
            <td><%= news.getWriter() %></td>
            <td><%= news.getDate() %></td>
            <td class="actions">
                <a class="icon-btn" href="<%= request.getContextPath() %>/news/detail?id=<%= news.getId() %>">상세</a>
                <a class="icon-btn" href="<%= request.getContextPath() %>/news/form?id=<%= news.getId() %>">수정</a>
                <form class="delete-form" action="<%= request.getContextPath() %>/news/delete" method="post" onsubmit="return confirm('정말 삭제하시겠습니까?');">
                    <input type="hidden" name="id" value="<%= news.getId() %>">
                    <button class="icon-btn" type="submit">삭제</button>
                </form>
            </td>
        </tr>
        <%
                }
            } else {
        %>
        <tr>
            <td colspan="5">등록된 뉴스가 없습니다.</td>
        </tr>
        <%
            }
        %>
    </table>
</body>
</html>