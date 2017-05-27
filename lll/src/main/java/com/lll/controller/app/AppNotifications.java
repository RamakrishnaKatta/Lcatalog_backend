package com.lll.controller.app;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.lll.model.UserDevice;
import com.lll.repo.MasterConfigRepo;
import com.lll.repo.UserDeviceRepo;
import com.lll.rest.Response;
import com.lll.rest.ResponseCodes;

@RestController
@RequestMapping("/app/notify")
public class AppNotifications {
	
	@Autowired
	@Qualifier("Response")
	private Response resp;
	
	@Autowired
	private UserDeviceRepo userDeviceRepo;
	
	@RequestMapping(value="device",method=RequestMethod.GET)
	public Response getAllVendors(@RequestParam("tokenid") String tokenId){
		try {
			UserDevice isExists=userDeviceRepo.findByTokenId(tokenId);
			if(isExists==null){
				UserDevice userDevice=new UserDevice();
				userDevice.setTokenId(tokenId);
				resp.setResp(userDeviceRepo.save(userDevice));
				resp.setMessage(ResponseCodes.SUCCESS_MSG);
				resp.setCode(ResponseCodes.SUCCESS);	
			}else{
				resp.setResp(ResponseCodes.ALREADY_EXISTS);
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
