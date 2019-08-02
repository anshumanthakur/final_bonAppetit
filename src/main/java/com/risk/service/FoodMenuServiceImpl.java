package com.risk.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.risk.dao.FoodMenuDao;
import com.risk.model.FoodMenu;

@Service("FoodMenuService")
@Transactional
public class FoodMenuServiceImpl implements FoodMenuService {

	
	@Autowired
	FoodMenuDao foodMenuDao;
	
	@Override
	public List<FoodMenu> getMenuList() {
		return foodMenuDao.getMenuList();
	}

	@Override
	public void SaveMenu(FoodMenu menu) {
		foodMenuDao.SaveMenu(menu);
	}

}
