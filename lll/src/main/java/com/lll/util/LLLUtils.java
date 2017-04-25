package com.lll.util;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.security.MessageDigest;
import java.util.Random;

import org.apache.http.HttpResponse;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.DefaultHttpClient;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.lll.model.Dimension;

public class LLLUtils {
	
	public static final ObjectMapper MAPPER = new ObjectMapper();
	
	
	public static String jsonString(Object o) throws JsonProcessingException{
		try {
			return MAPPER.writeValueAsString(o);
		} catch (JsonProcessingException e) {
			// TODO Auto-generated catch block
			throw e;
		}
	}
	
	public static String getDimensionJson(String dimensions){
		String[] points=dimensions.split(",");
		Dimension dimension=new Dimension();
		dimension.setWidth(points[0]);
	    dimension.setLength(points[1]);
	    dimension.setHeight(points[2]);
	    return new Gson().toJson(dimension);
	}
	
	public static int gen() {
	    Random r = new Random( System.currentTimeMillis() );
	    return 10000 + r.nextInt(20000);
	}
	
	
	public static void sendOtp() throws ClientProtocolException, IOException{

		String url = "http://192.168.1.9:8080/fas/global/test";

		HttpClient client = new DefaultHttpClient();
		HttpGet request = new HttpGet(url);

		HttpResponse response = client.execute(request);

		BufferedReader rd = new BufferedReader(
                new InputStreamReader(response.getEntity().getContent()));
		
		
		StringBuffer result = new StringBuffer();
		String line = "";
		while ((line = rd.readLine()) != null) {
			result.append(line);
		}

		System.out.println(new JsonObject());
		
		/*Gson gson=new Gson();
		return gson.toJson(rd);*/
	}
	
	public static String getEncodedPassword(String password) throws Exception {

		MessageDigest md = MessageDigest.getInstance("MD5");
		md.update(password.getBytes());
		byte[] digest = md.digest();
		StringBuffer sb = new StringBuffer();
		for (byte b : digest) {
			sb.append(String.format("%02x", b & 0xff));
		}
		//System.out.println("digested(hex):" + sb.toString());
		return sb.toString();
	}

}