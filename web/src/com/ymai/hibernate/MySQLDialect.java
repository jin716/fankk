package com.ymai.hibernate;

import java.sql.Types;

import org.hibernate.Hibernate;

public class MySQLDialect extends org.hibernate.dialect.MySQLDialect {
	public MySQLDialect() {
		super();
		registerHibernateType(Types.DECIMAL, Hibernate.BIG_INTEGER.getName());
	}
}
