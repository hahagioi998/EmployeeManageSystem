package com.humaoyang.controller;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.HashSet;

@ControllerAdvice(value = {"com.humaoyang"})
public class ExceptionContoller {
    @ExceptionHandler(value = {Exception.class})
    @ResponseBody
    public String exceptionHandle(){
        return "请求错误";
    }
}
