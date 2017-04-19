package com.lll.model;


public class FileLink {

	private String id;
	
	private boolean isDirectory;
	
	private String description;

	private String parentId;

	private String type;

	private String name;
	
	private String assessmentUrl;


	private String documentLink;
    
	private String createdBy;
	
	private String assignedTo;
	
	private long size;
    
	private long createdTime; 
	
	public FileLink() {

	}

	public FileLink(UploadedFile uploadedFile) {
		
		this.description = uploadedFile.getDescription();
		
		this.parentId = uploadedFile.getParentId();
		if (uploadedFile.getFile()!=null) {
			this.name = uploadedFile.getFile().getOriginalFilename();
			this.type = uploadedFile.getFile().getContentType();
			this.size = uploadedFile.getFile().getSize();
		} else {
			//this.name = uploadedFile.getDirectoryName();
			this.type = "dir";
			this.size = 0;
		}
	}

	public String getCreatedBy() {
		return createdBy;
	}

	public void setCreatedBy(String createdBy) {
		this.createdBy = createdBy;
	}

	public boolean isDirectory() {
		return isDirectory;
	}

	public String getAssessmentUrl() {
		return assessmentUrl;
	}

	public void setAssessmentUrl(String assessmentUrl) {
		this.assessmentUrl = assessmentUrl;
	}

	public void setDirectory(boolean isDirectory) {
		this.isDirectory = isDirectory;
	}

	public long getSize() {
		return size;
	}

	public void setSize(long size) {
		this.size = size;
	}

	public String getDocumentLink() {
		return documentLink;
	}

	public void setDocumentLink(String documentLink) {
		this.documentLink = documentLink;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getParentId() {
		return parentId;
	}

	public void setParentId(String parentId) {
		this.parentId = parentId;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	
	public long getCreatedTime() {
		return createdTime;
	}

	public void setCreatedTime(long createdTime) {
		this.createdTime = createdTime;
	}

	public String getAssignedTo() {
		return assignedTo;
	}

	public void setAssignedTo(String assignedTo) {
		this.assignedTo = assignedTo;
	}

	

	
	

}
