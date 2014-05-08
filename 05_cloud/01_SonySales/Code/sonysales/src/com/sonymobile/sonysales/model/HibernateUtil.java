package com.sonymobile.sonysales.model;

import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.Logger;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.criterion.Restrictions;

/**
 * Configures and provides access to Hibernate sessions, tied to the current
 * thread of execution. Follows the Thread Local Session pattern, see
 * {@link http://hibernate.org/42.html }.
 */
public class HibernateUtil {

	private static SessionFactory sessionFactory;
	private Session session = null;
	private Transaction tx = null;
	private static Logger logger = Logger.getLogger(HibernateUtil.class
			.getName());
	static {
		try {
			Configuration config = new Configuration().configure();
			sessionFactory = config.buildSessionFactory();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private void openSession() {
		session = sessionFactory.openSession();
		tx = session.beginTransaction();
	}

	// add object
	public boolean addObject(Object model) {
		boolean ret = false;

		try {
			openSession();
			session.save(model);
			tx.commit();
			ret = true;
		} catch (Exception e) {
			e.printStackTrace();
			tx.rollback();
			ret = false;
		} finally {
			session.close();
		}
		return ret;
	}

	// get list
	public List<Object> getObjectByColumnName(Class objClass,
			ArrayList<String> columnName, ArrayList<Object> columeValue) {
		List<Object> ret = null;
		try {
			openSession();
			Criteria criteria = session.createCriteria(objClass);
			for (int i = 0; i < columnName.size(); i++) {
				criteria.add(Restrictions.eq(columnName.get(i),
						columeValue.get(i)));
			}
			ret = criteria.list();
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("Exception in getObjectByColumnName, ToString: "
					+ e.toString() + " message: " + e.getMessage());
			tx.rollback();
			ret = null;
		} finally {
			if (session != null) {
				session.close();
			}
		}
		return ret;
	}

	// update object
	public boolean updateObject(Object object) {
		boolean ret = false;
		try {
			openSession();
			session.update(object);
			tx.commit();
			ret = true;
		} catch (Exception e) {
			e.printStackTrace();
			tx.rollback();
			ret = false;
		} finally {
			if (session != null) {
				session.close();
			}
		}
		return ret;
	}
}