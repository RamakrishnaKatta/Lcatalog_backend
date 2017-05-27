package com.lll.controller.app;

import java.io.File;
import java.util.List;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.lll.model.Notification;
import com.lll.model.UserDevice;
import com.lll.notificationUtils.FCM;
import com.lll.repo.MasterConfigRepo;
import com.lll.repo.NotificationRepo;
import com.lll.repo.UserDeviceRepo;
import com.lll.rest.AddArticleReq;
import com.lll.rest.Response;
import com.lll.rest.ResponseCodes;
import com.lll.util.LLLUtils;

@RestController
@RequestMapping("/app/notify")
public class AppNotifications {
	
	@Autowired
	@Qualifier("Response")
	private Response resp;
	
	@Autowired
	private UserDeviceRepo userDeviceRepo;
	
	@Autowired
	private NotificationRepo notifyRepo;
	
	@Autowired
	private MasterConfigRepo masterConfigRepo;
	
	@PostConstruct
	public void makeDir() {
		new File(System.getProperty("catalina.base")+File.separator+"webapps"+File.separator+"app-notify-imgs").mkdirs();
	}
	
	@RequestMapping(value="device",method=RequestMethod.GET)
	public Response getAllVendors(@RequestParam("tokenid") String tokenId){
		try {
			UserDevice isExists=userDeviceRepo.findByTokenId(tokenId);
			if(isExists==null){
				UserDevice userDevice=new UserDevice();
				userDevice.setTokenId(tokenId);
				userDeviceRepo.save(userDevice);
				resp.setResp(null);
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
	
	@RequestMapping(value="test",method=RequestMethod.GET)
	public Object getAllVendors(){	
	  // return masterConfigRepo.findOne(101).getNotifyServerKey();
	  // return userDeviceRepo.findAll();
	  return null;
	}
	
	@RequestMapping(value="send")
	public Response sendNotification(@ModelAttribute("uploadFile") Notification req){
		try {
			LLLUtils.uploadNotificationFile(req.getFile());
			Notification notification=new Notification();
			notification.setPath(LLLUtils.uploadNotificationFile(req.getFile()));
			notification.setMsg(req.getMsg());
			notification.setTitle(req.getTitle());
			
			List<UserDevice> userDevices=userDeviceRepo.findAll();
			for(UserDevice userdevice : userDevices){
				
				try {
					Object notifyResp=FCM.send_FCM_Notification(userdevice.getTokenId(), masterConfigRepo.findOne(101).getNotifyServerKey(),req.getTitle(), req.getMsg());
				    System.out.println(notifyResp);
				} catch (Exception e) {
					e.printStackTrace();
				}
				
			}
			notifyRepo.save(notification);
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
	
	@RequestMapping(value="get_all")
	public Response getAllNotify(){
		try{
			resp.setResp(notifyRepo.findAll());
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
