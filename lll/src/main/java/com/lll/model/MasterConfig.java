package com.lll.model;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the master_config database table.
 * 
 */
@Entity
@Table(name="master_config")
@NamedQuery(name="MasterConfig.findAll", query="SELECT m FROM MasterConfig m")
public class MasterConfig implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;

	@Column(name="notify_server_key")
	private String notifyServerKey;

	public MasterConfig() {
	}

	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getNotifyServerKey() {
		return this.notifyServerKey;
	}

	public void setNotifyServerKey(String notifyServerKey) {
		this.notifyServerKey = notifyServerKey;
	}

}