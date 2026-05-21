package controller;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = { "/scl", "/scl/*" })
public class SclServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ServletContext servletContext = getServletContext();

        servletContext.log("SclServlet#doGet 호출");
        System.out.println("SclServlet#doGet 호출");

        servletContext.log("ServletContext.setAttribute(\"scName\", \"홍길동\") 호출");
        System.out.println("ServletContext.setAttribute(\"scName\", \"홍길동\") 호출");
        servletContext.setAttribute("scName", "홍길동");

        response.setContentType("text/html; charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().println("<!DOCTYPE html>");
        response.getWriter().println("<html lang=\"ko\">");
        response.getWriter().println("<head><meta charset=\"UTF-8\"><title>/scl</title></head>");
        response.getWriter().println("<body>");
        response.getWriter().println("<h1>/scl 실행 완료</h1>");
        response.getWriter().println("<p>서버 로그와 콘솔에서 ServletContextListener / AttributeListener 호출을 확인하세요.</p>");
        response.getWriter().println("<p>setAttribute(\"scName\", \"홍길동\")가 호출되었습니다.</p>");
        response.getWriter().println("</body></html>");
    }
}