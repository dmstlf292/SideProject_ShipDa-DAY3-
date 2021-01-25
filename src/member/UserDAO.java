package member;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDAO {
	
	private DBConnectionMgr pool;
	
	public UserDAO() {
		pool = DBConnectionMgr.getInstance();
	}
	public int login(String userID, String userPassword) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		try {
			con = pool.getConnection();
			sql = "select*from user where userID=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				if(rs.getString("userPassword").equals(userPassword)) {
					return 1;//로그인 성공
				}
				return 2;//비밀번호 틀림
			}else {
				return 0;//해당 사용자가 존재하지 않음
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return -1;//데이터 베이스 오류
	}
	
	public int registerCheck(String userID) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		try {
			con = pool.getConnection();
			sql = "select*from user where userID=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			if(rs.next() || userID.equals("")) {
				return 0;//이미 존재하는 회원
			}else {
				return 1;//가입 가능한 아이디
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return -1; //디비 오류
	
		
	}

	
	public UserDTO getUser(String userID) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		UserDTO user = new UserDTO();
		try {
			con = pool.getConnection();
			sql = "select*from user where userID=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			if(rs.next()){
				user.setUserID(userID);
				user.setUserPassword(rs.getString("userPassword"));
				user.setUserName(rs.getString("userName"));
				user.setUserAge(rs.getInt("userAge"));
				user.setUserGender(rs.getString("userGender"));
				user.setUserEmail(rs.getString("userEmail"));
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return user; //user반환
	}
	
	
	
	
	public int register(String userID, String userPassword, String userName, String userAge, String userGender, String userEmail) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		
		try {
			con = pool.getConnection();
			sql = "insert into user values(?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1,userID);
			pstmt.setString(2,userPassword);
			pstmt.setString(3,userName);
			pstmt.setInt(4,Integer.parseInt(userAge));
			pstmt.setString(5,userGender);
			pstmt.setString(6,userEmail);
			return pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return -1;
	
	
	}

	
	public int update(String userID, String userPassword, String userName, String userAge, String userGender, String userEmail) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		try {
			con = pool.getConnection();
			sql = "update user set userPassword=?, userName=?, userAge=?, userGender=?, userEmail=? where userID=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1,userPassword);
			pstmt.setString(2,userName);
			pstmt.setInt(3,Integer.parseInt(userAge));
			pstmt.setString(4,userGender);
			pstmt.setString(5,userEmail);
			pstmt.setString(6,userID);
			return pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return -1;
	}

	
	
	
	public void post10(){
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			con = pool.getConnection();
			sql = "insert into user values('아이디','1234','이름',0,'f','aaa@aaa.com')";
			pstmt = con.prepareStatement(sql);
			for (int i = 0; i < 10; i++) {
				pstmt.executeUpdate();
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
	}
	
	
	public static void main(String[] args) {
		UserDAO userDAO = new UserDAO();
		userDAO.post10();
	}
	
	
}











