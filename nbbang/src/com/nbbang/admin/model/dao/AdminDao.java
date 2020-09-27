package com.nbbang.admin.model.dao;

import static com.nbbang.common.temp.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.nbbang.admin.model.vo.AdminBoard;
import com.nbbang.admin.model.vo.AdminMem;
import com.nbbang.customer.model.vo.CustomerCenter;
import com.nbbang.member.model.vo.Member;

public class AdminDao {

	private Properties prop = new Properties();

	public AdminDao() {
		// TODO Auto-generated constructor stub
		String path = AdminDao.class.getResource("/sql/admin/admin.properties").getPath();
		try {
			prop.load(new FileReader(path));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public List<CustomerCenter> customerList(Connection conn, int cPage, int numPerPage, String a) {
		// TODO Auto-generated method stub
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		List<CustomerCenter> list = new ArrayList<CustomerCenter>();
		String sql = prop.getProperty("customerList");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, a);
			pstmt.setInt(2, (cPage - 1) * numPerPage + 1);
			pstmt.setInt(3, cPage * numPerPage);
			rs = pstmt.executeQuery();
			print(list, rs);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return list;
	}

	public int customerListCount(Connection conn, String a) {
		// TODO Auto-generated method stub
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int cnt = 0;
		String sql = prop.getProperty("customerListCount");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, a);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				cnt = rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return cnt;
	}

	private void print(List<CustomerCenter> list, ResultSet rs) {
		try {
			while (rs.next()) {
				CustomerCenter c = new CustomerCenter();
				c.setCsId(rs.getInt("CS_ID"));
				c.setCsWriterUsid(rs.getInt("CS_WRITER_USID"));
				c.setCsType(rs.getString("CS_TYPE"));
				c.setCsTitle(rs.getString("CS_TITLE"));
				c.setCsContent(rs.getString("CS_CONTENT"));
				c.setCsDate(rs.getDate("CS_DATE"));
				c.setCsIscheck(rs.getBoolean("CS_ISCHECK"));
				c.setCsNickname(rs.getString("CS_NICKNAME"));
				list.add(c);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public List<CustomerCenter> customerList(Connection conn, int cPage, int numPerPage, String a, String select,
			String search) {
		// TODO Auto-generated method stub
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		List<CustomerCenter> list = new ArrayList<CustomerCenter>();
		String sql = prop.getProperty("customerListSearch").replace("$s", select);
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%" + search + "%");
			pstmt.setString(2, a);
			pstmt.setInt(3, (cPage - 1) * numPerPage + 1);
			pstmt.setInt(4, cPage * numPerPage);
			rs = pstmt.executeQuery();
			print(list, rs);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return list;
	}

	public int customerListCount(Connection conn, String a, String select, String search) {
		// TODO Auto-generated method stub
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int cnt = 0;
		String sql = prop.getProperty("customerListSearchCount").replace("$s", select);
		System.out.println("sql" + sql);
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%" + search + "%");
			pstmt.setString(2, a);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				cnt = rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return cnt;
	}

	public List<CustomerCenter> customerList(Connection conn, int cPage, int numPerPage, String a, String search) {
		// TODO Auto-generated method stub
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		List<CustomerCenter> list = new ArrayList<CustomerCenter>();
		String sql = prop.getProperty("customerListAllSearch");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%" + search + "%");
			pstmt.setString(2, "%" + search + "%");
			pstmt.setString(3, "%" + search + "%");
			pstmt.setString(4, a);
			pstmt.setInt(5, (cPage - 1) * numPerPage + 1);
			pstmt.setInt(6, cPage * numPerPage);
			rs = pstmt.executeQuery();
			print(list, rs);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return list;
	}

	public int customerListCount(Connection conn, String a, String search) {
		// TODO Auto-generated method stub
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int cnt = 0;
		String sql = prop.getProperty("customerListAllSearchCount");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%" + search + "%");
			pstmt.setString(2, "%" + search + "%");
			pstmt.setString(3, "%" + search + "%");
			pstmt.setString(4, a);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				cnt = rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return cnt;
	}

	public List<AdminMem> memberInfoList(Connection conn, int cPage, int numPerPage) {
		// TODO Auto-generated method stub
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		List<AdminMem> list = new ArrayList<AdminMem>();
		AdminMem am = null;
		String sql = prop.getProperty("memberInfoList");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, (cPage - 1) * numPerPage + 1);
			pstmt.setInt(2, cPage * numPerPage);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				am = new AdminMem();
				am.setMem(new Member());
				Member m = am.getMem();
				m.setUsid(rs.getInt("USID"));
				m.setMemberName(rs.getString("MEMBER_NAME"));
				m.setNickname(rs.getString("NICKNAME"));
				m.setMemberId(rs.getString("MEMBER_ID"));
				m.setGender(rs.getString("GENDER"));
				m.setBirthday(rs.getDate("BIRTHDAY"));
				m.setEnrollDate(rs.getDate("ENROLL_DATE"));
				m.setPoint(rs.getInt("POINT"));
				m.setLeaveMem(rs.getBoolean("LEAVE_MEM"));
				m.setNbbangScore(rs.getInt("NBBANG_SCORE"));
				am.setCreateBoardCount(rs.getInt("CREATE_BOARD_COUNT"));
				am.setGradeLevel(rs.getInt("GRADE_LEVEL"));
				am.setReportCount(rs.getInt("REPORT_COUNT"));
				list.add(am);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return list;
	}

	public int memberInfoListCount(Connection conn) {
		// TODO Auto-generated method stub
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int cnt = 0;
		String sql = prop.getProperty("memberInfoListCount");
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				cnt = rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return cnt;
	}

	public List<AdminMem> memberInfoSearchList(Connection conn, int cPage, int numPerPage, String ra, String select,
			String search) {
		// TODO Auto-generated method stub
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		List<AdminMem> list = new ArrayList<AdminMem>();
		AdminMem am = null;
		String sql = prop.getProperty("memberInfoSearchList");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, (cPage - 1) * numPerPage + 1);
			pstmt.setInt(2, cPage * numPerPage);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				am = new AdminMem();
				am.setMem(new Member());
				Member m = am.getMem();
				m.setUsid(rs.getInt("USID"));
				m.setMemberName(rs.getString("MEMBER_NAME"));
				m.setNickname(rs.getString("NICKNAME"));
				m.setMemberId(rs.getString("MEMBER_ID"));
				m.setGender(rs.getString("GENDER"));
				m.setBirthday(rs.getDate("BIRTHDAY"));
				m.setEnrollDate(rs.getDate("ENROLL_DATE"));
				m.setPoint(rs.getInt("POINT"));
				m.setLeaveMem(rs.getBoolean("LEAVE_MEM"));
				m.setNbbangScore(rs.getInt("NBBANG_SCORE"));
				am.setCreateBoardCount(rs.getInt("CREATE_BOARD_COUNT"));
				am.setGradeLevel(rs.getInt("GRADE_LEVEL"));
				am.setReportCount(rs.getInt("REPORT_COUNT"));
				list.add(am);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return list;
	}

	public List<AdminMem> memberInfoSearchList(Connection conn, int cPage, int numPerPage, String ra, String select,
			String search, String c) {
		// TODO Auto-generated method stub
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		List<AdminMem> list = new ArrayList<AdminMem>();
		AdminMem am = null;
		
		if(select.equals("n")) {
			select="MEMBER_NAME";
		}else if(select.equals("N")) {
			select="NICKNAME";
		}else {
			select="MEMBER_ID";
		}
		
		String sql = prop.getProperty("memberInfoSearchList").replace("$s", select);
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%" + search + "%");
			pstmt.setString(2, ra);
			if (c == null) {
				pstmt.setInt(3, 0);
			} else {
				pstmt.setInt(3, 1);
			}
			pstmt.setInt(4, (cPage - 1) * numPerPage + 1);
			pstmt.setInt(5, cPage * numPerPage);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				am = new AdminMem();
				am.setMem(new Member());
				Member m = am.getMem();
				m.setUsid(rs.getInt("USID"));
				m.setMemberName(rs.getString("MEMBER_NAME"));
				m.setNickname(rs.getString("NICKNAME"));
				m.setMemberId(rs.getString("MEMBER_ID"));
				m.setGender(rs.getString("GENDER"));
				m.setBirthday(rs.getDate("BIRTHDAY"));
				m.setEnrollDate(rs.getDate("ENROLL_DATE"));
				m.setPoint(rs.getInt("POINT"));
				m.setLeaveMem(rs.getBoolean("LEAVE_MEM"));
				m.setNbbangScore(rs.getInt("NBBANG_SCORE"));
				am.setCreateBoardCount(rs.getInt("CREATE_BOARD_COUNT"));
				am.setGradeLevel(rs.getInt("GRADE_LEVEL"));
				am.setReportCount(rs.getInt("REPORT_COUNT"));
				list.add(am);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return list;
	}

	public int memberInfoSearchListCount(Connection conn, String ra, String select, String search, String c) {
		// TODO Auto-generated method stub
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int cnt = 0;
		
		if(select.equals("n")) {
			select="MEMBER_NAME";
		}else if(select.equals("N")) {
			select="NICKNAME";
		}else {
			select="MEMBER_ID";
		}
		
		String sql = prop.getProperty("memberInfoSearchListCount").replace("$s", select);
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%" + search + "%");
			pstmt.setString(2, ra);
			if (c == null) {
				pstmt.setInt(3, 0);
			} else {
				pstmt.setInt(3, 1);
			}
			rs = pstmt.executeQuery();
			if (rs.next()) {
				cnt = rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return cnt;
	}

	public List<AdminMem> memberInfoAllSearchList(Connection conn, int cPage, int numPerPage, String ra, String select,
			String search, String c) {
		// TODO Auto-generated method stub
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		List<AdminMem> list = new ArrayList<AdminMem>();
		AdminMem am = null;
		String sql = prop.getProperty("memberInfoSearchListSearchAllChecked");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%" + search + "%");
			pstmt.setString(2, "%" + search + "%");
			pstmt.setString(3, "%" + search + "%");
			pstmt.setString(4, ra);
			if (c == null) {
				pstmt.setInt(5, 0);
			} else {
				pstmt.setInt(5, 1);
			}
			pstmt.setInt(6, (cPage - 1) * numPerPage + 1);
			pstmt.setInt(7, cPage * numPerPage);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				am = new AdminMem();
				am.setMem(new Member());
				Member m = am.getMem();
				m.setUsid(rs.getInt("USID"));
				m.setMemberName(rs.getString("MEMBER_NAME"));
				m.setNickname(rs.getString("NICKNAME"));
				m.setMemberId(rs.getString("MEMBER_ID"));
				m.setGender(rs.getString("GENDER"));
				m.setBirthday(rs.getDate("BIRTHDAY"));
				m.setEnrollDate(rs.getDate("ENROLL_DATE"));
				m.setPoint(rs.getInt("POINT"));
				m.setLeaveMem(rs.getBoolean("LEAVE_MEM"));
				m.setNbbangScore(rs.getInt("NBBANG_SCORE"));
				am.setCreateBoardCount(rs.getInt("CREATE_BOARD_COUNT"));
				am.setGradeLevel(rs.getInt("GRADE_LEVEL"));
				am.setReportCount(rs.getInt("REPORT_COUNT"));
				list.add(am);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return list;
	}

	public int memberInfoAllSearchListCount(Connection conn, String ra, String select, String search, String c) {
		// TODO Auto-generated method stub
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int cnt = 0;
		String sql = prop.getProperty("memberInfoSearchListSearchAllCheckedCount");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%" + search + "%");
			pstmt.setString(2, "%" + search + "%");
			pstmt.setString(3, "%" + search + "%");
			pstmt.setString(4, ra);
			if (c == null) {
				pstmt.setInt(5, 0);
			} else {
				pstmt.setInt(5, 1);
			}
			rs = pstmt.executeQuery();
			if (rs.next()) {
				cnt = rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return cnt;
	}

	public List<AdminBoard> boardInfoList(Connection conn, int cPage, int numPerPage) {
		// TODO Auto-generated method stub
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		List<AdminBoard> list = new ArrayList<AdminBoard>();
		AdminMem am = null;
		String sql = prop.getProperty("memberInfoList");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, (cPage - 1) * numPerPage + 1);
			pstmt.setInt(2, cPage * numPerPage);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				am = new AdminMem();
				am.setMem(new Member());
				Member m = am.getMem();
				m.setUsid(rs.getInt("USID"));
				m.setMemberName(rs.getString("MEMBER_NAME"));
				m.setNickname(rs.getString("NICKNAME"));
				m.setMemberId(rs.getString("MEMBER_ID"));
				m.setGender(rs.getString("GENDER"));
				m.setBirthday(rs.getDate("BIRTHDAY"));
				m.setEnrollDate(rs.getDate("ENROLL_DATE"));
				m.setPoint(rs.getInt("POINT"));
				m.setLeaveMem(rs.getBoolean("LEAVE_MEM"));
				m.setNbbangScore(rs.getInt("NBBANG_SCORE"));
				am.setCreateBoardCount(rs.getInt("CREATE_BOARD_COUNT"));
				am.setGradeLevel(rs.getInt("GRADE_LEVEL"));
				am.setReportCount(rs.getInt("REPORT_COUNT"));
				list.add(am);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return list;
	}

}
