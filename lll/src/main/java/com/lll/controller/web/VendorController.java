package com.lll.controller.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.lll.repo.VendorRepo;
import com.lll.rest.Response;
import com.lll.rest.ResponseCodes;


@RestController
@RequestMapping("web/vendor")
public class VendorController {
	
	@Autowired
	@Qualifier("Response")
	private Response resp;
	
	@Autowired
	private VendorRepo vendorRepo;
	
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

//	@RequestMapping("/fileUpload")
//	public Object fileUploaded(@org.springframework.web.bind.annotation.ModelAttribute("uploadedFile") UploadedFile uploadedFile) {
//
//		FileLink fileDetails = new FileLink(uploadedFile);
//		fileDetails.setLocationsId(uploadedFile.getLocationsId());
//		fileDetails.setName(uploadedFile.getName());
//		fileDetails.setCreatedTime(System.currentTimeMillis());
//		fileDetails.setAssessmentUrl(uploadedFile.getAssessmentUrl());
//		documentDao.addFileDetails(fileDetails);
//		String fileName = fileDetails.getName();
//		System.out.println(fileName);
//
//		if (!uploadedFile.isDirectory()) {
//			InputStream inputStream = null;
//			OutputStream outputStream = null;
//
//			MultipartFile file = uploadedFile.getFile();
//			fileName = file.getOriginalFilename();
//			String filePath = System.getProperty("user.home") + File.separator + "fileuploads" + File.separator;
//			String documentLink = filePath + fileDetails.getId() + "." + FilenameUtils.getExtension(fileName);
//			try {
//				inputStream = file.getInputStream();
//
//				File newFile = new File(documentLink);
//
//				outputStream = new FileOutputStream(newFile);
//				int read = 0;
//				byte[] bytes = new byte[1024];
//
//				while ((read = inputStream.read(bytes)) != -1) {
//					outputStream.write(bytes, 0, read);
//
//				}
//				outputStream.close();
//
//				//fileDetails.setDocumentLink(documentLink);
//				//documentDao.updateFileDetails(fileDetails);
//
//			} catch (IOException e) {
//				e.printStackTrace();
//				// return "FILE_UPD_FAILED";
//			} catch (RuntimeException e) {
//				e.printStackTrace();
//				// return "DB_UPDATE_FAILED";
//			} catch (Exception e) {
//				// return "UNKNOWN_ERROR";
//			}
//		}
//		//rd.setResp(fileDetails.getId());
//		//rd.setCode(ResponseConstants.SUCCESSFUL.ordinal());
//		return rd;
//		// return
//		// SecurityViewComponent.createSecurityView("learning-app/uploadForm");
//	}
}
