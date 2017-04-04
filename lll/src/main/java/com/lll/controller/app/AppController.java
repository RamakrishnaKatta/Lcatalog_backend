package com.lll.controller.app;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.lll.model.VendorRequest;
import com.lll.repo.VendorRepo;
import com.lll.repo.VendorReqRepo;
import com.lll.rest.Request;
import com.lll.rest.Response;
import com.lll.rest.ResponseCodes;

@RestController
@RequestMapping("/app/vendor")
public class AppController {
	
	@Autowired
	@Qualifier("Response")
	private Response resp;
	
	@Autowired
	private VendorRepo repo;
	
	@Autowired
	private VendorReqRepo vendorReqRepo;
	
	@RequestMapping(value="all",method=RequestMethod.GET)
	public Response getAllVendors(){
		try {
			resp.setResp(repo.findAll());
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
	
	@RequestMapping(value="add_vendor_req",method=RequestMethod.POST)
	public Response addVendorRequest(@RequestBody Request<VendorRequest> req){
		try {
			vendorReqRepo.save(req.getRequest());
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

	
}
