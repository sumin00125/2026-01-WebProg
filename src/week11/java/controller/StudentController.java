package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean_exam.Student;
import dao.StudentDAO;
import org.apache.commons.beanutils.BeanUtils;

@WebServlet("/student/*")
public class StudentController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private StudentDAO dao;

    @Override
    public void init(ServletConfig config) throws ServletException {
        super.init(config);
        dao = new StudentDAO();
        dao.connect();
    }

    @Override
    public void destroy() {
        dao.close();
        super.destroy();
    }

    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        String pathInfo = request.getPathInfo();
        String action = pathInfo != null && pathInfo.length() > 1 ? pathInfo.substring(1) : "list";

        try {
            switch (action) {
                case "list":
                    list(request, response);
                    break;
                case "form":
                    form(request, response);
                    break;
                case "insert":
                    insert(request, response);
                    break;
                case "update":
                    update(request, response);
                    break;
                case "delete":
                    delete(request, response);
                    break;
                case "detail":
                    detail(request, response);
                    break;
                default:
                    response.sendRedirect(request.getContextPath() + "/student/list");
                    break;
            }
        } catch (Exception e) {
            request.setAttribute("error", e.getMessage());
            RequestDispatcher rd = request.getRequestDispatcher("/week11/error.jsp");
            rd.forward(request, response);
        }
    }

    private void list(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Student> students = dao.getAll();
        request.setAttribute("students", students);
        RequestDispatcher rd = request.getRequestDispatcher("/week11/studentInfo.jsp");
        rd.forward(request, response);
    }

    private void form(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idStr = request.getParameter("id");
        if (idStr != null && !idStr.isEmpty()) {
            try {
                int id = Integer.parseInt(idStr);
                Student student = dao.findById(id);
                if (student != null) {
                    request.setAttribute("student", student);
                    request.setAttribute("mode", "edit");
                }
            } catch (Exception e) {
                request.setAttribute("mode", "add");
            }
        } else {
            request.setAttribute("mode", "add");
        }

        RequestDispatcher rd = request.getRequestDispatcher("/week11/studentForm.jsp");
        rd.forward(request, response);
    }

    private void insert(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            Student s = new Student();
            BeanUtils.populate(s, request.getParameterMap());

            dao.insert(s);
            response.sendRedirect(request.getContextPath() + "/student/list");
        } catch (Exception e) {
            throw new ServletException(e);
        }
    }

    private void update(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            Student s = new Student();
            BeanUtils.populate(s, request.getParameterMap());

            boolean updated = dao.update(s);
            if (updated) {
                response.sendRedirect(request.getContextPath() + "/student/list");
            } else {
                throw new ServletException("학생 수정 실패");
            }
        } catch (Exception e) {
            throw new ServletException(e);
        }
    }

    private void delete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String idStr = request.getParameter("id");
            if (idStr == null || idStr.isEmpty()) {
                throw new ServletException("삭제할 학생 ID가 없습니다.");
            }
            int id = Integer.parseInt(idStr);
            boolean deleted = dao.delete(id);
            if (deleted) {
                response.sendRedirect(request.getContextPath() + "/student/list");
            } else {
                throw new ServletException("학생 삭제 실패");
            }
        } catch (Exception e) {
            throw new ServletException(e);
        }
    }

    private void detail(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idStr = request.getParameter("id");
        try {
            int id = Integer.parseInt(idStr);
            Student s = dao.findById(id);
            if (s != null) {
                request.setAttribute("student", s);
                request.setAttribute("mode", "edit");
                RequestDispatcher rd = request.getRequestDispatcher("/week11/studentForm.jsp");
                rd.forward(request, response);
                return;
            }
        } catch (Exception e) {
            // ignore parse
        }
        response.sendRedirect(request.getContextPath() + "/student/list");
    }
}
