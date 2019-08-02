package com.risk.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.risk.dao.OrderDetailDao;
import com.risk.model.OrderDetails;

@Service("orderDetailsService")
@Transactional
public class OrderDetailServiceImpl implements OrderDetailsService{

	@Autowired
	OrderDetailDao orderDetailDao;
	
	@Override
	public List<OrderDetails> getOrderDetailList() {
		return orderDetailDao.getOrderDetaiList();
	}

	@Override
	public void SaveOrderDetail(OrderDetails orderDetail) {
		orderDetailDao.SaveOrderDetail(orderDetail);
	}

	@Override
	public void deleteOrderDetail(OrderDetails orderDetail) {
		orderDetailDao.deleteOrderDetail(orderDetail);
	}

	@Override
	public OrderDetails findById(int id) {
		return orderDetailDao.findById(id);
	}

	@Override
	public void updateOrderDetail(OrderDetails orderDetails) {
		OrderDetails entity= orderDetailDao.findById(orderDetails.getOrderId());
		if(entity!=null) {
			entity.setAmount(orderDetails.getAmount());
			entity.setComment(orderDetails.getComment());
			entity.setCustomerId(orderDetails.getCustomerId());
			entity.setFoodItemId(orderDetails.getFoodItemId());
			entity.setFoodItemName(orderDetails.getFoodItemName());
			entity.setQuantity(orderDetails.getQuantity());
			entity.setFoodItemPrice(orderDetails.getFoodItemPrice());
		}
	}

	
}
