package spring.dao;
import java.util.List;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.sql.Date;

import javax.sql.DataSource;
import org.springframework.jdbc.core.*;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;

import spring.entity.Member;

public class MemberDao {
		private JdbcTemplate jdbcTemplate;
		public MemberDao(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
}
		//직원 전체 리스트
		public List<Member> selectAll() {
				List<Member> results = jdbcTemplate.query("select * from MEMBER",
				(ResultSet rs, int rowNum) -> {
					Member member = new Member( rs.getString("EMAIL"), rs.getString("PASSWORD"),
							rs.getString("NAME"), rs.getTimestamp("REGDATE").toLocalDateTime());
							member.setId(rs.getLong("ID"));
					return member;
		});
				return results;
		}
		
		public Member selectByEmail(String email) {
			List<Member> results = jdbcTemplate.query("select * from MEMBER where EMAIL = ?",new RowMapper<Member>() {
				@Override 
				public Member mapRow(ResultSet rs, int rowNum)  throws SQLException{
					Member member= new Member(  
							rs.getString("EMAIL"),
							rs.getString("PASSWORD"),
							rs.getString("NAME"),
							rs.getTimestamp("REGDATE").toLocalDateTime());
					member.setId(rs.getLong("ID"));
							return member;
					}}, email);
			return results.isEmpty() ? null : results.get(0);
			}
		
		//직원 등록
		public void insert(final Member member) {
			KeyHolder keyHolder = new GeneratedKeyHolder();
			jdbcTemplate.update(new PreparedStatementCreator() {
						@Override
						public PreparedStatement createPreparedStatement(Connection con)
							throws SQLException
							{ //파라미터로 전달받은 Connection을 이용해PreparedStatement 생성
								PreparedStatement pstmt = con.prepareStatement(
										"insert into MEMBER (EMAIL, PASSWORD, NAME, REGDATE) values(?,?,?,?)", new String[] {"ID"} ); //insert()메서드에서 삽입하는 Member 객체의 ID를 구할 수 있다.
								pstmt.setString(1,  member.getEmail());
								pstmt.setString(2,  member.getPassword());
								pstmt.setString(3,  member.getName());
								pstmt.setDate(4, new java.sql.Date(Timestamp.valueOf(member.getRegisterDateTime()).getTime()));
								return pstmt;
							}
					},
					keyHolder );
			Number keyValue = keyHolder.getKey();
			member.setId(keyValue.longValue());
		}
		
		//직원 정보 업데이트
		public void update(Member member) {
		    jdbcTemplate.update( "update MEMBER set EMAIL = ?, PASSWORD = ?, NAME = ?, REGDATE = ? where ID = ?",
		        member.getEmail(),
		        member.getPassword(),
		        member.getName(),
		        Date.valueOf(member.getRegisterDateTime().toLocalDate()),
		        member.getId()
		    );
		}
		//회원 등록일 조회
		public List<Member> selectByRegdate(LocalDateTime from, LocalDateTime to) {
			List<Member> results = jdbcTemplate.query("select*from Member where REGDATE between ? and ?" + "order by REGDATE desc",
														new RowMapper<Member>() {
				@Override
				public Member mapRow(ResultSet rs, int rowNum) throws SQLException {
					Member member = new Member(
							rs.getString("EMAIL"),
							rs.getString("PASSWORD"),
							rs.getString("NAME"),
							rs.getTimestamp("REGDATE").toLocalDateTime());
					member.setId(rs.getLong("ID"));
					return member; 
							
				}
			}, from, to);
			return results;
		}
		
		//회원 삭제
		public void delete(String email) {
		    jdbcTemplate.update("DELETE FROM MEMBER WHERE EMAIL = ?", email);
		}
		

}