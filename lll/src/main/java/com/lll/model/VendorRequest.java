package com.lll.model;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the vendor_request database table.
 * 
 */
@Entity
@Table(name="vendor_request")
@NamedQuery(name="VendorRequest.findAll", query="SELECT v FROM VendorRequest v")
public class VendorRequest implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;

	private String address;

	@Column(name="company_name")
	private String companyName;

	@Column(name="contact_person_name")
	private String contactPersonName;

	private String email;

	private int is_Ack_sent;

	private String loc;

	private String mobile;

	private String pin;

	private String state;

	@Column(name="tot_models")
	private int totModels;

	public VendorRequest() {
	}

	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getAddress() {
		return this.address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getCompanyName() {
		return this.companyName;
	}

	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}

	public String getContactPersonName() {
		return this.contactPersonName;
	}

	public void setContactPersonName(String contactPersonName) {
		this.contactPersonName = contactPersonName;
	}

	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public int getIs_Ack_sent() {
		return this.is_Ack_sent;
	}

	public void setIs_Ack_sent(int is_Ack_sent) {
		this.is_Ack_sent = is_Ack_sent;
	}

	public String getLoc() {
		return this.loc;
	}

	public void setLoc(String loc) {
		this.loc = loc;
	}

	public String getMobile() {
		return this.mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getPin() {
		return this.pin;
	}

	public void setPin(String pin) {
		this.pin = pin;
	}

	public String getState() {
		return this.state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public int getTotModels() {
		return this.totModels;
	}

	public void setTotModels(int totModels) {
		this.totModels = totModels;
	}

}