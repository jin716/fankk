package com.ymai.hibernate;

import java.util.Date;

/**
 * Liuyan entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public class Liuyan implements java.io.Serializable {

	// Fields

	private Integer liuyanId;
	private Date liuyanTime;
	private String liuyanContent;
	private String liuyaner;

	// Constructors

	/** default constructor */
	public Liuyan() {
	}

	/** minimal constructor */
	public Liuyan(Date liuyanTime, String liuyanContent) {
		this.liuyanTime = liuyanTime;
		this.liuyanContent = liuyanContent;
	}

	/** full constructor */
	public Liuyan(Date liuyanTime, String liuyanContent, String liuyaner) {
		this.liuyanTime = liuyanTime;
		this.liuyanContent = liuyanContent;
		this.liuyaner = liuyaner;
	}

	// Property accessors

	public Integer getLiuyanId() {
		return this.liuyanId;
	}

	public void setLiuyanId(Integer liuyanId) {
		this.liuyanId = liuyanId;
	}

	public Date getLiuyanTime() {
		return this.liuyanTime;
	}

	public void setLiuyanTime(Date liuyanTime) {
		this.liuyanTime = liuyanTime;
	}

	public String getLiuyanContent() {
		return this.liuyanContent;
	}

	public void setLiuyanContent(String liuyanContent) {
		this.liuyanContent = liuyanContent;
	}

	public String getLiuyaner() {
		return this.liuyaner;
	}

	public void setLiuyaner(String liuyaner) {
		this.liuyaner = liuyaner;
	}

}