package com.lll.controller.web;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.PostConstruct;

import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.lll.model.ArticleDetail;
import com.lll.model.ArticleImages;
import com.lll.model.Dimension;
import com.lll.repo.ArticleRepo;
import com.lll.rest.AddArticleReq;
import com.lll.rest.Request;
import com.lll.rest.Response;
import com.lll.rest.ResponseCodes;
import com.lll.util.LLLUtils;

@RestController
@RequestMapping("web/article")
public class ArticleController {
	
	@Autowired
	@Qualifier("Response")
	private Response resp;
	
	@Autowired
	private ArticleRepo articleRepo;
	
	
	@PostConstruct
	public void makeDir() {
		new File(System.getProperty("catalina.base")+File.separator+"webapps"+File.separator+"articlesImgs").mkdirs();
		new File(System.getProperty("catalina.base")+File.separator+"webapps"+File.separator+"models").mkdirs();	
	}
	
	@RequestMapping(value="update",method=RequestMethod.POST)
	public Response updateArticle(@RequestBody Request<ArticleDetail> req){
		try {
			ArticleDetail ad=articleRepo.findOne(req.getRequest().getId());
			ad.setCategory(req.getRequest().getCategory());
			ad.setTitle(req.getRequest().getTitle());
			ad.setSub_category(req.getRequest().getSub_category());
			ad.setDescription(req.getRequest().getDescription());
			ad.setDimensions(LLLUtils.getDimensionJson(req.getRequest().getDimensions()));
			ad.setDiscount((req.getRequest().getDiscount()));
			ad.setPrice(req.getRequest().getPrice());
			ad.setQuantity(req.getRequest().getQuantity());
			ad.setVendorId(req.getRequest().getVendorId());
			ad.setCategory(req.getRequest().getCategory());
			articleRepo.save(ad);
		    resp.setResp(null);
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
	
	
	@RequestMapping(value="all",method=RequestMethod.GET)
	public Response getAllArticles(@RequestParam("from")  int from,@RequestParam("count")  int count){
		try {
			long total=articleRepo.count();
			List<ArticleDetail> articles=articleRepo.getArticlePagination(from, count);
			for(ArticleDetail articleDetail:articles){			
				articleDetail.setDimension(new Gson().fromJson(articleDetail.getDimensions(), Dimension.class));
			    articleDetail.setImages(new Gson().fromJson(articleDetail.getImg(), ArticleImages.class));
			    articleDetail.setDimensions(null);
			    articleDetail.setImg(null);
			}
		    resp.setResp(articles);
			resp.setMessage(Long.toString(total));
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
			List<ArticleDetail> articles=articleRepo.getArticledetailByVendorId(vendorId);
			for(ArticleDetail articleDetail:articles){			
				articleDetail.setDimension(new Gson().fromJson(articleDetail.getDimensions(), Dimension.class));
			    articleDetail.setImages(new Gson().fromJson(articleDetail.getImg(), ArticleImages.class));
			    articleDetail.setDimensions(null);
			    articleDetail.setImg(null);
			}
		    resp.setResp(articles);
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
		 
		try {
			//Upload Object
			String objId=String.valueOf(System.currentTimeMillis()+LLLUtils.gen());
			String objFile=LLLUtils.uploadObject(req.getObjFile(),objId);
			
			
			ArrayList<MultipartFile> files=new ArrayList<MultipartFile>();
			
			if(!req.getFile1().isEmpty()){
				files.add(req.getFile1());	
			}
			if(!req.getFile2().isEmpty()){
				files.add(req.getFile2());	
			}
			if(!req.getFile3().isEmpty()){
				files.add(req.getFile3());	
			}
			if(!req.getFile4().isEmpty()){
				files.add(req.getFile4());	
			}
			if(!req.getFile5().isEmpty()){
				files.add(req.getFile5());	
			}
			
			ArticleImages articleImages=new ArticleImages(); 
			int i=1;		 
			for(MultipartFile file:files){
				    String storeFile=LLLUtils.uploadFile(file);
				    if(i==1){
				    articleImages.setImage1(storeFile);
				    }else if(i==2){
				    articleImages.setImage2(storeFile);	
				    }else if(i==3){
					articleImages.setImage3(storeFile);	
					}else if(i==4){
					articleImages.setImage4(storeFile);	
					}else if(i==5){
					articleImages.setImage5(storeFile);	
					}
				 i++;      
			  }
					    
			ArticleDetail articleDetail=new ArticleDetail();
			articleDetail.setId(objId);
			articleDetail.setName(req.getName());
			articleDetail.setCategory(req.getCategory());
			articleDetail.setDescription(req.getDescription());
			articleDetail.setDiscount(req.getDiscount());
			articleDetail.setDimensions(LLLUtils.getDimensionJson(req.getDimensions()));
			articleDetail.setPrice(req.getPrice());
			articleDetail.setQuantity(req.getQuantity());
			articleDetail.setPrice(req.getPrice());
			articleDetail.setSub_category(req.getSub_category());
			articleDetail.setUploadedUserId(req.getUploadedUserId());
			articleDetail.setVendorId(req.getVendorId());
			articleDetail.setTitle(req.getTitle());
			articleDetail.setImg(new Gson().toJson(articleImages));
			articleDetail.setImages(articleImages);
			articleRepo.save(articleDetail);
			resp.setResp(null);
			resp.setCode(ResponseCodes.SUCCESS);
			resp.setMessage(ResponseCodes.SUCCESS_MSG);
		} catch (Exception e) {
			e.printStackTrace();
			resp.setResp(e.getMessage());
			resp.setCode(ResponseCodes.FAILURE);
			resp.setMessage(ResponseCodes.FAILURE_MSG);
		}
	  return resp;
	}
}
