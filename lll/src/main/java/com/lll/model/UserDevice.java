package com.lll.model;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the user_devices database table.
 * 
 */
@Entity
@Table(name="user_devices")
@NamedQuery(name="UserDevice.findAll", query="SELECT u FROM UserDevice u")
public class UserDevice implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;

	@Column(name="token_id")
	private String tokenId;

	public UserDevice() {
	}

	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTokenId() {
		return this.tokenId;
	}

	public void setTokenId(String tokenId) {
		this.tokenId = tokenId;
	}

}