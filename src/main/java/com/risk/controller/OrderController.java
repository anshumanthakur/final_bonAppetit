package com.risk.controller;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.risk.model.FoodMenu;
import com.risk.model.OrderDetails;
import com.risk.service.FoodMenuService;
import com.risk.service.OrderDetailsService;

@Controller
public class OrderController {

	@Autowired
	FoodMenuService foodMenuService;

	@Autowired
	OrderDetailsService orderDetailsService;

	@Qualifier(value = "orderDetailsService")
	public void setPersonService(OrderDetailsService ods) {
		this.orderDetailsService = ods;
	}

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String listOrders(Model model) {
		model.addAttribute("order", new OrderDetails());

		List<FoodMenu> FoodMenuList = foodMenuService.getMenuList();
		model.addAttribute("FoodMenu", FoodMenuList);
		List<OrderDetails> orderDetailsList = orderDetailsService.getOrderDetailList();
		model.addAttribute("orderList", orderDetailsList);
		return "order";
	}

	@RequestMapping("/success")
	public ModelAndView success(@Valid @ModelAttribute("order") OrderDetails orderDetails, BindingResult result,
			@RequestParam("foodPrice") double priceDouble,
			@RequestParam("update") int updateInt,
			@RequestParam("orderId") int orderIdInt) {
		ModelAndView mav = new ModelAndView();
		// setters
		orderDetails.setCustomerId(1);
		orderDetails.setFoodItemPrice(priceDouble);
		orderDetails.setAmount(orderDetails.getFoodItemPrice() * orderDetails.getQuantity());

		if (updateInt == 1) {
			orderDetails.setOrderId(orderIdInt);
			orderDetailsService.updateOrderDetail(orderDetails);
		} else {
			orderDetailsService.SaveOrderDetail(orderDetails);

		}
//			orderDetails.setFoodItemId();

		mav.setViewName("redirect:/");
		return mav;
	}

	@RequestMapping("/delete/{id}")
	public String delete(@PathVariable("id") int id, Model model) {
		OrderDetails orderDetails = orderDetailsService.findById(id);
		orderDetailsService.deleteOrderDetail(orderDetails);
		return "redirect:/";
	}

	@RequestMapping("/bill")
	public String goToBillPage() {
		return "bill";
	}

	@RequestMapping("/test")
	public String test() {
		return "test";
	}

}
