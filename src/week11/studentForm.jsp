<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="bean_exam.Student" %>
<%
    Student student = (Student) request.getAttribute("student");
    String mode = (String) request.getAttribute("mode");
    boolean editMode = student != null && "edit".equals(mode);
    String actionUrl = editMode ? "/student/update" : "/student/insert";
    String buttonLabel = editMode ? "수정" : "등록";
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title><%= editMode ? "학생 수정" : "학생 등록" %></title>
    <style>
        body { font-family: Arial, sans-serif; }
        .panel { border: 1px solid #ccc; border-radius: 8px; padding: 16px; margin-bottom: 16px; background: #fafafa; }
        .student-card { border-left: 4px solid #0078d4; background: #eef6ff; }
        label { display: block; margin: 8px 0 4px; }
        input { width: 320px; max-width: 100%; padding: 8px; }
        .buttons { margin-top: 16px; }
        .btn { padding: 8px 14px; border: 1px solid #bbb; border-radius: 4px; text-decoration: none; cursor: pointer; }
    </style>
</head>
<body>
    <h2><%= editMode ? "학생 수정" : "학생 등록" %></h2>

    <%
        if (editMode) {
    %>
    <div class="panel student-card">
        <strong>수정 중인 학생</strong>
        <div>ID: <%= student.getId() %></div>
        <div>Name: <%= student.getName() %></div>
        <div>University: <%= student.getUniv() %></div>
        <div>Birthdate: <%= student.getBirthdate() %></div>
        <div>Email: <%= student.getEmail() %></div>
    </div>
    <%
        }
    %>

    <form class="panel" action="<%= request.getContextPath() %><%= actionUrl %>" method="post">
        <%
            if (editMode) {
        %>
        <input type="hidden" name="id" value="<%= student.getId() %>">
        <%
            }
        %>
        <label>Name</label>
        <input type="text" name="name" value="<%= editMode ? student.getName() : "" %>" required>

        <label>University</label>
        <input type="text" name="univ" value="<%= editMode ? student.getUniv() : "" %>">

        <label>Birthdate</label>
        <input type="date" name="birthdate" value="<%= editMode ? student.getBirthdate() : "" %>">

        <label>Email</label>
        <input type="email" name="email" value="<%= editMode ? student.getEmail() : "" %>">

        <div class="buttons">
            <button class="btn" type="submit"><%= buttonLabel %></button>
            <a class="btn" href="<%= request.getContextPath() %>/student/list">목록으로</a>
        </div>
    </form>
</body>
</html>
