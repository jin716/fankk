package com.ymai.hibernate;

import java.math.BigInteger;
import java.util.HashSet;
import java.util.Set;

import com.ymai.policy.UserJifenPolicy;

/**
 * User entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public class User implements java.io.Serializable {

	// Fields
	public final static String STATE_ACTIVE = "active";
	public final static String STATE_UN_ACTIVATE = "un_activate";
	public final static String STATE_FORBID = "forbid";

	private Integer userId;
	private String userLoginName;
	private String userPassword;
	private Boolean userIsAdmin;
	private Boolean userIsUser;
	private Boolean userIsStore;
	private BigInteger userTele;
	private String userAddr1;
	private String userAddr2;
	private String userAddr3;
	private String userFName;
	private String userLName;
	private String userGender;
	private String userEmail;
	private Set stores = new HashSet(0);
	private Set storeComnts = new HashSet(0);
	private Set orders = new HashSet(0);
	private String userState;
	private Integer userJifen;

	// Constructors

	/** default constructor */
	public User() {
	}

	/** minimal constructor */
	public User(String userLoginName, String userPassword, Boolean userIsAdmin,
			Boolean userIsUser, Boolean userIsStore, String userEmail) {
		this.userLoginName = userLoginName;
		this.userPassword = userPassword;
		this.userIsAdmin = userIsAdmin;
		this.userIsUser = userIsUser;
		this.userIsStore = userIsStore;
		this.userEmail = userEmail;
	}

	/** full constructor */
	public User(String userLoginName, String userPassword, Boolean userIsAdmin,
			Boolean userIsUser, Boolean userIsStore, BigInteger userTele,
			String userAddr1, String userAddr2, String userAddr3,
			String userFName, String userLName, String userGender,
			String userEmail, Set stores, Set storeComnts, Set orders) {
		this.userLoginName = userLoginName;
		this.userPassword = userPassword;
		this.userIsAdmin = userIsAdmin;
		this.userIsUser = userIsUser;
		this.userIsStore = userIsStore;
		this.userTele = userTele;
		this.userAddr1 = userAddr1;
		this.userAddr2 = userAddr2;
		this.userAddr3 = userAddr3;
		this.userFName = userFName;
		this.userLName = userLName;
		this.userGender = userGender;
		this.userEmail = userEmail;
		this.stores = stores;
		this.storeComnts = storeComnts;
		this.orders = orders;
	}

	// Property accessors

	public Integer getUserId() {
		return this.userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	
	public Integer getUserJifen() {
		return this.userJifen;
	}

	public void setUserJifen(Integer userJifen) {
		this.userJifen = userJifen;
	}

	public String getUserLoginName() {
		return this.userLoginName;
	}

	public void setUserLoginName(String userLoginName) {
		this.userLoginName = userLoginName;
	}

	public String getUserPassword() {
		return this.userPassword;
	}

	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}

	public Boolean getUserIsAdmin() {
		return this.userIsAdmin;
	}

	public void setUserIsAdmin(Boolean userIsAdmin) {
		this.userIsAdmin = userIsAdmin;
	}

	public Boolean getUserIsUser() {
		return this.userIsUser;
	}

	public void setUserIsUser(Boolean userIsUser) {
		this.userIsUser = userIsUser;
	}

	public Boolean getUserIsStore() {
		return this.userIsStore;
	}

	public void setUserIsStore(Boolean userIsStore) {
		this.userIsStore = userIsStore;
	}

	public BigInteger getUserTele() {
		return this.userTele;
	}

	public void setUserTele(BigInteger userTele) {
		this.userTele = userTele;
	}

	public String getUserAddr1() {
		return this.userAddr1;
	}

	public void setUserAddr1(String userAddr1) {
		this.userAddr1 = userAddr1;
	}

	public String getUserAddr2() {
		return this.userAddr2;
	}

	public void setUserAddr2(String userAddr2) {
		this.userAddr2 = userAddr2;
	}

	public String getUserAddr3() {
		return this.userAddr3;
	}

	public void setUserAddr3(String userAddr3) {
		this.userAddr3 = userAddr3;
	}

	public String getUserFName() {
		return this.userFName;
	}

	public void setUserFName(String userFName) {
		this.userFName = userFName;
	}

	public String getUserLName() {
		return this.userLName;
	}

	public void setUserLName(String userLName) {
		this.userLName = userLName;
	}

	public String getUserGender() {
		return this.userGender;
	}

	public void setUserGender(String userGender) {
		this.userGender = userGender;
	}

	public String getUserEmail() {
		return this.userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	public Set getStores() {
		return this.stores;
	}

	public void setStores(Set stores) {
		this.stores = stores;
	}

	public Set getStoreComnts() {
		return this.storeComnts;
	}

	public void setStoreComnts(Set storeComnts) {
		this.storeComnts = storeComnts;
	}

	public Set getOrders() {
		return this.orders;
	}

	public void setOrders(Set orders) {
		this.orders = orders;
	}
	
	public String getUserState() {
		return this.userState;
	}

	public void setUserState(String userState) {
		this.userState = userState;
	}
	


}