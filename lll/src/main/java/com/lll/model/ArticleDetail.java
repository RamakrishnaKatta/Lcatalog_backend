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

	private String dimensions;

	private String discount;

	private String img;

	private String name;

	private String object;

	private String pattern;

	private String price;

	private String quantity;

	@Column(name="`sub-category`")
	private String sub_category;

	private String title;

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

	public String getDimensions() {
		return this.dimensions;
	}

	public void setDimensions(String dimensions) {
		this.dimensions = dimensions;
	}

	public String getDiscount() {
		return this.discount;
	}

	public void setDiscount(String discount) {
		this.discount = discount;
	}

	public String getImg() {
		return this.img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getObject() {
		return this.object;
	}

	public void setObject(String object) {
		this.object = object;
	}

	public String getPattern() {
		return this.pattern;
	}

	public void setPattern(String pattern) {
		this.pattern = pattern;
	}

	public String getPrice() {
		return this.price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public String getQuantity() {
		return this.quantity;
	}

	public void setQuantity(String quantity) {
		this.quantity = quantity;
	}

	public String getSub_category() {
		return this.sub_category;
	}

	public void setSub_category(String sub_category) {
		this.sub_category = sub_category;
	}

	public String getTitle() {
		return this.title;
	}

	public void setTitle(String title) {
		this.title = title;
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