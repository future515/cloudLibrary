package edu.hebtu.controller;

import edu.hebtu.pojo.User;
import edu.hebtu.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
public class UserController {
    @Autowired
    private UserService userService;

    @RequestMapping("/toMainPage")
    public String toMainPage(){
        return "main";
    }

    @RequestMapping("/login")
    public String login(User user, HttpServletRequest request){
        try{
            User u = userService.login(user);
            if(u != null){
                request.getSession().setAttribute("USER_SESSION",u);
                return "redirect:/admin/main.jsp";
            }
            request.setAttribute("msg","用户名或密码错误");
            return "forward:/admin/login.jsp";
        }catch (Exception e){
            e.printStackTrace();
            request.setAttribute("msg","系统错误");
            return "forward:/admin/login.jsp";
        }
    }

    @RequestMapping("/logout")
    public String logout(HttpServletRequest request){
        try{
            HttpSession session = request.getSession();
            session.invalidate();
            return "forward:/admin/login.jsp";

        }catch (Exception e){
            e.printStackTrace();
            request.setAttribute("msg","系统错误");
            return "forward:/admin/login.jsp";
        }
    }

    @RequestMapping()
    public String theOther(){
        return "redirect:/admin/login.jsp";
    }
}
