package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import entity.Students;
import entity.Teachers;
import util.DBHelper;

//学生的业务逻辑
public class StudentsDAO {

	// 获得所有的学生信息
	public ArrayList<Students> getAllStudents() {
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		ArrayList<Students> list = new ArrayList<Students>(); // 商品集合
		try {
			conn = DBHelper.getConnection();
			String sql = "select * from Students;"; // SQL语句
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery();
			while (rs.next()) {
				Students item = new Students();
				item.setSid(rs.getInt("sid"));
				item.setName(rs.getString("name"));
				item.setPassword(rs.getString("password"));
				item.setBanji(rs.getString("banji"));
				item.setAcademy(rs.getString("academy"));
				list.add(item);// 把一个商品加入集合
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

	// 根据学生编号获得学生详细资料
	public Students getStudentsById(int id) {
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		try {
			conn = DBHelper.getConnection();
			String sql = "select * from Students where sid=?;"; // SQL语句
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, id);
			rs = stmt.executeQuery();
			if (rs.next()) {
				Students item = new Students();
				item.setSid(rs.getInt("sid"));
				item.setName(rs.getString("name"));
				item.setPassword(rs.getString("password"));
				item.setBanji(rs.getString("banji"));
				item.setAcademy(rs.getString("academy"));
				return item;
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

	// 根据学生用户名和密码获得学生详细资料
			public Students getIdByStudents(Students stu) {
				Connection conn = null;
				PreparedStatement stmt = null;
				ResultSet rs = null;
				Students item =null;
				try {
					conn = DBHelper.getConnection();
					String sql = "select * from Students where name=? and password=?;"; // SQL语句
					stmt = conn.prepareStatement(sql);
					stmt.setString(1, stu.getName());
					stmt.setString(2, stu.getPassword());
					System.out.println("学生账号信息" + stmt);
					rs = stmt.executeQuery();
					System.out.println("学生账号信息查询结果" + rs);
					while (rs.next()) {
						System.out.println("学生账号信息rs 不为空");	
						 item = new Students();
						item.setSid(rs.getInt("sid"));
						item.setName(rs.getString("name"));
						item.setPassword(rs.getString("password"));

						item.setAcademy(rs.getString("academy"));
						
					} 
					if(item != null){
						System.out.println("返回学生账号信息" );
						return item;
					}
					else {
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
	// 学生激活方法/密码修改
	public boolean usersActivate(Students stu) {
		Connection conn = null;
		PreparedStatement stmt = null;	
		int count;
		try {
			conn = DBHelper.getConnection();
			String sql = "update  Students set password =? where sid=? and name=?;";
			stmt = conn.prepareStatement(sql);
			System.out.println("学生激活的密码账号信息" + stmt);
			stmt.setString(1, stu.getPassword());
			stmt.setInt(2, stu.getSid());
			stmt.setString(3, stu.getName());
			System.out.println("学生激活的密码账号信息2" + stmt);
			count=stmt.executeUpdate();
			System.out.println("学生激活的密码账号信息记录" + count);
			if (count== 1) {
				System.out.println("学生账号激活或修改成功" );
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

	// 学生登录账号
	public boolean usersLogin(Students stu) {
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		Students stu1 = null;
		try {
			conn = DBHelper.getConnection();
			String sql = "select * from Students  where name=? and password=?;"; // SQL语句
			stmt = conn.prepareStatement(sql);
			System.out.println("0000000000000学生" + stmt);
			stmt.setString(1, stu.getName());
			stmt.setString(2, stu.getPassword());
			System.out.println("0000000000000学生" + stmt);
			rs = stmt.executeQuery();
			System.out.println("0000000000000学生" + rs);
			while (rs.next()) {
				
				String name = rs.getString(1);
				String password = rs.getString(2);
				stu1 = new Students();
				stu1.setPassword(password);
				stu1.setName(name);
			}
			if (stu1 != null) {
				System.out.println("学生账号存在" );
				return true;
			} else
				return false;

		} catch (Exception ex) {
			ex.printStackTrace();
			return false;
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

}