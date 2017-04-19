package com.lll.model;

import java.util.Set;

import org.springframework.web.multipart.MultipartFile;

public class UploadedFile {
	
	private MultipartFile file;
	
	private String parentId;
    private String name;
    private String description;
    private String assessmentUrl;
	private Set<String> locationsId;
	private boolean isDirectory;

	public String getParentId() {
		return parentId;
	}

	public void setParentId(String parentId) {
		this.parentId = parentId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getAssessmentUrl() {
		return assessmentUrl;
	}

	public void setAssessmentUrl(String assessmentUrl) {
		this.assessmentUrl = assessmentUrl;
	}

	public Set<String> getLocationsId() {
		return locationsId;
	}

	public void setLocationsId(Set<String> locationsId) {
		this.locationsId = locationsId;
	}

	public boolean isDirectory() {
		return isDirectory;
	}

	public void setDirectory(boolean isDirectory) {
		this.isDirectory = isDirectory;
	}

	public MultipartFile getFile() {
		return file;
	}

	public void setFile(MultipartFile file) {
		this.file = file;
	}

	
	
}
