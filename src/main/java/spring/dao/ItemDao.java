package spring.dao;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;

import spring.entity.Item;
import spring.entity.Member;


public class ItemDao {
	
	private JdbcTemplate jdbcTemplate;
	public ItemDao(DataSource dataSource) {
	this.jdbcTemplate = new JdbcTemplate(dataSource);
	}
	
	//전체 리스트 보여주기
	public List<Item> select_All() {
		List<Item> P_results = jdbcTemplate.query("select * from PRODUCT",
		(ResultSet rs, int rowNum) -> {
			Item item = new Item( rs.getString("NAME"), rs.getInt("PRICE"),
					rs.getInt("STOCK"),rs.getString("CATEGORY"), rs.getString("WNAME"), rs.getTimestamp("INPUTDATE").toLocalDateTime());
					item.setProduct_id(rs.getLong("PRODUCT_ID"));
			return item;
});
		return P_results;
}
	//상품명 검색
	public Item selectByName(String name) {
		List<Item> results = jdbcTemplate.query("select * from PRODUCT where NAME = ?",new RowMapper<Item>() {
			@Override 
			public Item mapRow(ResultSet rs, int rowNum)  throws SQLException{
				Item item= new Item(  
						rs.getString("NAME"),
						rs.getInt("PRICE"),
						rs.getInt("STOCK"),
						rs.getString("CATEGORY"),
						rs.getString("WNAME"),
						rs.getTimestamp("INPUTDATE").toLocalDateTime());
				item.setProduct_id(rs.getLong("PRODUCT_ID"));
						return item;
				}}, name);
		return results.isEmpty() ? null : results.get(0);
		}
	
	// 상품 입고일 조회
	public List<Item> selectByRegdate(LocalDateTime from, LocalDateTime to) {
		List<Item> results = jdbcTemplate.query("select*from PRODUCT where INPUTDATE between ? and ?" + "order by INPUTDATE desc",
													new RowMapper<Item>() {
			@Override
			public Item mapRow(ResultSet rs, int rowNum) throws SQLException {
				Item item = new Item(
						rs.getString("NAME"),
						rs.getInt("PRICE"),
						rs.getInt("STOCK"),
						rs.getString("CATEGORY"),
						rs.getString("WNAME"),
						rs.getTimestamp("INPUTDATE").toLocalDateTime());
				item.setProduct_id(rs.getLong("PRODUCT_ID"));
				return item; 
						
			}
		}, from, to);
		return results;
	}
	
	//상품 등록
	public void item_insert(final Item item) {
		KeyHolder keyHolder = new GeneratedKeyHolder();
		jdbcTemplate.update(new PreparedStatementCreator() {
					@Override
					public PreparedStatement createPreparedStatement(Connection con)
						throws SQLException
						{ //파라미터로 전달받은 Connection을 이용해PreparedStatement 생성
							PreparedStatement pstmt = con.prepareStatement(
									"insert into PRODUCT (NAME, PRICE , STOCK , CATEGORY, WNAME ,INPUTDATE) values(?,?,?,?,?,?)", new String[] {"PRODUCT_ID"} ); //insert()메서드에서 삽입하는 Member 객체의 ID를 구할 수 있다.
							pstmt.setString(1,  item.getName());
							pstmt.setInt(2,  item.getPrice());
							pstmt.setInt(3,  item.getStock());
							pstmt.setString(4,  item.getCategory());
							pstmt.setString(5,  item.getWname());
							pstmt.setDate(6, new java.sql.Date(Timestamp.valueOf(item.getInputDate()).getTime()));
							return pstmt;
						}
				},
				keyHolder );
		Number keyValue = keyHolder.getKey();
		item.setProduct_id(keyValue.longValue());
	}
	//상품 수정 
	public void update(Item item) {
	    jdbcTemplate.update("UPDATE PRODUCT SET NAME = ?, PRICE = ?, STOCK = ?, CATEGORY = ?, WNAME = ?, INPUTDATE = ? WHERE PRODUCT_ID = ?",
	            item.getName(), item.getPrice(), item.getStock(), item.getCategory(), item.getWname(),
	            Timestamp.valueOf(item.getInputDate()), item.getProduct_id());
	}
	
	// 상품 검색
	public Item searchItems(String keyword) {
	    	List<Item> results = jdbcTemplate.query("SELECT * FROM PRODUCT WHERE NAME= ?", new RowMapper<Item>() {
	        @Override
	        public Item mapRow(ResultSet rs, int rowNum) throws SQLException {
	            Item item = new Item(
	            		rs.getString("NAME"),
	            		rs.getInt("PRICE"), 
	            		rs.getInt("STOCK"),
	                    rs.getString("CATEGORY"),
	                    rs.getString("WNAME"),
	                    rs.getTimestamp("INPUTDATE").toLocalDateTime());
	            item.setProduct_id(rs.getLong("PRODUCT_ID"));
	            return item;
	        } }, keyword);
	return results.isEmpty() ? null : results.get(0);
	    }
	
	
	// 상품 삭제
	public void delete(long product_Id) {
	    jdbcTemplate.update("DELETE FROM PRODUCT WHERE PRODUCT_ID = ?", product_Id);
	}
	
	
}

