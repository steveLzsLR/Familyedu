package com.FamilyEdu.Dao;

import java.util.List;
import java.util.Map;

import com.FamilyEdu.Model.Order;

public interface OrderDao {
	
//	添加订单
	public void addOrder(Order order);
	
//	删除订单
	public void deleteOrder(String orderId);
	
//	修改订单
	public void updateOrder(Order order);
	
//	家长获得所有订单
	public Map<String, Object> findAllOrderByParentId(String parentId,String page);

//	家长获得确认订单
	public Map<String, Object> findConfirmedOrderByParentId(String parentId,String page);

//	家长获得未确认订单
	public Map<String, Object> findUnconfirmedOrderByParentId(String parentId,String page);
	
//	教师获得所有订单
	public Map<String, Object> findAllOrderByTeacherId(String teacherId,String page);
	
//	教师获得确认订单
	public Map<String, Object> findConfirmedOrderByTeacherId(String teacherId,String page);

//	教师获得未确认订单
	public Map<String, Object> findUnconfirmedOrderByTeacherId(String teacherId,String page);

//  获得订单
	public Order getOrder(String id);
	
//	根据教师id获取最新10条教师评价
	public List<Order> findCommentOrderByTeacherId(String teacherId);
}
