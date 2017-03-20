package com.ymai.hibernate;

/**
 * SearchCount entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public class SearchCount implements java.io.Serializable {

	// Fields

	private String key;
	private Long counter;
	private Integer type;
	
	public Integer getType(){
		return this.type;
	}
	public void setType(Integer type){
		this.type = type;
	}

	// Constructors

	/** default constructor */
	public SearchCount() {
	}

	/** full constructor */
	public SearchCount(String key, Long counter) {
		this.key = key;
		this.counter = counter;
	}

	// Property accessors

	public String getKey() {
		return this.key;
	}

	public void setKey(String key) {
		this.key = key;
	}

	public Long getCounter() {
		return this.counter;
	}

	public void setCounter(Long counter) {
		this.counter = counter;
	}

}