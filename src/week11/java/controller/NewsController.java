package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import bean_exam.News;
import bean_exam.NewsService;

@WebServlet("/news/*")
public class NewsController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private NewsService newsService;

    @Override
    public void init() throws ServletException {
        newsService = new NewsService();
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
                    response.sendRedirect(request.getContextPath() + "/news/list");
                    break;
            }
        } catch (Exception e) {
            request.setAttribute("error", e.getMessage());
            request.setAttribute("backUrl", request.getContextPath() + "/news/list");
            RequestDispatcher rd = request.getRequestDispatcher("/week11/error.jsp");
            rd.forward(request, response);
        }
    }

    private void list(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<News> newsList = newsService.findAll();
        request.setAttribute("newsList", newsList);
        RequestDispatcher rd = request.getRequestDispatcher("/week11/newsList.jsp");
        rd.forward(request, response);
    }

    private void form(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idStr = request.getParameter("id");
        if (idStr != null && !idStr.isEmpty()) {
            try {
                int id = Integer.parseInt(idStr);
                News news = newsService.find(id);
                if (news != null) {
                    request.setAttribute("news", news);
                    request.setAttribute("mode", "edit");
                }
            } catch (Exception e) {
                request.setAttribute("mode", "add");
            }
        } else {
            request.setAttribute("mode", "add");
        }

        RequestDispatcher rd = request.getRequestDispatcher("/week11/newsForm.jsp");
        rd.forward(request, response);
    }

    private void insert(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            News news = new News();
            BeanUtils.populate(news, request.getParameterMap());

            int id = newsService.add(news);
            response.sendRedirect(request.getContextPath() + "/news/detail?id=" + id);
        } catch (Exception e) {
            throw new ServletException(e);
        }
    }

    private void update(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            News news = new News();
            BeanUtils.populate(news, request.getParameterMap());

            boolean updated = newsService.update(news);
            if (updated) {
                response.sendRedirect(request.getContextPath() + "/news/detail?id=" + news.getId());
            } else {
                throw new ServletException("뉴스 수정 실패");
            }
        } catch (Exception e) {
            throw new ServletException(e);
        }
    }

    private void delete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String idStr = request.getParameter("id");
            if (idStr == null || idStr.isEmpty()) {
                throw new ServletException("삭제할 뉴스 ID가 없습니다.");
            }
            int id = Integer.parseInt(idStr);
            boolean deleted = newsService.delete(id);
            if (deleted) {
                response.sendRedirect(request.getContextPath() + "/news/list");
            } else {
                throw new ServletException("뉴스 삭제 실패");
            }
        } catch (Exception e) {
            throw new ServletException(e);
        }
    }

    private void detail(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idStr = request.getParameter("id");
        try {
            int id = Integer.parseInt(idStr);
            News news = newsService.find(id);
            if (news != null) {
                request.setAttribute("news", news);
                RequestDispatcher rd = request.getRequestDispatcher("/week11/newsDetail.jsp");
                rd.forward(request, response);
                return;
            }
        } catch (Exception e) {
            // ignore parse error and fall through to redirect
        }
        response.sendRedirect(request.getContextPath() + "/news/list");
    }
}