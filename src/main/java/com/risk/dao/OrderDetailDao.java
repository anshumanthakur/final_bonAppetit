package com.risk.dao;

import java.util.List;

import com.risk.model.OrderDetails;

public interface OrderDetailDao {
	
	OrderDetails findById(int id);
	
	List<OrderDetails> getOrderDetaiList();

	void SaveOrderDetail(OrderDetails orderDetail);
	
	void deleteOrderDetail(OrderDetails orderDetail);
}
