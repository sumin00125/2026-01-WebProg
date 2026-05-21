package listener;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

@WebListener
public class SclContextListener implements ServletContextListener {

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        sce.getServletContext().log("SclContextListener.contextInitialized 호출");
        System.out.println("SclContextListener.contextInitialized 호출");
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        sce.getServletContext().log("SclContextListener.contextDestroyed 호출");
        System.out.println("SclContextListener.contextDestroyed 호출");
    }
}