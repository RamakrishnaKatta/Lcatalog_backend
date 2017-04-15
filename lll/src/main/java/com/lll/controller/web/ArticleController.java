package com.lll.controller.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.lll.repo.ArticleRepo;
import com.lll.repo.VendorRepo;
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

}
