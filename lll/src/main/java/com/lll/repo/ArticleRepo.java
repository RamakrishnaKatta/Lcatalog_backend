package com.lll.repo;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.lll.model.ArticleDetail;

public interface ArticleRepo extends JpaRepository<ArticleDetail, String> {
	
	@Query(value="SELECT * FROM `article_details` WHERE `vendor_id`=?1", nativeQuery=true)
	List<ArticleDetail> getArticledetailByVendorId(int vendorId);

}
