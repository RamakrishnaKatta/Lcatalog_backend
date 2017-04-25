package com.lll.controller.web;

import java.sql.Timestamp;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.google.gson.Gson;
import com.lll.model.UserDetail;
import com.lll.model.VendorDetail;
import com.lll.repo.UserRepo;
import com.lll.repo.VendorRepo;
import com.lll.rest.LoginRequest;
import com.lll.rest.Request;
import com.lll.rest.Response;
import com.lll.rest.ResponseCodes;
import com.lll.util.LLLUtils;

@RestController
@RequestMapping("web/user")
public class UserController {
	
	@Autowired
	@Qualifier("Response")
	private Response resp;
	
	@Autowired
	private UserRepo userRepo;
	
	@Autowired
	private VendorRepo vendorRepo;
	
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
	
	@RequestMapping(value="register",method=RequestMethod.POST)
	public Response register(@RequestBody Request<UserDetail> request){
		try {
			UserDetail userdetail=request.getRequest();
			System.out.println(userdetail.getType());
			
			if(userdetail.getType().equals("ADMIN")){
				UserDetail isUserExists=userRepo.findByVendorIdAndType(request.getRequest().getVendorId(),request.getRequest().getType());
				System.out.println(new Gson().toJson(isUserExists));
				if(isUserExists!=null){
					resp.setMessage(ResponseCodes.ADMIN_ALREADY_EXISTS);
					resp.setCode(ResponseCodes.ALREADY_EXISTS);
				}else{
				 VendorDetail vendorDetail=vendorRepo.findOne(request.getRequest().getVendorId());
			     System.out.println("VENDOR"+new Gson().toJson(vendorDetail));
				 if(vendorDetail!=null){
					 userdetail.setId(vendorDetail.getId()+1);
					 userdetail.setCreatedTime(new Timestamp(System.currentTimeMillis()));
					 //boolean b=sendOtp();
					 //boolean b=sendMail();
					 userRepo.save(userdetail);	
					 //resp.setResp(userRepo.findAll());
					 resp.setMessage(ResponseCodes.SUCCESS_MSG);
					 resp.setCode(ResponseCodes.SUCCESS);
				 }
				}
			}else if(userdetail.getType().equals("CUSTOMER")){
				UserDetail lastUser=userRepo.getUserBySeqNo(request.getRequest().getVendorId());
				if(lastUser!=null){
					userdetail.setId(lastUser.getId()+1);
					userdetail.setCreatedTime(new Timestamp(System.currentTimeMillis()));
					userdetail.setPassword(LLLUtils.getEncodedPassword(request.getRequest().getPassword()));
					userRepo.save(userdetail);
					resp.setResp(null);
					resp.setMessage(ResponseCodes.SUCCESS_MSG);
					resp.setCode(ResponseCodes.SUCCESS);
				}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			resp.setResp(e.getMessage());
			resp.setMessage(ResponseCodes.FAILURE_MSG);
			resp.setCode(ResponseCodes.FAILURE);
		}
		return resp;
	}
	
	@RequestMapping(value="login",method=RequestMethod.POST)
	public Response userLogin(@RequestBody Request<LoginRequest> req){
		try {
			UserDetail userdetail=userRepo.checkLogin(req.getRequest().getEmail(), LLLUtils.getEncodedPassword(req.getRequest().getPassword()));
		    
			if(userdetail!=null){
				userdetail.setPassword(null);
				resp.setResp(userdetail);
				resp.setMessage(ResponseCodes.SUCCESS_MSG);
				resp.setCode(ResponseCodes.SUCCESS);
			}else{
				resp.setResp("No details Found");
				resp.setMessage(ResponseCodes.FAILURE_MSG);
				resp.setCode(ResponseCodes.FAILURE);
			}

		} catch (Exception e) {
			e.printStackTrace();
			resp.setResp(e.getMessage());
			resp.setMessage(ResponseCodes.FAILURE_MSG);
			resp.setCode(ResponseCodes.FAILURE);
		}
		return resp;
	}

}
