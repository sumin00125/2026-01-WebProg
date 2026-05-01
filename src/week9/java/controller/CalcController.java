package controller;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.beanutils.BeanUtils;
import bean_exam.Calculator;

@WebServlet("/calcControl")
public class CalcController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        Calculator calculator = new Calculator();
        try {
            // populate bean properties from request parameters
            BeanUtils.populate(calculator, request.getParameterMap());

            double result = calculator.calc();

            request.setAttribute("calculator", calculator);
            request.setAttribute("result", result);

            RequestDispatcher rd = request.getRequestDispatcher("calcResult.jsp");
            rd.forward(request, response);
        } catch (Exception e) {
            request.setAttribute("error", e.getMessage());
            RequestDispatcher rd = request.getRequestDispatcher("calcResult.jsp");
            rd.forward(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Redirect GET to the input form
        response.sendRedirect("index.jsp");
    }
}
