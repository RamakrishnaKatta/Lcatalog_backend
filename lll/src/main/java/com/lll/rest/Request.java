
package com.lll.rest;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@JsonIgnoreProperties(ignoreUnknown = true)
public class Request<T> {
    
	private T request;

	public T getRequest() {
		return request;
	}

	public void setRequest(T request) {
		this.request = request;
	}
	
	
    	
}
