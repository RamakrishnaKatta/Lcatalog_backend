package com.lll.rest;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.lll.util.MyUtils;
@Component
@Qualifier("Response")
public class Response {
     
	private Object resp;
	private int code;
	private String message;
	public Object getResp() {
		return resp;
	}
	public void setResp(Object resp) {
		this.resp = resp;
	}
	public int getCode() {
		return code;
	}
	public void setCode(int code) {
		this.code = code;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	
	public String toJson(){
		try {
			return MyUtils.jsonString(this);
		} catch (JsonProcessingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "ERROR - JSON Parsing";
	}
	
} 
