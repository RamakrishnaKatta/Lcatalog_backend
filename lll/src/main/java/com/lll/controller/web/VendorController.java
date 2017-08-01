package com.lll.controller.web;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.List;

import javax.annotation.PostConstruct;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FilenameUtils;
import org.apache.commons.io.IOUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.beans.factory.annotation.Qualifier;

import org.springframework.web.multipart.MultipartFile;


import com.lll.model.FileLink;
import com.lll.model.UploadedFile;
import com.lll.model.VendorDetail;
import com.lll.repo.VendorRepo;
import com.lll.rest.Request;
import com.lll.rest.Response;
import com.lll.rest.ResponseCodes;
import com.lll.rest.VendorReg;


@RestController
@Controller
@RequestMapping("web/vendor")
public class VendorController {
	
	private static final Logger LOG = Logger.getLogger(ArticleController.class);
	
	@Autowired
	@Qualifier("Response")
	private Response resp;
	
	@Autowired
	private VendorRepo vendorRepo;
	
//	@PostConstruct
//	public void makeDir() {
//		new File(System.getProperty("user.home") + File.separator + "vendorLogos").mkdirs();
//	}
	
	@PostConstruct
	public void makeDir() {
		new File(System.getProperty("catalina.base")+File.separator+"webapps"+File.separator+"vendorLogos").mkdirs();
	}
   // String filePath=System.getProperty("catalina.base")+File.separator+"webapps/vendorLogos" + File.separator;

	
	@RequestMapping(value="update",method=RequestMethod.POST)
	public Response vendorUpdate(@RequestBody Request<VendorDetail> req){
		try {
			vendorRepo.save(req.getRequest());
			return Response.getInstance().setResponse(null, ResponseCodes.SUCCESS, ResponseCodes.SUCCESS_MSG);
		} catch (Exception e) {
			e.printStackTrace();
			return Response.getInstance().setResponse(e.getMessage(), ResponseCodes.FAILURE, ResponseCodes.FAILURE_MSG);
		}
	}
	
	@RequestMapping(value="all",method=RequestMethod.GET)
	public Response getAllVendors(){
		try {
			LOG.debug("GETTING ALL VENDOR");
			return Response.getInstance().setResponse(vendorRepo.findAll(), ResponseCodes.SUCCESS, ResponseCodes.SUCCESS_MSG);
		} catch (Exception e) {
			LOG.error("USER-EXCEPTION : ", e);
			e.printStackTrace();
			return Response.getInstance().setResponse(e.getMessage(), ResponseCodes.FAILURE, ResponseCodes.FAILURE_MSG);
		}
	}
	
	@RequestMapping(value="by",method=RequestMethod.GET)
	public Response getVendorById(@RequestParam("id") int id){
		try {
			return Response.getInstance().setResponse(vendorRepo.findOne(id), ResponseCodes.SUCCESS, ResponseCodes.SUCCESS_MSG);
		} catch (Exception e) {
			e.printStackTrace();
			return Response.getInstance().setResponse(e.getMessage(), ResponseCodes.FAILURE, ResponseCodes.FAILURE_MSG);
		}
	}
	
	@RequestMapping(value="delete",method=RequestMethod.GET)
	public Response deleteVendorById(@RequestParam("id") int id){
		try {
			vendorRepo.delete(id);
			return Response.getInstance().setResponse(null, ResponseCodes.SUCCESS, ResponseCodes.SUCCESS_MSG);
		} catch (Exception e) {
			e.printStackTrace();
			return Response.getInstance().setResponse(e.getMessage(), ResponseCodes.FAILURE, ResponseCodes.FAILURE_MSG);
		}
	}

    @RequestMapping(value="vendor_reg")
    public Response fileUploaded(@ModelAttribute("uploadedFile") VendorReg req) {
         
			InputStream inputStream = null;
			OutputStream outputStream = null;
			MultipartFile file = req.getFile();
			String fileName = file.getOriginalFilename();
		    String filePath=System.getProperty("catalina.base")+File.separator+"webapps"+File.separator+"vendorLogos" + File.separator;
			//String filePath = System.getProperty("user.home") + File.separator + "vendorLogos" + File.separator;
			String fileNameTS=String.valueOf(System.currentTimeMillis());
		    String pathForDb=File.separator+"vendorLogos"+File.separator+fileNameTS+ "."+FilenameUtils.getExtension(fileName);
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
				VendorDetail vendorDetail=new VendorDetail();
				vendorDetail.setId(Integer.valueOf(req.getId()));
				vendorDetail.setName(req.getName());
				vendorDetail.setType(req.getType());
				vendorDetail.setCode(req.getCode());
				vendorDetail.setLogo(pathForDb);
				vendorRepo.save(vendorDetail);

			} catch (Exception e) {
				return Response.getInstance().setResponse(e.getMessage(), ResponseCodes.FAILURE, ResponseCodes.FAILURE_MSG);
			}
			return  Response.getInstance().setResponse(null, ResponseCodes.SUCCESS, ResponseCodes.SUCCESS_MSG);
	}
}

