package com.ymai.hibernate;

import java.util.HashSet;
import java.util.Set;

/**
 * Area entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public class Area implements java.io.Serializable {

	// Fields

	private Integer areaId;
	private String areaName;
	private Set blocks = new HashSet(0);
	private City city;

	// Constructors

	/** default constructor */
	public Area() {
	}

	/** minimal constructor */
	public Area(String areaName) {
		this.areaName = areaName;
	}

	/** full constructor */
	public Area(String areaName, Set blocks) {
		this.areaName = areaName;
		this.blocks = blocks;
	}

	// Property accessors

	public Integer getAreaId() {
		return this.areaId;
	}

	public void setAreaId(Integer areaId) {
		this.areaId = areaId;
	}

	public String getAreaName() {
		return this.areaName;
	}

	public void setAreaName(String areaName) {
		this.areaName = areaName;
	}

	public Set getBlocks() {
		return this.blocks;
	}

	public void setBlocks(Set blocks) {
		this.blocks = blocks;
	}
	
	public City getCity() {
		return this.city;
	}

	public void setCity(City city) {
		this.city = city;
	}

}