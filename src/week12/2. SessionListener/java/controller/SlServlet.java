package controller;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(urlPatterns = { "/sl", "/sl/*" })
public class SlServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ServletContext servletContext = getServletContext();

        servletContext.log("SlServlet#doGet 호출");
        System.out.println("SlServlet#doGet 호출");

        HttpSession session = request.getSession(true);
        String value = session.getId() + "홍길동";

        servletContext.log("HttpSession.setAttribute(\"ssName\", \"" + value + "\") 호출");
        System.out.println("HttpSession.setAttribute(\"ssName\", \"" + value + "\") 호출");
        session.setAttribute("ssName", value);

        response.setContentType("text/html; charset=UTF-8");
        response.getWriter().println("<!DOCTYPE html><html lang=\"ko\"><head><meta charset=\"UTF-8\"><title>/sl</title></head><body>");
        response.getWriter().println("<h1>/sl 실행 완료</h1>");
        response.getWriter().println("<p>세션 ID: " + session.getId() + "</p>");
        response.getWriter().println("<p>ssName 값: " + value + "</p>");
        response.getWriter().println("</body></html>");
    }
}