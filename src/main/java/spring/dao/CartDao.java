package spring.dao;

import java.sql.ResultSet;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.jdbc.core.JdbcTemplate;

import spring.entity.Cart;

public class CartDao {

	private JdbcTemplate jdbcTemplate;
	public CartDao(DataSource dataSource) {
			this.jdbcTemplate = new JdbcTemplate(dataSource);
	}
	//전체 리스트 보여주기
	public List<Cart> select_All() {
		List<Cart> results = jdbcTemplate.query("select * from items",
		(ResultSet rs, int rowNum) -> {
			Cart cart = new Cart(rs.getLong("id"),  rs.getString("name"), rs.getInt("price"),rs.getInt("quantity"));
					cart.setId(rs.getLong("id"));
			return cart;
});
		return results;
}
	// 구매 추가
		public void insert(Cart cart) {
			String query = "INSERT INTO items (name, price, quantity) VALUES (?, ?, ?)";
			jdbcTemplate.update(query, cart.getName(), cart.getPrice(), cart.getQuantity());
		}
	
		//구매 목록 삭제
		public void delete(Long id) {
		    jdbcTemplate.update("DELETE FROM items WHERE id = ?", id);
		}
	
	
	
}
