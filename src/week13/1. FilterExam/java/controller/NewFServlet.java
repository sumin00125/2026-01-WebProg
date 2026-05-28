package controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/newf")
public class NewFServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // 인코딩/콘텐츠 타입 설정하지 않음 — Filter 적용 여부 확인용
        try (PrintWriter out = resp.getWriter()) {
            out.println("<!DOCTYPE html><html lang=\"ko\"><head><meta charset=\"UTF-8\"><title>/newf</title></head><body>");
            out.println("<h2>행운의 편지</h2>");
            out.println("<p>안녕하세요! 당신은 오늘 특별한 행운을 받았습니다.</p>");
            out.println("<p>이 편지를 5명에게 전달하면, 당신의 소원이 이루어집니다.</p>");
            out.println("<ul>");
            out.println("<li>첫째: 아침에 맛있는 커피를 마시게 됩니다.</li>");
            out.println("<li>둘째: 길에서 우연히 웃는 사람을 만납니다.</li>");
            out.println("<li>셋째: 예상치 못한 작은 기쁨이 찾아옵니다.</li>");
            out.println("</ul>");
            out.println("<p>지금 이 편지를 복사해서 5명에게 보내세요. 행운이 함께 하길!</p>");
            out.println("</body></html>");
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
