package kr.ac.kopo.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import kr.ac.kopo.util.ConnectionFactory;

public class MemberDAO {

	public List<MemberVO> selectAll() {
		
		List<MemberVO> list = new ArrayList<>();
		StringBuilder sql = new StringBuilder();
		sql.append(" select id, name, password, email_id, email_domain, ");
		sql.append(" 	tel1, tel2, tel3, post, basic_addr, detail_addr, ");
		sql.append(" 	type, to_char(reg_date,'yyyy-mm-dd')as reg_date ");
		sql.append(" 	from t_member where type = 'U' order by reg_date ");
		
		try (
			Connection conn = new ConnectionFactory().getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql.toString());
		){
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				MemberVO member = new MemberVO();
				member.setId(rs.getString("id"));
				member.setName(rs.getString("name"));
				member.setPassword(rs.getString("password"));
				member.setEmailId(rs.getString("email_id"));
				member.setEmailDomain(rs.getString("email_domain"));
				member.setTel1(rs.getString("tel1"));
				member.setTel2(rs.getString("tel2"));
				member.setTel3(rs.getString("tel3"));
				member.setPost(rs.getString("post"));
				member.setBasicAddr(rs.getString("basic_addr"));
				member.setDetailAddr(rs.getString("detail_addr"));
				member.setType(rs.getString("type"));
				member.setDate(rs.getString("reg_date"));
				
				list.add(member);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	public MemberVO selectById(String memberId) {
		
		MemberVO member = null;
		StringBuilder sql = new StringBuilder();
		sql.append(" select * from t_member where id = ? ");
		
		try (
			Connection conn = new ConnectionFactory().getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql.toString());
		){
			pstmt.setString(1, memberId);
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				member = new MemberVO();
				member.setId(rs.getString("id"));
				member.setName(rs.getString("name"));
				member.setEmailId(rs.getString("email_id"));
				member.setEmailDomain(rs.getString("email_domain"));
				member.setType(rs.getString("type"));
				member.setDate(rs.getString("reg_date"));
				member.setTel1(rs.getString("tel1"));
				member.setTel2(rs.getString("tel2"));
				member.setTel3(rs.getString("tel3"));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return member;
	}
	
	public void sign(MemberVO member) {
		
		StringBuilder sql = new StringBuilder();
		sql.append(" insert into t_member(id, name, password, email_id, email_domain, ");
		sql.append(" tel1, tel2, tel3, post, basic_addr, detail_addr, ");
		sql.append(" type, reg_date) values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, sysdate) ");
		
		try (
			Connection conn = new ConnectionFactory().getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql.toString());
		){
			pstmt.setString(1, member.getId());
			pstmt.setString(2, "name");
			pstmt.setString(3, "password");
			pstmt.setString(4, "email_id");
			pstmt.setString(5, "email_domain");
			pstmt.setString(6, "tel1");
			pstmt.setString(7, "tel2");
			pstmt.setString(8, "tel3");
			pstmt.setString(9, "post");
			pstmt.setString(10, "basic_addr");
			pstmt.setString(11, "detail_addr");
			pstmt.setString(12, "type");

			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
}
