package com.lll.rest;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.lll.util.LLLUtils;
@Component
@Qualifier("Response")
public class Response {
	
	private static final Response response = new Response(); 
	
	public static Response getInstance(){
		return response;
	}
	
	private Response(){}
     
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
			return LLLUtils.jsonString(this);
		} catch (JsonProcessingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "ERROR - JSON Parsing";
	}
	
	public Response setResponse(Object resp, int code, String message) {
		Response.getInstance().setCode(code);
		Response.getInstance().setResp(resp);
		Response.getInstance().setMessage(message);
		return response;
	}
	
	
	
} 
