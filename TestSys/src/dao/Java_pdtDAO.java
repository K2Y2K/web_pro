package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import entity.Java_pdt;
import util.DBHelper;

public class Java_pdtDAO implements Java_stDAO {
	// 判断返回判题题集
	@Override
	public ArrayList<Object> getAllJava_st() {
		// TODO Auto-generated method stub
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		// 返回Object对象，再转换成Java_pdt对象，存储判断题集合
		ArrayList<Object> list = new ArrayList<Object>();
		try {
			conn = DBHelper.getConnection();
			// 通过java_pdt_id号降序输出 数据库java_pdt表查询结果的SQL语句
			String sql = "select * from Java_pdt order by Java_pdt_id desc;";
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery();
			while (rs.next()) {
				Java_pdt j_dxt = new Java_pdt();
				j_dxt.setJava_pdt_id(rs.getInt("Java_pdt_id"));
				j_dxt.setJava_pdt_question(rs.getString("Java_pdt_question"));
				j_dxt.setJava_pdt_result(rs.getInt("Java_pdt_result"));
				list.add(j_dxt);// 把一个判断题加入集合
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

	// 根据判断题号返回判断题的详细信息
	@Override
	public Object getJava_stById(int java_pdt_id) {
		// TODO Auto-generated method stub
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		try {
			conn = DBHelper.getConnection();
			String sql = "select * from java_pdt where java_pdt_id=?;"; // SQL语句
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, java_pdt_id);
			rs = stmt.executeQuery();
			if (rs.next()) {
				Java_pdt j_dxt = new Java_pdt();
				j_dxt.setJava_pdt_id(rs.getInt("Java_pdt_id"));
				j_dxt.setJava_pdt_question(rs.getString("Java_pdt_question"));

				j_dxt.setJava_pdt_result(rs.getInt("Java_pdt_result"));
				return j_dxt;
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
	public int getJava_st_idByJava_st(Object j_dxt) {
		// TODO Auto-generated method stub
		return 0;
	}

	// 插入判断题，插入成功返回true，失败为false
	@Override
	public boolean addJava_st(Object j_dxt) {
		// TODO Auto-generated method stub
		Connection conn = null;
		PreparedStatement stmt = null;
		Java_pdt j_pdt = (Java_pdt) j_dxt;
		int count;
		try {
			conn = DBHelper.getConnection();
			String sql = "insert into java_pdt(java_pdt_question,java_pdt_result) values(?,?);";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, j_pdt.getJava_pdt_question());
			stmt.setInt(2, j_pdt.getJava_pdt_result());
			count = stmt.executeUpdate();
			System.out.println("插入判断题记录条数:" + count);
			if (count == 1) {
				System.out.println("插入判断题记录成功");
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

	// 修改判断题，修改成功返回true，修改失败返回false
	@Override
	public boolean updateJava_st(Object j_dxt) {
		// TODO Auto-generated method stub
		Connection conn = null;
		PreparedStatement stmt = null;
		Java_pdt j_pdt = (Java_pdt) j_dxt;
		int count;
		try {
			conn = DBHelper.getConnection();
			String sql = "update java_pdt set java_pdt_question=?,java_pdt_result=? where java_pdt_id=?;";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, j_pdt.getJava_pdt_question());
			stmt.setInt(2, j_pdt.getJava_pdt_result());
			stmt.setInt(3, j_pdt.getJava_pdt_id());
			count = stmt.executeUpdate();
			System.out.println("修改判断题记录条数:" + count);
			if (count == 1) {
				System.out.println("修改判断题记录成功");
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

	// 删除判断题
	@Override
	public boolean deleteJava_st(int java_pdt_id) {
		// TODO Auto-generated method stub
		Connection conn = null;
		PreparedStatement stmt = null;
		int count;
		try {
			conn = DBHelper.getConnection();
			String sql = "delete from java_pdt where java_pdt_id=?;";
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, java_pdt_id);
			count = stmt.executeUpdate();
			System.out.println("删除判断题记录条数:" + count);
			if (count == 1) {
				System.out.println("删除判断题记录成功");
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

	// 获取最近添加的判断题
	public ArrayList<Java_pdt> getViewList(String list) {
		System.out.println("pdtlist:" + list);
		ArrayList<Java_pdt> stlist = new ArrayList<Java_pdt>();
		if (list != null && list.length() > 0) {
			String[] arr = list.split("#");
			System.out.println("arr.length=" + arr.length);
			for (int i = arr.length - 1; i >= 0; i--) {
				if (arr[i] != null && getJava_stById(Integer.parseInt(arr[i])) != null) {
					stlist.add((Java_pdt) getJava_stById(Integer.parseInt(arr[i])));
					System.out.println("成功获取最近添加的判断题java_pdt_id号:"+arr[i]);
				}System.out.println("成功输出本次获取最近添加的判断题记录集合stlist:"+stlist);
			}
			return stlist;
			
		} else {
			return null;
		}
	}
}
