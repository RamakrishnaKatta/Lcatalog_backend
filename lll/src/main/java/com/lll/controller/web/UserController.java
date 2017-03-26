package com.lll.controller.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.lll.repo.UserRepo;
import com.lll.repo.VendorRepo;
import com.lll.rest.Response;
import com.lll.rest.ResponseCodes;

@RestController
@RequestMapping("web/user")
public class UserController {
	
	@Autowired
	@Qualifier("Response")
	private Response resp;
	
	@Autowired
	private UserRepo userRepo;
	
	@RequestMapping(value="all",method=RequestMethod.GET)
	public Response getAllVendors(){
		try {
		    resp.setResp(userRepo.findAll());
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
