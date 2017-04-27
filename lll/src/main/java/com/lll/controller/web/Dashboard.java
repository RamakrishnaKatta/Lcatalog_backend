package com.lll.controller.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.lll.customClasses.DashboardCount;
import com.lll.repo.ArticleRepo;
import com.lll.repo.UserRepo;
import com.lll.repo.VendorRepo;
import com.lll.repo.VendorReqRepo;
import com.lll.rest.Response;
import com.lll.rest.ResponseCodes;

@RestController
@RequestMapping("dashboard")
public class Dashboard {
	
	@Autowired
	@Qualifier("Response")
	private Response resp;
	
	@Autowired
	@Qualifier("DashboardStats")
	private DashboardCount dashboardCount;
	
	@Autowired
	private ArticleRepo articleRepo;
	
	@Autowired
	private VendorRepo vendorRepo;
	
	@Autowired
	private UserRepo userRepo;
	
	@Autowired
	private VendorReqRepo vendorReqRepo;

	
	@RequestMapping(value="get_dashboard_stats",method=RequestMethod.GET)
	
	public Response getAllVendors(){
		try {
			dashboardCount.setUsers((int) userRepo.count());
			dashboardCount.setVendors((int) vendorRepo.count());
			dashboardCount.setArticles((int) articleRepo.count());
			dashboardCount.setVendorReqs((int) vendorReqRepo.count());
			resp.setResp(dashboardCount);
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
