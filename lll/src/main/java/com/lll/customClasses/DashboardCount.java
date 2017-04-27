package com.lll.customClasses;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;

@Component
@Qualifier("DashboardStats")
public class DashboardCount {

	private Integer vendors,users,articles,vendorReqs;

	public Integer getVendors() {
		return vendors;
	}

	public void setVendors(Integer vendors) {
		this.vendors = vendors;
	}

	public Integer getUsers() {
		return users;
	}

	public void setUsers(Integer users) {
		this.users = users;
	}

	public Integer getArticles() {
		return articles;
	}

	public void setArticles(Integer articles) {
		this.articles = articles;
	}

	public Integer getVendorReqs() {
		return vendorReqs;
	}

	public void setVendorReqs(Integer vendorReqs) {
		this.vendorReqs = vendorReqs;
	}

	
}
