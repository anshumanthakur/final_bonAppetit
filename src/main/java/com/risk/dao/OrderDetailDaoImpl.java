package com.risk.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.springframework.stereotype.Repository;

import com.risk.model.OrderDetails;

@Repository("orderDetailDao")
public class OrderDetailDaoImpl extends AbstractDao<Integer, OrderDetails> implements OrderDetailDao {

	@Override
	@SuppressWarnings("unchecked")
	public List<OrderDetails> getOrderDetaiList() {
		Criteria criteria = createEntityCriteria();
		return (List<OrderDetails>) criteria.list();
	}

	@Override
	public void SaveOrderDetail(OrderDetails orderDetail) {
		persist(orderDetail);
	}

	@Override
	public void deleteOrderDetail(OrderDetails orderDetail) {
		delete(orderDetail);
	}

	@Override
	public OrderDetails findById(int id) {
		// TODO Auto-generated method stub
		return getByKey(id);
	}

}
