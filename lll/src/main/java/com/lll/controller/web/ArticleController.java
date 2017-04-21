package com.lll.controller.web;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import javax.annotation.PostConstruct;

import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.lll.model.ArticleDetail;
import com.lll.repo.ArticleRepo;
import com.lll.rest.AddArticleReq;
import com.lll.rest.Response;
import com.lll.rest.ResponseCodes;

@RestController
@RequestMapping("web/article")
public class ArticleController {
	
	@Autowired
	@Qualifier("Response")
	private Response resp;
	
	@Autowired
	private ArticleRepo articleRepo;
	
//	@PostConstruct
//	public void makeDir() {
//		new File(System.getProperty("user.home") + File.separator + "articlesImgs").mkdirs();
//	}
	
	@PostConstruct
	public void makeDir() {
		new File(System.getProperty("catalina.base")+File.separator+"webapps"+File.separator+"articlesImgs").mkdirs();
		}
	
	@RequestMapping(value="all",method=RequestMethod.GET)
	public Response getAllArticles(){
		try {
		    resp.setResp(articleRepo.findAll());
			resp.setMessage(ResponseCodes.SUCCESS_MSG);
			resp.setCode(ResponseCodes.SUCCESS);
		} catch (Exception e) {
			e.printStackTrace();
			resp.setResp(e.getMessage());
			resp.setMessage(ResponseCodes.FAILURE_MSG);
			resp.setCode(ResponseCodes.FAILURE);
		}
		return resp;
	}
	
	@RequestMapping(value="by",method=RequestMethod.GET)
	public Response getAllArticlesByVendorId(@RequestParam("vendorId") int vendorId){
		try {
		    resp.setResp(articleRepo.getArticledetailByVendorId(vendorId));
			resp.setMessage(ResponseCodes.SUCCESS_MSG);
			resp.setCode(ResponseCodes.SUCCESS);
		} catch (Exception e) {
			e.printStackTrace();
			resp.setResp(e.getMessage());
			resp.setMessage(ResponseCodes.FAILURE_MSG);
			resp.setCode(ResponseCodes.FAILURE);
		}
		return resp;
	}
	
	@RequestMapping(value="add_article")
    public Response addArticle(@ModelAttribute("uploadFile") AddArticleReq req) {
		
		System.out.println("ENTERED------------------------------------------END");
         
			InputStream inputStream = null;
			OutputStream outputStream = null;
			MultipartFile file = req.getFile();
			String fileName = file.getOriginalFilename();
			System.out.println(fileName);
		    String filePath=System.getProperty("catalina.base")+File.separator+"webapps"+File.separator+"articlesImgs" + File.separator;
			String fileNameTS=String.valueOf(System.currentTimeMillis());
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
				
				    //Inserting in to database;
					ArticleDetail articleDetail=new ArticleDetail();
					articleDetail.setName(req.getName());
					articleDetail.setCategory(req.getCategory());
					articleDetail.setDescription(req.getDescription());
					articleDetail.setDiscount(req.getDiscount());
					articleDetail.setDimensions(req.getDimensions());
					articleDetail.setPrice(req.getPrice());
					articleDetail.setQuantity(req.getQuantity());
					articleDetail.setPrice(req.getPrice());
					articleDetail.setSub_category(req.getSub_category());
					articleDetail.setUploadedUserId(req.getUploadedUserId());
					articleDetail.setVendorId(req.getVendorId());
					articleDetail.setTitle(req.getTitle());
					articleDetail.setImg(pathForDb);
					//System.out.println(new Gson().toJson(articleDetail));
				    articleRepo.save(articleDetail);

			} catch (IOException e) {
				e.printStackTrace();
				resp.setCode(ResponseCodes.FAILURE);
				resp.setMessage("FILE_UPD_FAILED");
				resp.setResp(e.getMessage());
			} catch (RuntimeException e) {
				e.printStackTrace();
				resp.setCode(ResponseCodes.FAILURE);
				resp.setMessage("DB_UPDATE_FAILED");
				resp.setResp(e.getMessage());
			} catch (Exception e) {
				resp.setCode(ResponseCodes.FAILURE);
				resp.setMessage("UNKNOWN_ERROR");
				resp.setResp(e.getMessage());
			}
			resp.setCode(ResponseCodes.SUCCESS);
			resp.setMessage(ResponseCodes.SUCCESS_MSG);
			resp.setResp(null);
			return resp;
    
	}

}
