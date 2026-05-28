package controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/myf")
public class MyFServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // 문자 인코딩 처리는 Filter에서 담당합니다.
        resp.setContentType("text/html; charset=UTF-8");

        try (PrintWriter out = resp.getWriter()) {
            out.println("<!DOCTYPE html><html lang=\"ko\"><head><meta charset=\"UTF-8\"><title>/myf</title></head><body>");
            out.println("<h2>윤동주 - 서시</h2>");
            out.println("<pre>");
            out.println("하늘을 우러러 한 점 부끄럼이 없기를\n");
            out.println("잎새에 이는 바람에도 나는 괴로워했네\n");
            out.println("별을 노래하는 마음으로 모든 죽어가는 것을 사랑해야지\n");
            out.println("그리고 나의 길을 걸어가야겠다\n");
            out.println("</pre>");
            out.println("</body></html>");
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
