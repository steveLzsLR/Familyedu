package com.FamilyEdu.Service.Impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.FamilyEdu.Dao.OrderDao;
import com.FamilyEdu.Model.Order;
import com.FamilyEdu.Service.OrderService;

@Service("orderService")
public class OrderServiceImpl implements OrderService{

	@Autowired
	private OrderDao orderDao;
	
	@Override
	public void addOrder(Order order) {
		orderDao.addOrder(order);
	}

	@Override
	public void deleteOrder(String orderId) {
		orderDao.deleteOrder(orderId);
	}

	@Override
	public void updateOrder(Order order) {
		orderDao.updateOrder(order);
	}

	@Override
	public Map<String,Object> findAllOrderByParentId(String parentId,String page) {
		return orderDao.findAllOrderByParentId(parentId,page);
	}

	@Override
	public Map<String, Object> findAllOrderByTeacherId(String teacherId,String page) {
		return orderDao.findAllOrderByTeacherId(teacherId,page);
	}

	@Override
	public Map<String, Object> findConfirmedOrderByParentId(String parentId,String page) {
		return orderDao.findConfirmedOrderByParentId(parentId, page);
	}

	@Override
	public Map<String, Object> findUnconfirmedOrderByParentId(String parentId,String page) {
		return orderDao.findUnconfirmedOrderByParentId(parentId, page);
	}

	@Override
	public Map<String, Object> findConfirmedOrderByTeacherId(String teacherId, String page) {
		return orderDao.findConfirmedOrderByTeacherId(teacherId, page);
	}

	@Override
	public Map<String, Object> findUnconfirmedOrderByTeacherId(String teacherId, String page) {
		return orderDao.findUnconfirmedOrderByTeacherId(teacherId, page);
	}

	@Override
	public Order getOrder(String id) {
		return orderDao.getOrder(id);
	}

	@Override
	public List<Order> findCommentOrderByTeacherId(String teacherId) {
		return orderDao.findCommentOrderByTeacherId(teacherId);
	}

}
