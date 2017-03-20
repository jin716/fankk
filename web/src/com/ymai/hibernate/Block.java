package com.ymai.hibernate;

import java.lang.reflect.Field;
import java.util.HashSet;
import java.util.Set;

/**
 * Block entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public class Block implements java.io.Serializable {

	// Fields
	
	public static final int BLOCK_TYPE_STREE = 0;
	public static final int BLOCK_TYPE_BLOCK = 1;
	public static final int BLOCK_TYPE_BUILDING = 2;
	public static final int BLOCK_TYPE_BUSSTOP = 3;



	private Integer blockId;
	private Area area;
	private String blockName;
	private String firstLetter;
	private String everyFirstLetter;
	private String pinYin;
	private Double blockAddrX;
	private Double blockAddrY;
	private Set stores = new HashSet(0);
	private Integer blockType;
	private Integer zipCode;
	private Integer storeNum;
	// Constructors

	/** default constructor */
	public Block() {
	}

	/** minimal constructor */
	public Block(Area area, String blockName, String firstLetter,
			Double blockAddrX, Double blockAddrY) {
		this.area = area;
		this.blockName = blockName;
		this.firstLetter = firstLetter;
		this.blockAddrX = blockAddrX;
		this.blockAddrY = blockAddrY;
	}

	/** full constructor */
	public Block(Area area, String blockName, String firstLetter,
			Double blockAddrX, Double blockAddrY, Set stores) {
		this.area = area;
		this.blockName = blockName;
		this.firstLetter = firstLetter;
		this.blockAddrX = blockAddrX;
		this.blockAddrY = blockAddrY;
		this.stores = stores;
	}

	// Property accessors

	public Integer getBlockId() {
		return this.blockId;
	}

	public void setBlockId(Integer blockId) {
		this.blockId = blockId;
	}

	public Area getArea() {
		return this.area;
	}

	public void setArea(Area area) {
		this.area = area;
	}

	public String getBlockName() {
		return this.blockName;
	}

	public void setBlockName(String blockName) {
		this.blockName = blockName;
	}

	public String getFirstLetter() {
		return this.firstLetter;
	}

	public void setFirstLetter(String firstLetter) {
		this.firstLetter = firstLetter;
	}


	public String getEveryFirstLetter() {
		return this.everyFirstLetter;
	}

	public void setEveryFirstLetter(String everyFirstLetter) {
		this.everyFirstLetter = everyFirstLetter;
	}
	
	public String getPinYin() {
		return this.pinYin;
	}

	public void setPinYin(String pinYin) {
		this.pinYin = pinYin;
	}

	
	public Double getBlockAddrX() {
		return this.blockAddrX;
	}

	public void setBlockAddrX(Double blockAddrX) {
		this.blockAddrX = blockAddrX;
	}

	public Double getBlockAddrY() {
		return this.blockAddrY;
	}

	public void setBlockAddrY(Double blockAddrY) {
		this.blockAddrY = blockAddrY;
	}

	public Set getStores() {
		return this.stores;
	}

	public void setStores(Set stores) {
		this.stores = stores;
	}
	
	public Integer getBlockType() {
		return this.blockType;
	}

	public void setBlockType(Integer blockType) {
		this.blockType = blockType;
	}

	/**纬度*/
	public Integer getNTULatitude(){
		return new Position(this).getNTULatitude();
	}
	/**经度*/
	public Integer getNTULongitude(){
		return new Position(this).getNTULongitude();
	}
	
	/**纬度*/
	public Double getLatitude(){
		return this.getBlockAddrY();
	}
	/**经度*/
	public Double getLongitude(){
		return this.getBlockAddrX();
	}
	
	public Integer getZipCode(){
		return zipCode;
	}
	
	public void setZipCode(Integer zipCode) {
		this.zipCode = zipCode;
	}
	public Integer getStoreNum(){
		return storeNum;
	}
	
	public void setStoreNum(Integer storeNum) {
		this.storeNum = storeNum;
	}
	
	
}