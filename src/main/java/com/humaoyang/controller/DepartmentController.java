package com.humaoyang.controller;

import com.humaoyang.bean.Msg;
import com.humaoyang.service.DepartmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class DepartmentController {
    @Autowired
    DepartmentService departmentService;
    @RequestMapping(value = "/depts")
    @ResponseBody
    public Msg getDepts(){
        return Msg.success().add("depts",departmentService.getDepts());
    }
}
