package com.lll.model;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the vendor_details database table.
 * 
 */
@Entity
@Table(name="vendor_details")
@NamedQuery(name="VendorDetail.findAll", query="SELECT v FROM VendorDetail v")
public class VendorDetail implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	//@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;

	private String location;

	private String logo;

	private String name;

	@Column(name="other_details")
	private String otherDetails;

	private String type;

	public VendorDetail() {
	}

	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getLocation() {
		return this.location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getLogo() {
		return this.logo;
	}

	public void setLogo(String logo) {
		this.logo = logo;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getOtherDetails() {
		return this.otherDetails;
	}

	public void setOtherDetails(String otherDetails) {
		this.otherDetails = otherDetails;
	}

	public String getType() {
		return this.type;
	}

	public void setType(String type) {
		this.type = type;
	}

}