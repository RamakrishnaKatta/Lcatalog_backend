package com.lll.rest;

import org.springframework.web.multipart.MultipartFile;

import com.lll.model.ArticleDetail;

public class AddArticleReq extends ArticleDetail{

	private MultipartFile file;

	public MultipartFile getFile() {
		return file;
	}

	public void setFile(MultipartFile file) {
		this.file = file;
	}
	
	
}
