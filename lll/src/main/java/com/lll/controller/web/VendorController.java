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
import com.lll.rest.Response;
import com.lll.rest.ResponseCodes;
import com.lll.rest.VendorReg;


@RestController
@Controller
@RequestMapping("web/vendor")
public class VendorController {
	
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

	
	@RequestMapping(value="all",method=RequestMethod.GET)
	public Response getAllVendors(){
		try {
		    resp.setResp(vendorRepo.findAll());
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
	public Response getVendorById(@RequestParam("id") int id){
		try {
		    resp.setResp(vendorRepo.findOne(id));
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
				vendorDetail.setLogo(pathForDb);
				vendorRepo.save(vendorDetail);

			} catch (IOException e) {
				e.printStackTrace();
				resp.setCode(ResponseCodes.FAILURE);
				resp.setMessage("FILE_UPD_FAILED");
				resp.setResp(e.getMessage());
			} catch (RuntimeException e) {
				e.printStackTrace();
				resp.setCode(ResponseCodes.FAILURE);
				resp.setMessage("DB_UPDATE_FAILED");
				resp.setResp(e.getMessage());
			} catch (Exception e) {
				resp.setCode(ResponseCodes.FAILURE);
				resp.setMessage("UNKNOWN_ERROR");
				resp.setResp(e.getMessage());
			}
			resp.setCode(ResponseCodes.SUCCESS);
			resp.setMessage(ResponseCodes.SUCCESS_MSG);
			resp.setResp(null);
			return resp;
    
	}
}

