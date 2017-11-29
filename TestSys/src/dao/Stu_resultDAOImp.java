package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import entity.Stu_result;
import util.DBHelper;

public class Stu_resultDAOImp implements Stu_resultDAO {

	@Override
	public ArrayList<Object> getAllStu_result() {
		// TODO Auto-generated method stub
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		ArrayList<Object> list = new ArrayList<Object>(); // 考卷集合
		try {
			conn = DBHelper.getConnection();
			String sql = "select * from stu_result order by stu_r_id desc;"; // SQL语句
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery();
			while (rs.next()) {
				Stu_result stu_r = new Stu_result();
				stu_r.setStu_r_id(rs.getInt("stu_r_id"));
				stu_r.setSid(rs.getInt("sid"));
				stu_r.setKj_id(rs.getInt("kj_id"));
				stu_r.setStu_dxt_r(rs.getString("stu_dxt_r"));
				stu_r.setStu_dxt_c(rs.getString("stu_dxt_c"));
				stu_r.setStu_dxts_r(rs.getString("stu_dxts_r"));
				stu_r.setStu_dxts_c(rs.getString("stu_dxts_c"));
				stu_r.setStu_pdt_r(rs.getString("stu_pdt_r"));
				stu_r.setStu_pdt_c(rs.getString("stu_pdt_c"));
				list.add(stu_r);// 把一个考试试卷加入集合
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
	public Object getStu_resultById(int stu_r_id) {
		// TODO Auto-generated method stub
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		try {
			conn = DBHelper.getConnection();
			String sql = "select * from stu_result where stu_r_id=?;"; // SQL语句
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, stu_r_id);
			rs = stmt.executeQuery();
			if (rs.next()) {
				Stu_result stu_r = new Stu_result();
				stu_r.setStu_r_id(rs.getInt("stu_r_id"));
				stu_r.setSid(rs.getInt("sid"));
				stu_r.setKj_id(rs.getInt("kj_id"));
				stu_r.setStu_dxt_r(rs.getString("stu_dxt_r"));
				stu_r.setStu_dxt_c(rs.getString("stu_dxt_c"));
				stu_r.setStu_dxts_r(rs.getString("stu_dxts_r"));
				stu_r.setStu_dxts_c(rs.getString("stu_dxts_c"));
				stu_r.setStu_pdt_r(rs.getString("stu_pdt_r"));
				stu_r.setStu_pdt_c(rs.getString("stu_pdt_c"));
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

	@Override
	public boolean addStu_result(Object stu_result) {
		// TODO Auto-generated method stub
		Connection conn = null;
		PreparedStatement stmt = null;
		Stu_result Stu_result1 = (Stu_result) stu_result;
		int count;
		try {
			conn = DBHelper.getConnection();
			String sql = "insert into Stu_result(sid,kj_id,Stu_dxt_r,Stu_dxt_c,Stu_dxts_r,Stu_dxts_c,Stu_pdt_r,Stu_pdt_c) values(?,?,?,?,?,?,?,?);"; // SQL语句
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, Stu_result1.getSid());
			stmt.setInt(2, Stu_result1.getKj_id());
			stmt.setString(3, Stu_result1.getStu_dxt_r());
			stmt.setString(4, Stu_result1.getStu_dxt_c());
			stmt.setString(5, Stu_result1.getStu_dxts_r());
			stmt.setString(6, Stu_result1.getStu_dxts_c());
			stmt.setString(7, Stu_result1.getStu_pdt_r());
			stmt.setString(8, Stu_result1.getStu_pdt_c());
			count = stmt.executeUpdate();
			System.out.println(count + "学生答案插入记录");
			if (count == 1) {
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
	public boolean updateStu_result(Object stu_result) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean deleteStu_result(int stu_r_id) {
		// TODO Auto-generated method stub
		return false;
	}

}
