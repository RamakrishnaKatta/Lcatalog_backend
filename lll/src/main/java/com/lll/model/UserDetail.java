package com.lll.model;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the user_details database table.
 * 
 */
@Entity
@Table(name="user_details")
@NamedQuery(name="UserDetail.findAll", query="SELECT u FROM UserDetail u")
public class UserDetail implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;

	@Column(name="is_otp_verified")
	private String isOtpVerified;

	private String name;

	@Column(name="other_details")
	private String otherDetails;

	@Column(name="otp_no")
	private String otpNo;

	@Column(name="ph_no")
	private String phNo;

	private String role;

	@Column(name="vendor_id")
	private int vendorId;

	public UserDetail() {
	}

	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getIsOtpVerified() {
		return this.isOtpVerified;
	}

	public void setIsOtpVerified(String isOtpVerified) {
		this.isOtpVerified = isOtpVerified;
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

	public String getOtpNo() {
		return this.otpNo;
	}

	public void setOtpNo(String otpNo) {
		this.otpNo = otpNo;
	}

	public String getPhNo() {
		return this.phNo;
	}

	public void setPhNo(String phNo) {
		this.phNo = phNo;
	}

	public String getRole() {
		return this.role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public int getVendorId() {
		return this.vendorId;
	}

	public void setVendorId(int vendorId) {
		this.vendorId = vendorId;
	}

}