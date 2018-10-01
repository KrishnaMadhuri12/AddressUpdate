package com.user.info.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * @author Madhuri networkid varchar(15), username varchar(50), emailid
 *         varchar(20),
 */

@Entity
@Table(name = "rootoperdefn")
public class User implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 4159514584684137273L;

	@Id
	@Column(name = "networkid")
	String networkId;
	
	@Column(name = "username")
	String username;
	
	@Id
	@Column(name = "emailId")
	String emailId;

	public String getNetworkId() {
		return networkId;
	}

	public void setNetworkId(String networkId) {
		this.networkId = networkId;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getEmailId() {
		return emailId;
	}

	public void setEmailId(String emailId) {
		this.emailId = emailId;
	}

}
