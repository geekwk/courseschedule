package cn.ahpu.pojo;

import java.util.HashMap;
import java.util.Map;

public class Result {

    /**
     * status:
     * 1:success
     * 0:fail
     */
    private int status;
    private String message;
    private Map<String, Object> data = new HashMap<>();

    public static Result success(String info){
        Result res = new Result();
        res.setStatus(1);
        res.setMessage(info);
        return res;
    }

    public static Result fail(String info){
        Result res = new Result();
        res.setStatus(0);
        res.setMessage(info);
        return res;
    }

    public Result add(String key,Object obj){
        this.getData().put(key,obj);
        return this;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public Map<String, Object> getData() {
        return data;
    }

    public void setData(Map<String, Object> data) {
        this.data = data;
    }
}
