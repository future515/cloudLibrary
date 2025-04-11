package edu.hebtu.interceptor;

import edu.hebtu.pojo.User;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

public class ResourcesInterceptor extends HandlerInterceptorAdapter {
    private List<String> ignoreUrl;
    public ResourcesInterceptor(List<String> ignoreUrl) {
        this.ignoreUrl = ignoreUrl;
        System.out.println("构造方法"+ignoreUrl);
    }
    public ResourcesInterceptor() {
    }


    public boolean preHandle(HttpServletRequest request,
             HttpServletResponse response, Object handler) throws Exception {
        User user = (User)request.getSession().getAttribute("USER_SESSION");
        String uri = request.getRequestURI();
        System.out.println("preHandle"+ignoreUrl);


        if(user!=null){
            if("admin".equalsIgnoreCase(user.getRole())){
                return true;
            }
            else if(!"admin".equalsIgnoreCase(user.getRole())){
                System.out.println("---------");
                for (String s : ignoreUrl) {
                    System.out.println(s);
                    if(uri.indexOf(s)>=0){
                        return true;
                    }
                }
            }
        }
        if(uri.indexOf("login")>=0){
            return true;
        }
        response.sendError(HttpServletResponse.SC_FORBIDDEN, "失败");
        request.setAttribute("msg","请先登录");
        request.getRequestDispatcher("/admin/login.jsp").forward(request,response);
        return false;

        // 发送403 Forbidden错误
    }
}
