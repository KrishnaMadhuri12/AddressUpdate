/**
 * 
 */
package com.user.info.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.user.info.model.User;
import com.user.info.model.UserAddress;

@Repository("userInfoDAO")
@Transactional
public class UserInfoDAOImpl implements UserInfoDAO {

	static Logger logger = Logger.getLogger(UserInfoDAOImpl.class);

	@Autowired
	private SessionFactory sessionFactory;
	private Session session;

	@SuppressWarnings({ "unchecked"})
	@Override
	public Map<String, Object> isValidUser(String networkId) throws Exception {

		try {
			session = sessionFactory.getCurrentSession();
		} catch (HibernateException e) {
			session = sessionFactory.openSession();
		}

		Map<String, Object> userInfoObj = new HashMap<String, Object>();
		userInfoObj.put("status", "invalid");
		
		try {
			Transaction tx = session.beginTransaction();
			Query qry = session.createQuery(" FROM User where networkId =:networkid");
			qry.setParameter("networkid", networkId);
			List<User> results = qry.list();
			
			if(results.size() > 0) {
				userInfoObj.put("status", "valid");
				Query userAddQry = session.createQuery(" FROM UserAddress where networkId =:networkid");
				userAddQry.setParameter("networkid", networkId);
				
				List<UserAddress> userAddList = userAddQry.list();
				userInfoObj.put("result", userAddList);
			}
			
			tx.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null && session.isOpen()) {
				try {
					session.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}

		return userInfoObj;
	}

	@Override
	public String updateUserInfo(UserAddress userAddressObj) throws Exception {
		String status = "INVALID";
		try {
			session = sessionFactory.getCurrentSession();
		} catch (HibernateException e) {
			session = sessionFactory.openSession();
		}

		try {
			Transaction tx = session.beginTransaction();
			session.saveOrUpdate(userAddressObj);
			status = "VALID";
			tx.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null && session.isOpen()) {
				try {
					session.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}

		return status;
	}

}
