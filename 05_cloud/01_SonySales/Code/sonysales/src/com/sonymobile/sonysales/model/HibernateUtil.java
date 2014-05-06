package com.sonymobile.sonysales.model;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.criterion.Restrictions;
import org.hibernate.tool.hbm2ddl.SchemaUpdate;

/**
 * Configures and provides access to Hibernate sessions, tied to the current
 * thread of execution. Follows the Thread Local Session pattern, see
 * {@link http://hibernate.org/42.html }.
 */
public class HibernateUtil {

	static SessionFactory sessionFactory;
	private Session session = null;
	private Transaction tx = null;
	// ��ʼ��Hibernate,����SessionFactoryʵ��,ֻ�ڸ��౻���ص��ڴ�ʱִ��һ��
	static {
		try {
			Configuration config = new Configuration()
					.configure("hibernate.cfg.xml");
			// config.addClass(TbMessage.class);
			sessionFactory = config.buildSessionFactory();

			System.out.println("sessionFactory: " + sessionFactory);
		} catch (Exception e) {
			System.out.println("static " + e.getMessage());
		}
	}

	public HibernateUtil() {
		Configuration config = new Configuration().configure();
		SchemaUpdate update = new SchemaUpdate(config);
		update.execute(false, true);
	}

	// ����session
	public void openSession() {
		session = sessionFactory.openSession();
		tx = session.beginTransaction();// ��������
	}

	public boolean addUser(User model) {
		boolean ret = false;

		openSession();// ����session

		try {
			session.save(model);
			tx.commit();
			ret = true;
		} catch (Exception e) {
			System.out.print(e.toString());
			tx.rollback();
			ret = false;
		} finally {
			session.close();
		}
		return ret;
	}

	public boolean addPopularity(Popularity model) {
		boolean ret = false;

		openSession();// ����session

		try {
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

	// ��ȡ������Ϣ�б�
	public List<User> listMessage() {
		openSession();// ����session
		String hql = "FROM user m ORDER BY m.sendTime DESC"; // �����ѯȫ��������Ϣ
		List<User> list = null;
		try {
			Query query = session.createQuery(hql);
			list = (List<User>) query.list();
		} catch (Exception e) {
			System.out.println("��ѯʱ�Ĵ�����Ϣ��" + e.getMessage());
		} finally {
			session.close();
		}
		return list;

	}

	// ��ȡָ��������Ϣ
	public User getUser(int id) {
		openSession();// ����session
		User user = (User) session.get(User.class, id);// ͨ��get������ѯָ��ID��������Ϣ
		session.close(); // �ر�session
		return user;
	}

	/*
	 * ��ȡָ��������Ϣ public NewUser getUserByOpenId(String openId) {
	 * openSession();// ����session try { Criteria criteria =
	 * session.createCriteria(NewUser.class);
	 * criteria.add(Restrictions.eq("openId", openId));
	 * 
	 * List<NewUser> list = criteria.list();
	 * 
	 * return list.get(0); } finally { if (session != null) session.close(); } }
	 */
	public User getUserByOpenId(String openId) {
		List<Object> list = getObjectByColumnName(User.class, "openId", openId);
		if (list.size() == 0) {
			return null;
		}
		return (User) list.get(0);
	}

	public boolean ExistOpenIdInUser(String openId) {
		List<Object> list = getObjectByColumnName(User.class, "openId", openId);
		return list.size() > 0;
	}

	public boolean ExistJdIdInUser(String jdId) {
		List<Object> list = getObjectByColumnName(User.class, "jdId", jdId);
		return list.size() > 0;
	}

	public List<Object> getObjectByColumnName(Class objClass,
			String ColumnName, Object openId) {
		openSession();// ����session
		try {
			Criteria criteria = session.createCriteria(objClass);
			criteria.add(Restrictions.eq(ColumnName, openId));

			return criteria.list();
		} finally {
			if (session != null)
				session.close();
		}
	}

	// �޸�������Ϣ
	public boolean updateUser(User user) {
		boolean ret = false;
		try {
			openSession();
			session.update(user);
			tx.commit();
			ret = true;
		} catch (Exception e) {
			System.out.print(e.toString());
			tx.rollback();
			ret = false;
		} finally {
			session.close();
		}
		return ret;
	}

	// �ر�session
	public void closeSession() {
		session.close();
	}

}