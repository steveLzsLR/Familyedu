package com.FamilyEdu.Dao.Impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import com.FamilyEdu.Dao.BaseDao;
import com.FamilyEdu.Dao.OrderDao;
import com.FamilyEdu.Model.Order;

@Repository("orderDao")
public class OrderDaoImpl extends BaseDao implements OrderDao{

	@Override
	public void addOrder(Order order) {
		getHibernateTemplate().save(order);
	}

	@Override
	public void deleteOrder(String orderId) {
		getHibernateTemplate().delete(getHibernateTemplate().get(Order.class, Integer.parseInt(orderId)));
	}

	@Override
	public void updateOrder(Order order) {
		getHibernateTemplate().update(order);
	}

	@Override
	public Map<String,Object> findAllOrderByParentId(String parentId,String page) {
		Query query=getSession().createQuery("from Order o where o.parentId=:parentId order by o.createDate desc");
		query.setParameter("parentId", parentId);
		int totalPage=(int) Math.ceil(query.list().size()/5.0);
		int size=Integer.parseInt(page)*5-5;
		query.setFirstResult(size);
		query.setMaxResults(5);
		Map<String, Object> map=new HashMap<>();
		map.put("totalPage", totalPage);
		map.put("sMyOrders", query.list());
		return map;
	}

	@Override
	public Map<String, Object> findAllOrderByTeacherId(String teacherId,String page) {
		Query query=getSession().createQuery("from Order o where o.teacherId=:teacherId order by o.createDate desc");
		query.setParameter("teacherId", teacherId);
		int totalPage=(int) Math.ceil(query.list().size()/5.0);
		int size=Integer.parseInt(page)*5-5;
		query.setFirstResult(size);
		query.setMaxResults(5);
		Map<String, Object> map=new HashMap<>();
		map.put("totalPage", totalPage);
		map.put("tMyOrders", query.list());
		return map;	
		}

	@Override
	public Map<String, Object> findConfirmedOrderByParentId(String parentId, String page) {
		Query query=getSession().createQuery("from Order o where o.parentId=:parentId and o.status=1 order by o.createDate desc");
		query.setParameter("parentId", parentId);
		int totalPage=(int) Math.ceil(query.list().size()/5.0);
		int size=Integer.parseInt(page)*5-5;
		query.setFirstResult(size);
		query.setMaxResults(5);
		Map<String, Object> map=new HashMap<>();
		map.put("totalPage", totalPage);
		map.put("sMyOrders", query.list());
		return map;
	}

	@Override
	public Map<String, Object> findUnconfirmedOrderByParentId(String parentId, String page) {
		Query query=getSession().createQuery("from Order o where o.parentId=:parentId and o.status=0 order by o.createDate desc");
		query.setParameter("parentId", parentId);
		int totalPage=(int) Math.ceil(query.list().size()/5.0);
		int size=Integer.parseInt(page)*5-5;
		query.setFirstResult(size);
		query.setMaxResults(5);
		Map<String, Object> map=new HashMap<>();
		map.put("totalPage", totalPage);
		map.put("sMyOrders", query.list());
		return map;
	}

	@Override
	public Map<String, Object> findConfirmedOrderByTeacherId(String teacherId, String page) {
		Query query=getSession().createQuery("from Order o where o.teacherId=:teacherId and o.status=1 order by o.createDate desc");
		query.setParameter("teacherId", teacherId);
		int totalPage=(int) Math.ceil(query.list().size()/5.0);
		int size=Integer.parseInt(page)*5-5;
		query.setFirstResult(size);
		query.setMaxResults(5);
		Map<String, Object> map=new HashMap<>();
		map.put("totalPage", totalPage);
		map.put("tMyOrders", query.list());
		return map;	
	}

	@Override
	public Map<String, Object> findUnconfirmedOrderByTeacherId(String teacherId, String page) {
		Query query=getSession().createQuery("from Order o where o.teacherId=:teacherId and o.status=0 order by o.createDate desc");
		query.setParameter("teacherId", teacherId);
		int totalPage=(int) Math.ceil(query.list().size()/5.0);
		int size=Integer.parseInt(page)*5-5;
		query.setFirstResult(size);
		query.setMaxResults(5);
		Map<String, Object> map=new HashMap<>();
		map.put("totalPage", totalPage);
		map.put("tMyOrders", query.list());
		return map;	
	}

	@Override
	public Order getOrder(String id) {
		return getHibernateTemplate().get(Order.class, Integer.parseInt(id));
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Order> findCommentOrderByTeacherId(String teacherId) {
		Query query=getSession().createQuery("from Order o where o.teacherId=:teacherId and o.commentStatus=1 order by o.createDate desc");
		query.setParameter("teacherId", teacherId);
		query.setFirstResult(0);
		query.setMaxResults(10);
		return query.list();
	}

}
