package com.ymai.hibernate;

import java.util.List;
import java.util.Set;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.hibernate.Query;
import org.hibernate.criterion.Example;

/**
 * A data access object (DAO) providing persistence and search support for User
 * entities. Transaction control of the save(), update() and delete() operations
 * can directly support Spring container-managed transactions or they can be
 * augmented to handle user-managed Spring transactions. Each of these methods
 * provides additional information for how to configure it for the desired type
 * of transaction control.
 * 
 * @see com.ymai.hibernate.User
 * @author MyEclipse Persistence Tools
 */

public class UserDAO extends BaseHibernateDAO {
	private static final Log log = LogFactory.getLog(UserDAO.class);
	// property constants
	public static final String USER_LOGIN_NAME = "userLoginName";
	public static final String USER_PASSWORD = "userPassword";
	public static final String USER_IS_ADMIN = "userIsAdmin";
	public static final String USER_IS_USER = "userIsUser";
	public static final String USER_IS_STORE = "userIsStore";
	public static final String USER_TELE = "userTele";
	public static final String USER_ADDR1 = "userAddr1";
	public static final String USER_ADDR2 = "userAddr2";
	public static final String USER_ADDR3 = "userAddr3";
	public static final String USER_FNAME = "userFName";
	public static final String USER_LNAME = "userLName";
	public static final String USER_GENDER = "userGender";
	public static final String USER_EMAIL = "userEmail";

	public void save(User transientInstance) {
		log.debug("saving User instance");
		try {
			getSession().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(User persistentInstance) {
		log.debug("deleting User instance");
		try {
			getSession().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public User findById(java.lang.Integer id) {
		log.debug("getting User instance with id: " + id);
		try {
			User instance = (User) getSession().get("com.ymai.hibernate.User",
					id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(User instance) {
		log.debug("finding User instance by example");
		try {
			List results = getSession().createCriteria(
					"com.ymai.hibernate.User").add(Example.create(instance))
					.list();
			log.debug("find by example successful, result size: "
					+ results.size());
			return results;
		} catch (RuntimeException re) {
			log.error("find by example failed", re);
			throw re;
		}
	}

	public List findByProperty(String propertyName, Object value) {
		log.debug("finding User instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from User as model where model."
					+ propertyName + "= ?";
			Query queryObject = getSession().createQuery(queryString);
			queryObject.setParameter(0, value);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByUserLoginName(Object userLoginName) {
		return findByProperty(USER_LOGIN_NAME, userLoginName);
	}

	public List findByUserPassword(Object userPassword) {
		return findByProperty(USER_PASSWORD, userPassword);
	}

	public List findByUserIsAdmin(Object userIsAdmin) {
		return findByProperty(USER_IS_ADMIN, userIsAdmin);
	}

	public List findByUserIsUser(Object userIsUser) {
		return findByProperty(USER_IS_USER, userIsUser);
	}

	public List findByUserIsStore(Object userIsStore) {
		return findByProperty(USER_IS_STORE, userIsStore);
	}

	public List findByUserTele(Object userTele) {
		return findByProperty(USER_TELE, userTele);
	}

	public List findByUserAddr1(Object userAddr1) {
		return findByProperty(USER_ADDR1, userAddr1);
	}

	public List findByUserAddr2(Object userAddr2) {
		return findByProperty(USER_ADDR2, userAddr2);
	}

	public List findByUserAddr3(Object userAddr3) {
		return findByProperty(USER_ADDR3, userAddr3);
	}

	public List findByUserFName(Object userFName) {
		return findByProperty(USER_FNAME, userFName);
	}

	public List findByUserLName(Object userLName) {
		return findByProperty(USER_LNAME, userLName);
	}

	public List findByUserGender(Object userGender) {
		return findByProperty(USER_GENDER, userGender);
	}

	public List findByUserEmail(Object userEmail) {
		return findByProperty(USER_EMAIL, userEmail);
	}

	public List findAll() {
		log.debug("finding all User instances");
		try {
			String queryString = "from User";
			Query queryObject = getSession().createQuery(queryString);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public User merge(User detachedInstance) {
		log.debug("merging User instance");
		try {
			User result = (User) getSession().merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(User instance) {
		log.debug("attaching dirty User instance");
		try {
			getSession().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(User instance) {
		log.debug("attaching clean User instance");
		try {
			getSession().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}
}