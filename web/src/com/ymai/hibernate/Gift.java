package com.ymai.hibernate;

import java.util.HashSet;
import java.util.Set;

/**
 * Gift entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public class Gift implements java.io.Serializable {

	// Fields

	private Integer giftId;
	private String giftName;
	private String giftImage;
	private Integer giftJifen;
	private String giftDetail;
	private Set duihuans = new HashSet(0);

	// Constructors

	/** default constructor */
	public Gift() {
	}

	/** full constructor */
	public Gift(String giftName, String giftImage, Integer giftJifen,
			String giftDetail, Set duihuans) {
		this.giftName = giftName;
		this.giftImage = giftImage;
		this.giftJifen = giftJifen;
		this.giftDetail = giftDetail;
		this.duihuans = duihuans;
	}

	// Property accessors

	public Integer getGiftId() {
		return this.giftId;
	}

	public void setGiftId(Integer giftId) {
		this.giftId = giftId;
	}

	public String getGiftName() {
		return this.giftName;
	}

	public void setGiftName(String giftName) {
		this.giftName = giftName;
	}

	public String getGiftImage() {
		return this.giftImage;
	}

	public void setGiftImage(String giftImage) {
		this.giftImage = giftImage;
	}

	public Integer getGiftJifen() {
		return this.giftJifen;
	}

	public void setGiftJifen(Integer giftJifen) {
		this.giftJifen = giftJifen;
	}

	public String getGiftDetail() {
		return this.giftDetail;
	}

	public void setGiftDetail(String giftDetail) {
		this.giftDetail = giftDetail;
	}

	public Set getDuihuans() {
		return this.duihuans;
	}

	public void setDuihuans(Set duihuans) {
		this.duihuans = duihuans;
	}

}