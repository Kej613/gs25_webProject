package spring.entity;

import java.time.LocalDateTime;

import javax.persistence.Entity;

@Entity
public class Item {
	
	private Long product_id; //상품아이디
	private String name;  //상품이름
	private int price;  //가격
	private int stock;  //재고수량 
	private String category;   //분류
	private String wname; //작성자 이름
	private LocalDateTime inputdate;  //입고날짜
	
	public Item(String name, int price, int stock,String category, String wname,LocalDateTime inputdate )
{
		this.name = name; 
		this.price = price;
		this.stock = stock; 
		this.category=category;
		this.wname=wname;
		this.inputdate= inputdate;
	
}
	public Long getProduct_id() {
		return product_id;
	}

	public void setProduct_id(Long product_id) {
		this.product_id = product_id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getStock() {
		return stock;
	}

	public void setStock(int stock) {
		this.stock = stock;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getWname() {
		return wname;
	}
	public void setWname(String wname) {
		this.wname=wname;
	}

	public LocalDateTime getInputDate() {
		return inputdate;
	}

	public void setInputDate(LocalDateTime inputdate) {
		this.inputdate = inputdate;
	}

}
