package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import entity.Stu_grade;
import util.DBHelper;

public class Stu_gradeDAOImp implements Stu_gradeDAO {

	@Override
	public ArrayList<Object> getAllStu_grade() {
		// TODO Auto-generated method stub
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		ArrayList<Object> list = new ArrayList<Object>(); //考卷集合
		try {
			conn = DBHelper.getConnection();
			String sql = "select * from stu_grade order by stu_g_id desc;"; // SQL语句
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery();
			while (rs.next()) {
				Stu_grade stu_r = new Stu_grade();
				stu_r.setStu_g_id(rs.getInt("stu_g_id"));
				stu_r.setSid(rs.getInt("sid"));
				stu_r.setKj_id(rs.getInt("kj_id"));
				stu_r.setStu_dxt_g(rs.getInt("stu_dxt_g"));
				stu_r.setStu_dxts_g(rs.getInt("stu_dxts_g"));
				stu_r.setStu_pdt_g(rs.getInt("stu_pdt_g"));
				stu_r.setStu_total_g(rs.getInt("stu_total_g"));												
				list.add(stu_r);// 把一个学生成绩加入集合
			}
			return list; // 返回集合。
		} catch (Exception ex) {
			ex.printStackTrace();
			return null;
		} finally {
			// 释放数据集对象
			if (rs != null) {
				try {
					rs.close();
					rs = null;
				} catch (Exception ex) {
					ex.printStackTrace();
				}
			}
			// 释放语句对象
			if (stmt != null) {
				try {
					stmt.close();
					stmt = null;
				} catch (Exception ex) {
					ex.printStackTrace();
				}
			}
		}
	}

	@Override
	public Object getStu_gradeById(int stu_g_id) {
		// TODO Auto-generated method stub
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		try {
			conn = DBHelper.getConnection();
			String sql = "select * from stu_grade where stu_g_id=?;"; // SQL语句
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, stu_g_id);
			rs = stmt.executeQuery();
			if (rs.next()) {
				Stu_grade stu_r = new Stu_grade();
				stu_r.setStu_g_id(rs.getInt("stu_g_id"));
				stu_r.setSid(rs.getInt("sid"));
				stu_r.setKj_id(rs.getInt("kj_id"));
				stu_r.setStu_dxt_g(rs.getInt("stu_dxt_g"));
				stu_r.setStu_dxts_g(rs.getInt("stu_dxts_g"));
				stu_r.setStu_pdt_g(rs.getInt("stu_pdt_g"));
				stu_r.setStu_total_g(rs.getInt("stu_total_g"));			
				return stu_r;
			} else {
				return null;
			}

		} catch (Exception ex) {
			ex.printStackTrace();
			return null;
		} finally {
			// 释放数据集对象
			if (rs != null) {
				try {
					rs.close();
					rs = null;
				} catch (Exception ex) {
					ex.printStackTrace();
				}
			}
			// 释放语句对象
			if (stmt != null) {
				try {
					stmt.close();
					stmt = null;
				} catch (Exception ex) {
					ex.printStackTrace();
				}
			}

		}
	}
	public ArrayList<Object> getStu_gradeBySid(int sid) {
		// TODO Auto-generated method stub
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		ArrayList<Object> list = new ArrayList<Object>(); 
		try {
			conn = DBHelper.getConnection();
			String sql = "select * from stu_grade where sid=?;"; // SQL语句
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, sid);
			rs = stmt.executeQuery();
			while (rs.next()) {
				Stu_grade stu_r = new Stu_grade();
				stu_r.setStu_g_id(rs.getInt("stu_g_id"));
				stu_r.setSid(rs.getInt("sid"));
				stu_r.setKj_id(rs.getInt("kj_id"));
				stu_r.setStu_dxt_g(rs.getInt("stu_dxt_g"));
				stu_r.setStu_dxts_g(rs.getInt("stu_dxts_g"));
				stu_r.setStu_pdt_g(rs.getInt("stu_pdt_g"));
				stu_r.setStu_total_g(rs.getInt("stu_total_g"));			
				list.add(stu_r);
			} return list;	

		} catch (Exception ex) {
			ex.printStackTrace();
			return null;
		} finally {
			// 释放数据集对象
			if (rs != null) {
				try {
					rs.close();
					rs = null;
				} catch (Exception ex) {
					ex.printStackTrace();
				}
			}
			// 释放语句对象
			if (stmt != null) {
				try {
					stmt.close();
					stmt = null;
				} catch (Exception ex) {
					ex.printStackTrace();
				}
			}

		}
	}

	@Override
	public boolean addStu_grade(Object stu_grade) {
		// TODO Auto-generated method stub
		Connection conn = null;
		PreparedStatement stmt = null;		
		Stu_grade Stu_result1 =(Stu_grade)stu_grade;
		int count;
		try {
			conn = DBHelper.getConnection();
			String sql = "insert into Stu_grade(sid,kj_id,Stu_dxt_g,Stu_dxts_g,Stu_pdt_g,Stu_total_g) values(?,?,?,?,?,?);"; // SQL语句
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, Stu_result1.getSid());		
			stmt.setInt(2, Stu_result1.getKj_id());
			stmt.setInt(3, Stu_result1.getStu_dxt_g());
			stmt.setInt(4, Stu_result1.getStu_dxts_g());
			stmt.setInt(5, Stu_result1.getStu_pdt_g());
			stmt.setInt(6, Stu_result1.getStu_total_g());						
			count=stmt.executeUpdate();
			System.out.println(count+"插入学生成绩记录");
			if (count==1) {
				return true;
			} else
				return false; 
		} catch (Exception ex) {
			ex.printStackTrace();
			return false;
		} finally {					
			// 释放语句对象
			if (stmt != null) {
				try {
					stmt.close();
					stmt = null;
				} catch (Exception ex) {
					ex.printStackTrace();
				}
			}
		}
	}

	@Override
	public boolean updateStu_grade(Object stu_grade) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean deleteStu_grade(int stu_g_id) {
		// TODO Auto-generated method stub
		return false;
	}

}
