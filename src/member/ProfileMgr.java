package member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class ProfileMgr {
	
	private DBConnectionMgr pool;
	private static final String UPLOAD = "C:/Jsp/UserChat/WebContent/member/data/";
	private static final String ENCTYPE = "EUC-KR";
	private static final int MAXSIZE = 10*1024*1024;

	public ProfileMgr() {
		pool=DBConnectionMgr.getInstance();
	}
	
	public boolean insertProfile(HttpServletRequest req) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		boolean flag = false;
		try {
			MultipartRequest multi = new MultipartRequest(req, UPLOAD, MAXSIZE,
					ENCTYPE, new DefaultFileRenamePolicy());
			con = pool.getConnection();
			sql = "insert profile(userID, userProfile, userMessage) values(?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, multi.getParameter("userID"));
			
			if(multi.getFilesystemName("userProfile")!=null)
				pstmt.setString(2, multi.getFilesystemName("userProfile"));
			else
				pstmt.setString(2, "icon.png");
			
			pstmt.setString(3, multi.getParameter("userMessage"));
			int cnt = pstmt.executeUpdate();
			if(cnt==1) flag = true;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
		return flag;
	}
	
	public Vector<ProfileBean> getProfileList(){
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		Vector<ProfileBean> vlist = new Vector<ProfileBean>();
		try {
			con = pool.getConnection();
			sql = "select userID,userProfile, userMessage from profile order by userID desc";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				ProfileBean bean = new ProfileBean();
				bean.setUserID(rs.getString(1));
				bean.setUserProfile(rs.getString(2));
				bean.setUserMessage(rs.getString(3));
				vlist.addElement(bean);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return vlist;
	}
	
	public ProfileBean getProfile(String userID) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		ProfileBean bean = new ProfileBean();
		try {
			con = pool.getConnection();
			sql = "select userID, userProfile, userMessage from profile where userID=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				bean.setUserID(rs.getString(1));
				bean.setUserProfile(rs.getString(2));
				bean.setUserMessage(rs.getString(3));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return bean;
	}
	
	

}
