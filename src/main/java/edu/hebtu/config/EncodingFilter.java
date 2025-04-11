package edu.hebtu.config;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;

@WebFilter(filterName = "encodingFilter",urlPatterns = "/*")
public class EncodingFilter implements Filter {
    public void init(FilterConfig filterConfig){}
    public void doFilter(ServletRequest servletRequest,
                         ServletResponse servletResponse, FilterChain filterChain)
                        throws java.io.IOException, javax.servlet.ServletException{
        servletRequest.setCharacterEncoding("UTF-8");
        servletResponse.setCharacterEncoding("UTF-8");
        filterChain.doFilter(servletRequest,servletResponse);

    }
    public void destroy(){}
}
