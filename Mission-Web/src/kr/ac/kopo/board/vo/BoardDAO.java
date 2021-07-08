package kr.ac.kopo.board.vo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import kr.ac.kopo.util.ConnectionFactory;

public class BoardDAO {

	// t_board sequence 추출
	public int selectNo() {
		int no = 0;
		StringBuilder sql = new StringBuilder();
		sql.append(" select seq_t_board_no.nextval from dual ");

		try (Connection conn = new ConnectionFactory().getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql.toString());) {
			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) {
				no = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return no;
	}

	public void insert(BoardVO board) {

		StringBuilder sql = new StringBuilder();
		sql.append("insert into t_board(no, title, writer, content) ");
		sql.append(" values(?, ?, ?, ?) ");

		try (Connection conn = new ConnectionFactory().getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql.toString());
		){
			/* 후위증가이므로 loc=1부터 시작 */
			int loc = 1;
			pstmt.setInt(loc++, board.getNo());
			pstmt.setString(loc++, board.getTitle());
			pstmt.setString(loc++, board.getWriter());
			pstmt.setString(loc++, board.getContent());

			pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	/*
	 * public boolean updatee(BoardVO board) {
	 * 
	 * boolean result = false; StringBuilder sql = new StringBuilder();
	 * sql.append("update t_board set title = ?, content = ? where no = ?");
	 * 
	 * try (Connection conn = new ConnectionFactory().getConnection();
	 * PreparedStatement pstmt = conn.prepareStatement(sql.toString());) {
	 * pstmt.setString(1, board.getTitle()); pstmt.setString(2, board.getContent());
	 * pstmt.setInt(3, board.getNo());
	 * 
	 * int row = pstmt.executeUpdate();
	 * 
	 * if (row == 1) result = true;
	 * 
	 * } catch (Exception e) { e.printStackTrace(); } return result; }
	 */

	public List<BoardVO> selectAll() {

		List<BoardVO> list = new ArrayList<>();

		StringBuilder sql = new StringBuilder();
		sql.append("select no, title, writer, view_cnt, to_char(reg_date, 'yyyy-mm-dd') as reg_date");
		sql.append(" 	from t_board");
		sql.append(" order by no desc ");

		try (Connection conn = new ConnectionFactory().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());) {
			ResultSet rs = pstmt.executeQuery();

			/*
			 * BoardDAO에서 DB에 있는 정보를 get(불러오고) => 매개변수에 저장 BoardDAO에서 불러온 데이터를 BoardVO 객체에
			 * 저장 => BoardVO형의 배열에 데이터 저장
			 */
			while (rs.next()) {
				/* 데이터 불러오기 */
				int no = rs.getInt("no");
				String title = rs.getString("title");
				String writer = rs.getString("writer");
				int view = rs.getInt("view_cnt");
				String regDate = rs.getString("reg_date");

				/* 데이터 저장 */
				BoardVO board = new BoardVO();
				board.setNo(no);
				board.setTitle(title);
				board.setWriter(writer);
				board.setViewCnt(view);
				board.setRegDate(regDate);

				list.add(board);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	public BoardVO selectObj(int no) {
		StringBuilder sql = new StringBuilder();
		sql.append(" select * from t_board where no = ? ");
		BoardVO board = new BoardVO();

		try (Connection conn = new ConnectionFactory().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());

		) {
			pstmt.setInt(1, no);

			ResultSet rs = pstmt.executeQuery();
			rs.next();

			String title = rs.getString("title");
			String content = rs.getString("content");
			String writer = rs.getString("writer");
			int viewCnt = rs.getInt("view_cnt");
			String regDate = rs.getString("reg_date");

			board.setTitle(title);
			board.setContent(content);
			board.setWriter(writer);
			board.setViewCnt(viewCnt);
			board.setRegDate(regDate);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return board;
	}

	public boolean deleteObj(int no) {
		boolean result = false;
		StringBuilder sql = new StringBuilder();

		try (Connection conn = new ConnectionFactory().getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql.toString());) {
			sql.append(" delete from t_board where no = ? ");
			pstmt.setInt(1, no);

			int row = pstmt.executeUpdate();
			if (row == 1)
				result = true;

		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}

	/* 업데이트랑 상세보기 같이 쓸 메소드 */
	public BoardVO selectByNo(int boardNo) {

		BoardVO board = null;

		StringBuilder sql = new StringBuilder();
		sql.append("select no, title, writer, content, view_cnt ");
		sql.append("	,to_char(reg_date, 'yyyy-mm-dd' ) as reg_date ");
		sql.append(" from t_board ");
		sql.append(" where no = ? ");

		try (
			Connection conn = new ConnectionFactory().getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql.toString());
			){
			pstmt.setInt(1, boardNo);
			ResultSet rs = pstmt.executeQuery();

			if (rs.next()) {
				board = new BoardVO();
				board.setNo(rs.getInt("no"));
				board.setTitle(rs.getString("title"));
				board.setWriter(rs.getString("writer"));
				board.setContent(rs.getString("content"));
				board.setViewCnt(rs.getInt("view_cnt"));
				board.setRegDate(rs.getString("reg_date"));

			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return board;
	}

	/*
	 * public static void main(String[] args) { BoardDAO dao = new BoardDAO();
	 * BoardVO board = dao.selectByno(16); System.out.println(board); }
	 */

	public void update(BoardVO board) {
		StringBuilder sql = new StringBuilder();
		sql.append("update t_board ");
		sql.append("	set title = ?, content = ? ");
		sql.append("	where no = ? ");

		try (Connection conn = new ConnectionFactory().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());) {
			pstmt.setString(1, board.getTitle());
			pstmt.setString(2, board.getContent());
			pstmt.setInt(3, board.getNo());

			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	public void updateViewCnt(int boardNo) {

		StringBuilder sql = new StringBuilder();
		sql.append("update t_board ");
		sql.append(" set view_cnt = view_cnt + 1 ");
		sql.append(" where no = ? ");

		try (Connection conn = new ConnectionFactory().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());) {
			pstmt.setInt(1, boardNo);
			pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	public void delete(int boardNo) {

		StringBuilder sql = new StringBuilder();
		sql.append(" delete from t_board ");
		sql.append(" 	where no = ? ");

		try (Connection conn = new ConnectionFactory().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());) {
			pstmt.setInt(1, boardNo);
			pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	///////////////////////////////////////////////////////////////////
	///// t_board_file 테이블의 CRUD
	///////////////////////////////////////////////////////////////////
	public void insertFile(BoardFileVO fileVO) {

		StringBuilder sql = new StringBuilder();
		sql.append("insert into t_board_file(no, board_no, file_ori_name ");
		sql.append("	, file_save_name, file_size) ");
		sql.append(" values(seq_t_board_file_no.nextval, ?, ?, ?, ?) ");

		try (Connection conn = new ConnectionFactory().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());) {
			int loc = 1;
			pstmt.setInt(loc++, fileVO.getBoardNo());
			pstmt.setString(loc++, fileVO.getFileOriName());
			pstmt.setString(loc++, fileVO.getFileSaveName());
			pstmt.setInt(loc++, fileVO.getFileSize());

			pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public List<BoardFileVO> selectFileByNo(int boardNo) {

		List<BoardFileVO> fileList = new ArrayList<>();

		StringBuilder sql = new StringBuilder();
		sql.append(" select no, file_ori_name, file_save_name, file_size ");
		sql.append("	from t_board_file ");
		sql.append("	where board_no = ? ");

		try (Connection conn = new ConnectionFactory().getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql.toString());) {
			pstmt.setInt(1, boardNo);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				BoardFileVO fileVO = new BoardFileVO();
				fileVO.setNo(rs.getInt("no"));
				fileVO.setFileOriName(rs.getString("file_ori_name"));
				fileVO.setFileSaveName(rs.getString("file_save_name"));
				fileVO.setFileSize(rs.getInt("file_size"));

				fileList.add(fileVO);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return fileList;
	}

	
	  public static void main(String[] args) { 
		  BoardDAO dao = new BoardDAO();
		  List<BoardVO> list = dao.selectAll();
		  
		  for (BoardVO vo : list) {
			  System.out.println(vo); 
			  }
		  }
	 

	/*
	 * 조회수를 DB에서 가져와보자! 각 게시물의 조회수를 불러와야하니까 list를 사용하자 BoardNo와 viewCnt가 필요하다
	 * BoardVO 생성 list를 어떻게 쓸거냐
	 */
	/*
	 * public List<BoardVO> loadViewCnt() {
	 * 
	 * List<BoardVO> list = new ArrayList<>(); StringBuilder sql = new
	 * StringBuilder(); sql.append(" select no, viewCnt from t_board ");
	 * 
	 * try ( Connection conn = new ConnectionFactory().getConnection();
	 * PreparedStatement pstmt = conn.prepareStatement(sql.toString()); ){ ResultSet
	 * rs = pstmt.executeQuery(); while(rs.next()) { BoardVO board = new BoardVO();
	 * board.setNo(rs.getInt("no")); board.setViewCnt(rs.getInt("viewCnt"));
	 * 
	 * list.add(board); } } catch (Exception e) { e.printStackTrace(); }
	 * 
	 * return list; }
	 */

}
