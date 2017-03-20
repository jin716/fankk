package com.ymai.hibernate;

import java.math.BigInteger;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import com.ymai.policy.OrderIncomePolicy;
import com.ymai.struts.action.ordersystem.OSFacade;

/**
 * Store entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public class Store implements java.io.Serializable {

	// Fields

	private Integer storeId;
	private Block block;
	private Set blocks;
	private User user;
	private String storeName;
	private String storeBrief;
	private Double storeAddrX;
	private Double storeAddrY;
	private String storeAddrName;
	
	private Double storeStars;
	private Double storeHealth;
	private Double storeSpeed;
	private Double storeTaste;
	
	private Double storeAccount;
	private Date storeStartTime;
	private Date storeEndTime;
	private BigInteger storeMobile;
	private Set orderEvaluates = new HashSet(0);
	private Set orders = new HashSet(0);
	private Set items = new HashSet(0);
	private Double storeSendCost;
	private Double storeLowCost;
	private Double storeSendDistance;
	private String storeSendDistanceText;

	private String storeImgSrc;
	private Integer storeSet;
	private Integer storeState;
	private Boolean storeSendSMS;
	private Double storeJifen;
	private Integer storeEv;
	// Constructors

	/** default constructor */
	public Store() {
	}

	/** minimal constructor */
	public Store(Block block, User user, String storeName, Double storeAddrX,
			Double sotreAddrY, String storeAddrName, Double storeStars,
			Double storeAccount, BigInteger storeMobile) {
		this.block = block;
		this.user = user;
		this.storeName = storeName;
		this.storeAddrX = storeAddrX;
		this.storeAddrY = sotreAddrY;
		this.storeAddrName = storeAddrName;
		this.storeStars = storeStars;
		this.storeAccount = storeAccount;
		this.storeMobile = storeMobile;
	}

	/** full constructor */
	public Store(Block block, User user, String storeName, String storeBrief,
			Double storeAddrX, Double sotreAddrY, String storeAddrName,
			Double storeStars, Double storeAccount, Date storeStartTime,
			Date storeEndTime, BigInteger storeMobile, Set storeComnts,
			Set orders, Set items) {
		this.block = block;
		this.user = user;
		this.storeName = storeName;
		this.storeBrief = storeBrief;
		this.storeAddrX = storeAddrX;
		this.storeAddrY = sotreAddrY;
		this.storeAddrName = storeAddrName;
		this.storeStars = storeStars;
		this.storeAccount = storeAccount;
		this.storeStartTime = storeStartTime;
		this.storeEndTime = storeEndTime;
		this.storeMobile = storeMobile;
		this.orderEvaluates = storeComnts;
		this.orders = orders;
		this.items = items;
	}

	// Property accessors

	public Integer getStoreId() {
		return this.storeId;
	}

	public void setStoreId(Integer storeId) {
		this.storeId = storeId;
	}

	public Block getBlock() {
		return this.block;
	}

	public void setBlocks(Set blocks) {
		this.blocks = blocks;
	}
	
	public Set getBlocks() {
		return this.blocks;
	}

	public void setBlock(Block block) {
		this.block = block;
	}

	public User getUser() {
		return this.user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public String getStoreName() {
		return this.storeName;
	}

	public void setStoreName(String storeName) {
		this.storeName = storeName;
	}

	public String getStoreBrief() {
		return this.storeBrief;
	}

	public void setStoreBrief(String storeBrief) {
		this.storeBrief = storeBrief;
	}
	/**经度Longitude*/
	public Double getStoreAddrX() {
		return this.storeAddrX;
	}
	/**经度Longitude*/
	public void setStoreAddrX(Double Latitude) {
		this.storeAddrX = Latitude;
	}
	/**纬度Latitude*/
	public Double getStoreAddrY() {
		return this.storeAddrY;
	}
	/**纬度Latitude*/
	public void setStoreAddrY(Double Longitude) {
		this.storeAddrY = Longitude;
	}

	public String getStoreAddrName() {
		return this.storeAddrName;
	}

	public void setStoreAddrName(String storeAddrName) {
		this.storeAddrName = storeAddrName;
	}

	public Double getStoreStars() {
		return this.storeStars;
	}

	public void setStoreStars(Double storeStars) {
		this.storeStars = storeStars;
	}
	
	public Double getStoreTaste() {
		return this.storeTaste;
	}

	public void setStoreTaste(Double storeTaste) {
		this.storeTaste = storeTaste;
	}

	public Double getStoreSpeed() {
		return this.storeSpeed;
	}

	public void setStoreSpeed(Double storeSpeed) {
		this.storeSpeed = storeSpeed;
	}
	
	public Double getStoreHealth() {
		return this.storeHealth;
	}

	public void setStoreHealth(Double storeHealth) {
		this.storeHealth = storeHealth;
	}


	public Double getStoreAccount() {
		return this.storeAccount;
	}

	public void setStoreAccount(Double storeAccount) {
		this.storeAccount = storeAccount;
	}

	public Date getStoreStartTime() {
		return this.storeStartTime;
	}
	
	

	public void setStoreStartTime(Date storeStartTime) {
		this.storeStartTime = storeStartTime;
	}

	public Date getStoreEndTime() {
		return this.storeEndTime;
	}

	public void setStoreEndTime(Date storeEndTime) {
		this.storeEndTime = storeEndTime;
	}

	public BigInteger getStoreMobile() {
		return this.storeMobile;
	}

	public void setStoreMobile(BigInteger storeMobile) {
		this.storeMobile = storeMobile;
	}

	public Set getOrderEvaluates() {
		return this.orderEvaluates;
	}

	public void setOrderEvaluates(Set orderEvaluates) {
		this.orderEvaluates = orderEvaluates;
	}

	public Set getOrders() {
		return this.orders;
	}

	public void setOrders(Set orders) {
		this.orders = orders;
	}

	public Set getItems() {
		return this.items;
	}

	public void setItems(Set items) {
		this.items = items;
	}
	
	public String getStartTimeString(){
		SimpleDateFormat format = new SimpleDateFormat("HH:mm");
		if(this.storeStartTime == null )return null;
		return format.format(this.storeStartTime);
	}
	
	public String getEndTimeString(){
		SimpleDateFormat format = new SimpleDateFormat("HH:mm");
		if(this.storeEndTime == null )return null;
		return format.format(this.storeEndTime);
	}
	
	public Double getStoreLowCost() {
		return this.storeLowCost;
	}

	public void setStoreLowCost(Double storeLowCost) {
		this.storeLowCost = storeLowCost;
	}
	
	public Double getStoreSendDistance() {
		return this.storeSendDistance;
	}
	
	public void setStoreSendDistance(Double storeSendDistance) {
		this.storeSendDistance = storeSendDistance;
	}
	
	public Double getStoreSendCost() {
		return this.storeSendCost;
	}

	public void setStoreSendCost(Double storeSendCost) {
		this.storeSendCost = storeSendCost;
	}
	
	public String getStoreImgSrc() {
		return this.storeImgSrc;
	}

	public void setStoreImgSrc(String storeImgSrc) {
		this.storeImgSrc = storeImgSrc;
	}
	
	public Position getPosition(){
		return new Position(this);
	}
	
	public String getStoreStartTimeString() {
		DateFormat df = new SimpleDateFormat("HH:mm:ss");
		if(this.storeStartTime == null)return null;
		return df.format(this.storeStartTime);
	}
	
	public String getStoreEndTimeString() {
		DateFormat df = new SimpleDateFormat("HH:mm:ss");
		if(this.storeEndTime == null)return null;
		return df.format(this.storeEndTime);
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
		return this.getStoreAddrY();
	}
	/**经度*/
	public Double getLongitude(){
		return this.getStoreAddrX();
	}
	
	public Integer getStoreSet(){
		return this.storeSet;
	}
	public Integer getStoreState(){
		return this.storeState;
	}
	
	public void setStoreState(Integer state){
		this.storeState = state;
	}
	
	public void setStoreSet(Integer set){
		this.storeSet = set;
	}
	
	public Boolean getStoreSendSMS(){
		return this.storeSendSMS;
	}
	public void setStoreSendSMS(Boolean send){
		this.storeSendSMS = send;
	}
	
		
	public boolean getCanOrderNow(){
		if(this.storeState != 0)
			if(getIsOnline()) return true;
		return false;
	}
	
	public boolean getCanOrder(){
		if(this.storeState == null) return false;
		if(this.storeState != 0) return true;
		return false;
	}
	
	public boolean getIsOnline(){
		try{
			Date now = new Date();
			Date start = new Date();
			Date end = new Date();
			start.setHours(this.storeStartTime.getHours());
			start.setMinutes(this.storeStartTime.getMinutes());
			start.setSeconds(this.storeStartTime.getSeconds());
			end.setHours(this.storeEndTime.getHours());
			end.setMinutes(this.storeEndTime.getMinutes());
			end.setSeconds(this.storeEndTime.getSeconds());
			if(now.after(start)&&now.before(end)){
				return true;
			}
			return false;
		}catch(Exception e){
			return false;
		}
	}
	
	public void payForOrder(Order order){
		Double income = OrderIncomePolicy.orderIncome(order);
		this.storeAccount -= income;
	}
	
	public void notPayForOrder(Order order){
		Double income = OrderIncomePolicy.orderIncome(order);
		this.storeAccount += income;
	}
	
	public Double getStoreJifen(){
		return this.storeJifen;
	}
	
	public void setStoreJifen(Double jifen){
		this.storeJifen = jifen;
	}
	
	public Integer getStoreEv(){
		return this.storeEv;
	}
	
	public void setStoreEv(Integer storeEv){
		this.storeEv = storeEv;
	}
	
	public void setStoreSendDistanceText(String storeSendDistanceText){
		this.storeSendDistanceText = storeSendDistanceText;
	}
	
	public String getStoreSendDistanceText(){
		return this.storeSendDistanceText;
	}
}