package com.lll.model;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the article_details database table.
 * 
 */
@Entity
@Table(name="article_details")
@NamedQuery(name="ArticleDetail.findAll", query="SELECT a FROM ArticleDetail a")
public class ArticleDetail implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;

	private String category;

	private String description;

	private String discount;

	private String image;

	private String name;

	private String price;

	@Column(name="`sub-category`")
	private String sub_category;

	@Column(name="uploaded_user_id")
	private int uploadedUserId;

	@Column(name="vendor_id")
	private int vendorId;

	public ArticleDetail() {
	}

	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getCategory() {
		return this.category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getDescription() {
		return this.description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getDiscount() {
		return this.discount;
	}

	public void setDiscount(String discount) {
		this.discount = discount;
	}

	public String getImage() {
		return this.image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPrice() {
		return this.price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public String getSub_category() {
		return this.sub_category;
	}

	public void setSub_category(String sub_category) {
		this.sub_category = sub_category;
	}

	public int getUploadedUserId() {
		return this.uploadedUserId;
	}

	public void setUploadedUserId(int uploadedUserId) {
		this.uploadedUserId = uploadedUserId;
	}

	public int getVendorId() {
		return this.vendorId;
	}

	public void setVendorId(int vendorId) {
		this.vendorId = vendorId;
	}

}