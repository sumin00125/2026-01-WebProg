<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="bean_exam.Student" %>
<%
    List<Student> students = (List<Student>) request.getAttribute("students");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Student List</title>
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
    <h2>등록 학생 목록</h2>
    <p><a class="icon-link" href="<%= request.getContextPath() %>/student/form">+ 학생 등록</a></p>
    <table>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>University</th>
            <th>Birthdate</th>
            <th>Email</th>
            <th>비고</th>
        </tr>
        <%
            if (students != null && !students.isEmpty()) {
                for (Student s : students) {
        %>
        <tr>
            <td><%= s.getId() %></td>
            <td><%= s.getName() %></td>
            <td><%= s.getUniv() %></td>
            <td><%= s.getBirthdate() %></td>
            <td><%= s.getEmail() %></td>
            <td class="actions">
                <a class="icon-btn" href="<%= request.getContextPath() %>/student/form?id=<%= s.getId() %>">✏ 수정</a>
                <form class="delete-form" action="<%= request.getContextPath() %>/student/delete" method="post" onsubmit="return confirm('정말 삭제하시겠습니까?');">
                    <input type="hidden" name="id" value="<%= s.getId() %>">
                    <button class="icon-btn" type="submit">🗑 삭제</button>
                </form>
            </td>
        </tr>
        <%
                }
            } else {
        %>
        <tr>
            <td colspan="6">등록된 학생이 없습니다.</td>
        </tr>
        <%
            }
        %>
    </table>
</body>
</html>
