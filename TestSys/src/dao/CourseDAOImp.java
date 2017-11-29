package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import entity.Course;
import util.DBHelper;

public class CourseDAOImp implements CourseDAO {

	@Override
	public ArrayList<Object> getAllCourse() {
		// TODO Auto-generated method stub
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		ArrayList<Object> list = new ArrayList<Object>(); //科目集合
		try {
			conn = DBHelper.getConnection();
			String sql = "select * from course order by c_id desc;"; // SQL语句
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery();
			while (rs.next()) {
				Course c= new Course();
				c.setC_id(rs.getInt("c_id"));
				c.setC_name(rs.getString("c_name"));			
				list.add(c);// 把一个科目加入集合
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
	public Object getCourseById(int c_id) {
		// TODO Auto-generated method stub
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		try {
			conn = DBHelper.getConnection();
			String sql = "select * from course where c_id=?;"; // SQL语句
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, c_id);
			rs = stmt.executeQuery();
			if (rs.next()) {
				Course c= new Course();
				c.setC_id(rs.getInt("c_id"));
				c.setC_name(rs.getString("c_name"));
				return c;
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
	public boolean addCourse(Object kj) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean updateCourse(Object kj) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean deleteCourse(int kj_id) {
		// TODO Auto-generated method stub
		return false;
	}

}
