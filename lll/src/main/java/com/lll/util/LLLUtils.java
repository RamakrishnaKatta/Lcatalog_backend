package com.lll.util;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.security.MessageDigest;
import java.util.Random;
import java.util.UUID;

import org.apache.commons.io.FilenameUtils;
import org.apache.http.HttpResponse;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.DefaultHttpClient;
import org.springframework.web.multipart.MultipartFile;

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
	
public static String uploadObject(MultipartFile file,String objId){
		
		InputStream inputStream = null;
		OutputStream outputStream = null;
	
		String fileName = file.getOriginalFilename();
	    String filePath=System.getProperty("catalina.base")+File.separator+"webapps"+File.separator+"models" + File.separator;
		String fileNameTS=String.valueOf(System.currentTimeMillis()+LLLUtils.gen());
	    //String fileNameTS=UUID.randomUUID().toString().substring(0, 18);
	    String pathForDb=File.separator+"models"+File.separator+objId+ "."+FilenameUtils.getExtension(fileName);
		String documentLink = filePath +fileNameTS+ "." + FilenameUtils.getExtension(fileName);
		
		try {
		inputStream = file.getInputStream();
		File newFile = new File(documentLink);
		outputStream = new FileOutputStream(newFile);
		int read = 0;
		byte[] bytes = new byte[1024];
		while ((read = inputStream.read(bytes)) != -1) {
			outputStream.write(bytes, 0, read);
		}
		outputStream.close();
		return pathForDb;
		} catch (IOException e) {
			e.printStackTrace();
			return null;	
		} catch (RuntimeException e) {
			e.printStackTrace();
			return null;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	
	public static String uploadFile(MultipartFile file){
		
		InputStream inputStream = null;
		OutputStream outputStream = null;
		
		String fileName = file.getOriginalFilename();
	    String filePath=System.getProperty("catalina.base")+File.separator+"webapps"+File.separator+"articlesImgs" + File.separator;
		//String fileNameTS=String.valueOf(System.currentTimeMillis()+LLLUtils.gen());
		String fileNameTS=UUID.randomUUID().toString().substring(0, 18);
	    String pathForDb=File.separator+"articlesImgs"+File.separator+fileNameTS+ "."+FilenameUtils.getExtension(fileName);
		String documentLink = filePath +fileNameTS+ "." + FilenameUtils.getExtension(fileName);
		
		try {
		inputStream = file.getInputStream();
		File newFile = new File(documentLink);
		outputStream = new FileOutputStream(newFile);
		int read = 0;
		byte[] bytes = new byte[1024];
		while ((read = inputStream.read(bytes)) != -1) {
			outputStream.write(bytes, 0, read);
		}
		outputStream.close();
		return pathForDb;
		} catch (IOException e) {
			e.printStackTrace();
			return null;	
		} catch (RuntimeException e) {
			e.printStackTrace();
			return null;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
public static String uploadNotificationFile(MultipartFile file){
		
		InputStream inputStream = null;
		OutputStream outputStream = null;
		
		String fileName = file.getOriginalFilename();
	    String filePath=System.getProperty("catalina.base")+File.separator+"webapps"+File.separator+"app-notify-imgs" + File.separator;
		String fileNameTS=UUID.randomUUID().toString().substring(0, 18);
	    String pathForDb=File.separator+"app-notify-imgs"+File.separator+fileNameTS+ "."+FilenameUtils.getExtension(fileName);
		String documentLink = filePath +fileNameTS+ "." + FilenameUtils.getExtension(fileName);
		
		try {
		inputStream = file.getInputStream();
		File newFile = new File(documentLink);
		outputStream = new FileOutputStream(newFile);
		int read = 0;
		byte[] bytes = new byte[1024];
		while ((read = inputStream.read(bytes)) != -1) {
			outputStream.write(bytes, 0, read);
		}
		outputStream.close();
		return pathForDb;
		} catch (IOException e) {
			e.printStackTrace();
			return null;	
		} catch (RuntimeException e) {
			e.printStackTrace();
			return null;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	public static String getObjectName(String path) {
		String name=path.split("models/")[1];
		 return name.split("\\.")[0];
	}
	
//	public String getRandomNo(){
//		return String.valueOf(10000 + new Random().nextInt(90000));
//	}

}