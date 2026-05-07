package controller;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.beanutils.BeanUtils;
import bean_exam.Product;
import bean_exam.ProductService;

@WebServlet("/product/*")
public class ProductController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private ProductService productService;

    @Override
    public void init() throws ServletException {
        productService = new ProductService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        String pathInfo = request.getPathInfo();
        String action = pathInfo != null ? pathInfo.substring(1) : "list";

        try {
            if ("list".equals(action)) {
                // 목록 조회
                request.setAttribute("products", productService.findAll());
                RequestDispatcher rd = request.getRequestDispatcher("/week10/list.jsp");
                rd.forward(request, response);
            } else if ("detail".equals(action)) {
                // 상세 조회
                String id = request.getParameter("id");
                Product product = productService.find(id);
                if (product != null) {
                    request.setAttribute("product", product);
                    RequestDispatcher rd = request.getRequestDispatcher("/week10/detail.jsp");
                    rd.forward(request, response);
                } else {
                    response.sendRedirect("list");
                }
            } else if ("form".equals(action)) {
                // 등록 폼
                String id = request.getParameter("id");
                if (id != null && !id.isEmpty()) {
                    // 수정 폼
                    Product product = productService.find(id);
                    request.setAttribute("product", product);
                    request.setAttribute("mode", "edit");
                } else {
                    // 등록 폼
                    request.setAttribute("mode", "add");
                }
                RequestDispatcher rd = request.getRequestDispatcher("/week10/form.jsp");
                rd.forward(request, response);
            } else {
                response.sendRedirect("list");
            }
        } catch (Exception e) {
            request.setAttribute("error", e.getMessage());
            RequestDispatcher rd = request.getRequestDispatcher("/week10/error.jsp");
            rd.forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        String pathInfo = request.getPathInfo();
        String action = pathInfo != null ? pathInfo.substring(1) : "list";

        try {
            if ("add".equals(action)) {
                // 등록
                Product product = new Product();
                BeanUtils.populate(product, request.getParameterMap());
                String id = productService.add(product);
                request.setAttribute("message", "제품이 등록되었습니다.");
                request.setAttribute("type", "success");
                response.sendRedirect("detail?id=" + id);
            } else if ("update".equals(action)) {
                // 수정
                Product product = new Product();
                BeanUtils.populate(product, request.getParameterMap());
                boolean updated = productService.update(product);
                if (updated) {
                    request.setAttribute("message", "제품이 수정되었습니다.");
                    request.setAttribute("type", "success");
                    response.sendRedirect("detail?id=" + product.getId());
                } else {
                    request.setAttribute("error", "제품 수정에 실패했습니다.");
                    RequestDispatcher rd = request.getRequestDispatcher("/week10/error.jsp");
                    rd.forward(request, response);
                }
            } else if ("delete".equals(action)) {
                // 삭제
                String id = request.getParameter("id");
                boolean deleted = productService.delete(id);
                if (deleted) {
                    request.setAttribute("message", "제품이 삭제되었습니다.");
                    request.setAttribute("type", "success");
                    response.sendRedirect("list");
                } else {
                    request.setAttribute("error", "제품 삭제에 실패했습니다.");
                    RequestDispatcher rd = request.getRequestDispatcher("/week10/error.jsp");
                    rd.forward(request, response);
                }
            } else {
                response.sendRedirect("list");
            }
        } catch (Exception e) {
            request.setAttribute("error", e.getMessage());
            RequestDispatcher rd = request.getRequestDispatcher("/week10/error.jsp");
            rd.forward(request, response);
        }
    }
}
