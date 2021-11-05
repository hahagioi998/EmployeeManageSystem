package com.humaoyang.controller;

import com.alibaba.druid.support.json.JSONUtils;
import com.fasterxml.jackson.databind.util.JSONPObject;
import com.github.pagehelper.PageInfo;
import com.humaoyang.bean.Employee;
import com.humaoyang.bean.Msg;
import com.humaoyang.service.EmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.Arrays;
import java.util.List;

@Controller
public class EmployeeController {
    @Autowired
    EmployeeService employeeService;
    @ResponseBody
    @RequestMapping(value = "/emps",method = {RequestMethod.GET})
    public Msg getEmps(@RequestParam(value = "page",defaultValue = "1") Integer page){
        PageInfo<Employee> pageInfo= employeeService.getEmpsByPage(page);
        return Msg.success().add("pageInfo",pageInfo);
    }
    @ResponseBody
    @RequestMapping(value = "/emp",method = RequestMethod.POST)
    /*
     * @Valid表示数据进行数据校验
     */
    public Msg addEmp(@Valid  Employee emp, BindingResult bindingResult){
        employeeService.addEmp(emp);
        return Msg.success();
    }
    @ResponseBody
    @RequestMapping(value = "/emp/{empId}",method = RequestMethod.GET)
    public Msg getEmp(@PathVariable(value = "empId") Integer empId){
        Employee emp = employeeService.getEmpById(empId);
        return Msg.success().add("emp",emp);
    }
    @ResponseBody
    @RequestMapping(value = "/emp/{empId}",method = {RequestMethod.PUT})
    public Msg updateEmp(Employee emp){
        employeeService.updateEmp(emp);
        return Msg.success();
    }
    @ResponseBody
    @RequestMapping(value = "/emp/{empId}",method = {RequestMethod.DELETE})
    public Msg deleteEmp(@PathVariable(value = "empId") Integer empId){
        employeeService.deleteByempId(empId);
        return Msg.success();
    }
    @ResponseBody
    @RequestMapping(value = "/emps/{empIds}",method = {RequestMethod.DELETE})
    public Msg batchDeleteEmps(@PathVariable(value = "empIds") String empIds){
        System.out.println(empIds);
        return Msg.success();
    }
}
