package com.ymai.hibernate;

/**
 * CityIp entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public class CityIp implements java.io.Serializable {

	// Fields

	private Double start;
	private Double end;
	private String city;

	// Constructors

	/** default constructor */
	public CityIp() {
	}

	/** minimal constructor */
	public CityIp(Double start) {
		this.start = start;
	}

	/** full constructor */
	public CityIp(Double start, Double end, String city) {
		this.start = start;
		this.end = end;
		this.city = city;
	}

	// Property accessors

	public Double getStart() {
		return this.start;
	}

	public void setStart(Double start) {
		this.start = start;
	}

	public Double getEnd() {
		return this.end;
	}

	public void setEnd(Double end) {
		this.end = end;
	}

	public String getCity() {
		return this.city;
	}

	public void setCity(String city) {
		this.city = city;
	}

}