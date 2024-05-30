package spring.entity;

public class Cart {
	
	private Long id;  //장바구니 상품 아이디
	private String name;  //장바구니 상품명
	private int price;  //장바구니 가격
	private int quantity;  //개수
	
	public Cart( Long id, String name, int price, int quantity ) {
		this.id = id;
		this.name = name;
		this.price = price;
		this.quantity = quantity;
	}
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
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
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	

}
