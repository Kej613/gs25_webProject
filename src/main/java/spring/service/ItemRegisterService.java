package spring.service;

import java.time.LocalDateTime;

import org.springframework.stereotype.Service;

import spring.Item_RegisterRequest;
import spring.dao.ItemDao;
import spring.entity.Item;


@Service
public class ItemRegisterService {
	private ItemDao itemDao;

	public ItemRegisterService(ItemDao itemDao) {
			this.itemDao = itemDao;
	}

	public Long item_regist(Item_RegisterRequest req) throws Exception {
			Item item = itemDao.selectByName(req.getName());
			if (item != null) {
			throw new Exception("DuplicateMemberException");
	}
	Item newItem = new Item( req.getName(), req.getPrice(),req.getStock(), req.getCategory(), req.getWname(), LocalDateTime.now());
			itemDao.item_insert(newItem);
			return newItem.getProduct_id();
	}
}
