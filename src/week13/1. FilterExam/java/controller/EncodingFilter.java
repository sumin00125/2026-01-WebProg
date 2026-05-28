package controller;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;

// 기존에 '/*f' 같은 패턴은 서블릿 스펙에서 허용되지 않거나 의도한 매칭이 되지 않습니다.
// 따라서 대상 URL을 명시적으로 나열하여 정확히 적용되도록 합니다.
@WebFilter(urlPatterns = {"/myf", "/newf"})
public class EncodingFilter implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        // 초기화 필요시 구현
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");

        chain.doFilter(request, response);
    }

    @Override
    public void destroy() {
        // 정리 필요시 구현
    }
}
