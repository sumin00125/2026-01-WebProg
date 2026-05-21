package listener;

import javax.servlet.ServletContext;
import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSessionAttributeListener;
import javax.servlet.http.HttpSessionBindingEvent;

@WebListener
public class SlSessionAttributeListener implements HttpSessionAttributeListener {

    @Override
    public void attributeAdded(HttpSessionBindingEvent event) {
        ServletContext ctx = event.getSession().getServletContext();
        ctx.log("SlSessionAttributeListener.attributeAdded 호출: " + event.getName() + " = " + event.getValue());
        System.out.println("SlSessionAttributeListener.attributeAdded 호출: " + event.getName() + " = " + event.getValue());
    }

    @Override
    public void attributeRemoved(HttpSessionBindingEvent event) {
        ServletContext ctx = event.getSession().getServletContext();
        ctx.log("SlSessionAttributeListener.attributeRemoved 호출: " + event.getName() + " = " + event.getValue());
        System.out.println("SlSessionAttributeListener.attributeRemoved 호출: " + event.getName() + " = " + event.getValue());
    }

    @Override
    public void attributeReplaced(HttpSessionBindingEvent event) {
        ServletContext ctx = event.getSession().getServletContext();
        ctx.log("SlSessionAttributeListener.attributeReplaced 호출: " + event.getName() + " = " + event.getValue());
        System.out.println("SlSessionAttributeListener.attributeReplaced 호출: " + event.getName() + " = " + event.getValue());
    }
}