package spring.controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import spring.Item_RegisterRequest;
import spring.dao.CartDao;
import spring.dao.ItemDao;
import spring.dao.MemberDao;
import spring.entity.Cart;
import spring.entity.Item;
import spring.entity.Member;
import spring.service.ItemRegisterService;

@Controller
public class MainController {
	@Autowired
		private MemberDao memberDao;
	@Autowired
	private ItemDao itemDao;           
	@Autowired
	private ItemRegisterService itemRegisterService;
	@Autowired
	private CartDao cartDao;
	
	//직원 리스트 
	@GetMapping(value="/list")
 	public String list(Model model) {
		List<Member> memberList = memberDao.selectAll();
			model.addAttribute("members", memberList);
			return "member/list";
		}
		
	//상품 전체 리스트 (상품목록)
	@GetMapping(value="/item")
		public String item_List(Model model) {
			List<Item> itemList = itemDao.select_All();
			model.addAttribute("items", itemList);
			return "item/items";
			}

	
	//냉동식품 리스트
	@GetMapping(value="/item/frozen_item")
		public String frozen_item_List(Model model) {
			List<Item> frozen_itemList = itemDao.select_All();
			model.addAttribute("frozen_item",frozen_itemList);
			return "item/frozen_item";
			}
	//냉장식품 리스트
		@GetMapping(value="/item/refriger_item")
			public String refriger_item_List(Model model) {
				List<Item> refriger_itemList = itemDao.select_All();
				model.addAttribute("refriger_item",refriger_itemList);
				return "item/refriger_item";
				}
	//유제품 리스트
		@GetMapping(value="/item/dairy_item")
		public String dairy_item_List(Model model) {
			List<Item> dairy_itemList = itemDao.select_All();
			model.addAttribute("dairy_item",dairy_itemList);
			return "item/dairy_item";
			}
	//음료/주류 리스트
		@GetMapping(value="/item/drink_item")
		public String drink_item_List(Model model) {
			List<Item> drink_itemList = itemDao.select_All();
			model.addAttribute("drink_item",drink_itemList);
			return "item/drink_item";
			}
	//스낵 리스트
	@GetMapping(value="/item/snack_item")
	public String snack_item_List(Model model) {
		List<Item> snack_itemList = itemDao.select_All();
		model.addAttribute("snack_item",snack_itemList);
		return "item/snack_item";
		}
	//스낵 리스트
		@GetMapping(value="/item/ramen_item")
		public String ramen_item_List(Model model) {
			List<Item> ramen_itemList = itemDao.select_All();
			model.addAttribute("ramen_item",ramen_itemList);
			return "item/ramen_item";
			}
	
	
	//상품 등록
	@GetMapping(value="/item_register")
	public String item_register(Model model) {
		model.addAttribute("item_registerRequest", new Item_RegisterRequest());
		return "register/item_register";
		
	}
//상품 등록 성공
	@PostMapping(value = "/item_register_success")
	public String item_register_success(Item_RegisterRequest regReq, Model model) {
		try {
			itemRegisterService.item_regist(regReq);
			model.addAttribute("item_registerRequest", regReq);
			return "register/item_register_success";
		} catch (Exception ex) {
			return "register/item_register";
		}
	}
	
	//등록된 상품 리스트
	@GetMapping(value="/item_list")
	public String item_All_List(Model model) {
		List<Item> item_AllList = itemDao.select_All();
		model.addAttribute("items", item_AllList);
		return "item/item_list";
		}
	
	//상품 수정 페이지
	@GetMapping("/edit/{name}")
    public String editItem(@PathVariable("name") String name, Model model) {
        Item item = itemDao.selectByName(name);
        if (item != null) {
            model.addAttribute("item", item);
            return "item/edit";
        } else {
            return "redirect:/item_list"; // Redirect to item list if item not found
        }
    }
	 // 수정 처리하기
    @PostMapping("/edit/{name}")
    public String updateItem(@PathVariable("name") String name, Item updatedItem) {
        Item item = itemDao.selectByName(name);
        if (item != null) {
            item.setName(updatedItem.getName());
            item.setPrice(updatedItem.getPrice());
            item.setStock(updatedItem.getStock());
            item.setCategory(updatedItem.getCategory());
            item.setWname(updatedItem.getWname());

            itemDao.update(item);
        }
        return "redirect:/item_list"; // Redirect to item list after update
    }
 // 상품 삭제 페이지
    @GetMapping("/delete/{product_id}")
    public String deleteItem(@PathVariable("product_id") long product_id) {
        itemDao.delete(product_id);
    return "redirect:/item_list"; // Redirect to item list after deletion
    }
    
    //회원 삭제
    @GetMapping("/member/delete/{email}")
    public String deleteMember(@PathVariable("email") String email) {
        memberDao.delete(email);
    return "redirect:/list"; // Redirect to the member list after deletion
    }
    //구매목록 
    @GetMapping(value="/cart")
	public String cartList(Model model) {
		List<Cart> cartList = cartDao.select_All();
		model.addAttribute("cartItems", cartList);
		return "item/cart";
	}
    
	//구매목록에 추가
	@PostMapping(value="/cart/add")
	public String addToCart(
						@RequestParam("id") Long id,
						@RequestParam("name") String name,
	                        @RequestParam("price") int price,
	                        @RequestParam("quantity") int quantity) {
		Cart cart = new Cart(id, name, price, quantity);
		cartDao.insert(cart);
		return "redirect:/cart";
	}
	 //구매목록 삭제
    @GetMapping("/cart/delete/{id}")
    public String deleteCart(@PathVariable("id") Long id) {
        cartDao.delete(id);
    return "redirect:/cart"; // Redirect to the member list after deletion
    }
	
	//결제완료 페이지
	@RequestMapping("/order")
    public String order() {
        return "item/order";
    }
    
    
    }

