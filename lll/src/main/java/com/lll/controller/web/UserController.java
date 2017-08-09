package com.lll.controller.web;

import java.sql.Timestamp;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
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
import com.lll.rest.UpdatePasswordReq;
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
		    return	Response.getInstance().setResponse(userRepo.findAll(), ResponseCodes.SUCCESS, ResponseCodes.SUCCESS_MSG);
		} catch (Exception e) {
			e.printStackTrace();
			return Response.getInstance().setResponse(e.getMessage(), ResponseCodes.FAILURE, ResponseCodes.FAILURE_MSG);
		}
	}
	
	@RequestMapping(value="by",method=RequestMethod.GET)
	public Response getUserId(@RequestParam("email") String email){
		try {
		    return	Response.getInstance().setResponse(userRepo.getUserByEmail(email), ResponseCodes.SUCCESS, ResponseCodes.SUCCESS_MSG);
		} catch (Exception e) {
			e.printStackTrace();
			return Response.getInstance().setResponse(e.getMessage(), ResponseCodes.FAILURE, ResponseCodes.FAILURE_MSG);
		}
	}
	
	@RequestMapping(value="update_password",method=RequestMethod.POST)
	public Response updatePassword(@RequestBody Request<UpdatePasswordReq> req){
		try {
			UserDetail userDetail=userRepo.getUserByEmail(req.getRequest().getEmail());
			userDetail.setPassword(LLLUtils.getEncodedPassword(req.getRequest().getNewPassword()));
			userRepo.save(userDetail);
		    return	Response.getInstance().setResponse(null, ResponseCodes.SUCCESS, ResponseCodes.SUCCESS_MSG);
		} catch (Exception e) {
			e.printStackTrace();
			return Response.getInstance().setResponse(e.getMessage(), ResponseCodes.FAILURE, ResponseCodes.FAILURE_MSG);
		}
		
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
					 userdetail.setPassword(LLLUtils.getEncodedPassword(request.getRequest().getPassword()));
					 //boolean b=isOtpSent();
					 //boolean b=isMailSent();
					 userRepo.save(userdetail);	
					 resp.setResp(null);
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
				}else{
					resp.setResp("Admin is not registered for this vendor Please register vendor");
					resp.setMessage(ResponseCodes.FAILURE_MSG);
					resp.setCode(ResponseCodes.FAILURE);
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
			    return Response.getInstance().setResponse(userdetail, ResponseCodes.SUCCESS, ResponseCodes.SUCCESS_MSG);
			}else{
				return Response.getInstance().setResponse("No Details Found", ResponseCodes.FAILURE, ResponseCodes.FAILURE_MSG);
			}
		} catch (Exception e) {
			e.printStackTrace();
			return Response.getInstance().setResponse(e.getMessage(), ResponseCodes.FAILURE, ResponseCodes.FAILURE_MSG);
		}
	}
	
	@RequestMapping(value="delete",method=RequestMethod.GET)
	public Response deleteUser(@RequestParam("id") int id){
		try {
			userRepo.delete(id);
		    return	Response.getInstance().setResponse(null, ResponseCodes.SUCCESS, ResponseCodes.SUCCESS_MSG);
		} catch (Exception e) {
			e.printStackTrace();
			return Response.getInstance().setResponse(e.getMessage(), ResponseCodes.FAILURE, ResponseCodes.FAILURE_MSG);
		}
		
	}

}
