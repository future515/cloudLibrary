package edu.hebtu.controller;

import edu.hebtu.entity.PageResult;
import edu.hebtu.pojo.Record;
import edu.hebtu.pojo.User;
import edu.hebtu.service.RecordService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/record")
public class RecordController {
    @Autowired
    private RecordService recordService;

    @RequestMapping("/searchRecords")
    public ModelAndView searchRecords(Record record, HttpServletRequest request, Integer pageNum, Integer pageSize) {
        if(pageNum == null) {
            pageNum = 1;
        }
        if(pageSize == null) {
            pageSize = 10;
        }
        System.out.println("recordController");
        System.out.println(record);
        User user = ((User)request.getSession().getAttribute("USER_SESSION"));
        PageResult pageResult = recordService.searchRecords(record, user, pageNum, pageSize);
        System.out.println("pageResult="+pageResult);
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("record");
        modelAndView.addObject("pageResult", pageResult);
        modelAndView.addObject("search",record);
        modelAndView.addObject("pageNum", pageNum);
        modelAndView.addObject("pageSize", pageSize);
        modelAndView.addObject("gourl",request.getRequestURI());
        return modelAndView;
    }
}
