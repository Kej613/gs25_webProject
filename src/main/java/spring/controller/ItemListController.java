package spring.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import spring.dao.ItemDao;
import spring.entity.Item;


@Controller
public class ItemListController {
	private ItemDao itemDao;

	public void setItemDao(ItemDao itemDao) {
		this.itemDao = itemDao;
	}
	@RequestMapping(value="/items")
	public String list(
			@ModelAttribute("imd") ListCommand listCommand,Errors errors, Model model) {
		if(errors.hasErrors()) {
			return "item/itemList";
		}
		
		if (listCommand.getFrom() != null && listCommand.getTo() != null) {
			List<Item> items = itemDao.selectByRegdate(listCommand.getFrom(),listCommand.getTo());
			model.addAttribute("items", items); 
		}
		return "item/itemList";
	}
}
