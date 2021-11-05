package com.humaoyang.bean;

import java.io.Serializable;
import java.util.HashMap;
import java.util.Map;

/**
 * 通用的返回Json类
 * @author 胡茂洋
 */
public class Msg implements Serializable {
    //状态码成功100 失败200
    private int code;
    //提示信息
    private String msg;
    //用户返回给浏览器的信息
    private Map<String,Object> extend=new HashMap<>();
    public static Msg success(){
        Msg result = new Msg();
        result.setCode(100);
        result.setMsg("处理成功");
        return result;
    }
    public static Msg fail(){
        Msg result = new Msg();
        result.setCode(200);
        result.setMsg("处理失败");
        return result;
    }
    public Msg add(String s,Object o){
        this.extend.put(s,o);
        return this;
    }
    public Msg() {
    }

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public Map<String, Object> getExtend() {
        return extend;
    }

    public void setExtend(Map<String, Object> extend) {
        this.extend = extend;
    }
}
