package com.lll.repo;

import org.springframework.data.jpa.repository.JpaRepository;

import com.lll.model.ArticleDetail;

public interface ArticleRepo extends JpaRepository<ArticleDetail, Integer> {

}
