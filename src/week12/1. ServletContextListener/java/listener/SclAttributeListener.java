package listener;

import javax.servlet.ServletContextAttributeEvent;
import javax.servlet.ServletContextAttributeListener;
import javax.servlet.annotation.WebListener;

@WebListener
public class SclAttributeListener implements ServletContextAttributeListener {

    @Override
    public void attributeAdded(ServletContextAttributeEvent event) {
        event.getServletContext().log("SclAttributeListener.attributeAdded 호출: " + event.getName() + " = " + event.getValue());
        System.out.println("SclAttributeListener.attributeAdded 호출: " + event.getName() + " = " + event.getValue());
    }

    @Override
    public void attributeRemoved(ServletContextAttributeEvent event) {
        event.getServletContext().log("SclAttributeListener.attributeRemoved 호출: " + event.getName() + " = " + event.getValue());
        System.out.println("SclAttributeListener.attributeRemoved 호출: " + event.getName() + " = " + event.getValue());
    }

    @Override
    public void attributeReplaced(ServletContextAttributeEvent event) {
        event.getServletContext().log("SclAttributeListener.attributeReplaced 호출: " + event.getName() + " = " + event.getValue());
        System.out.println("SclAttributeListener.attributeReplaced 호출: " + event.getName() + " = " + event.getValue());
    }
}