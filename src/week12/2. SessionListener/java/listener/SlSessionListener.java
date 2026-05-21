package listener;

import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

@WebListener
public class SlSessionListener implements HttpSessionListener {

    @Override
    public void sessionCreated(HttpSessionEvent se) {
        se.getSession().getServletContext().log("SlSessionListener.sessionCreated 호출: sessionId=" + se.getSession().getId());
        System.out.println("SlSessionListener.sessionCreated 호출: sessionId=" + se.getSession().getId());
    }

    @Override
    public void sessionDestroyed(HttpSessionEvent se) {
        se.getSession().getServletContext().log("SlSessionListener.sessionDestroyed 호출: sessionId=" + se.getSession().getId());
        System.out.println("SlSessionListener.sessionDestroyed 호출: sessionId=" + se.getSession().getId());
    }
}