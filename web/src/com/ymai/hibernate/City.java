package com.ymai.hibernate;

import java.util.HashSet;
import java.util.Set;

/**
 * City entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public class City implements java.io.Serializable {

	// Fields

	private Integer cityId;
	private String cityName;
	private String cityPingYin;
	private Set areas = new HashSet(0);

	// Constructors

	/** default constructor */
	public City() {
	}

	/** minimal constructor */
	public City(String cityName) {
		this.cityName = cityName;
	}

	/** full constructor */
	public City(String cityName, String cityPingYin, Set areas) {
		this.cityName = cityName;
		this.cityPingYin = cityPingYin;
		this.areas = areas;
	}

	// Property accessors

	public Integer getCityId() {
		return this.cityId;
	}

	public void setCityId(Integer cityId) {
		this.cityId = cityId;
	}

	public String getCityName() {
		return this.cityName;
	}

	public void setCityName(String cityName) {
		this.cityName = cityName;
	}

	public String getCityPingYin() {
		return this.cityPingYin;
	}

	public void setCityPingYin(String cityPingYin) {
		this.cityPingYin = cityPingYin;
	}

	public Set getAreas() {
		return this.areas;
	}

	public void setAreas(Set areas) {
		this.areas = areas;
	}

}