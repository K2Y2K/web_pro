package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;


import entity.Teachers;
import util.DBHelper;

public class TeachersDAO {
	// 获得所有的老师信息
	public ArrayList<Teachers> getAllTeachers() {
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		ArrayList<Teachers> list = new ArrayList<Teachers>(); // 商品集合
		try {
			conn = DBHelper.getConnection();
			String sql = "select * from Teachers;"; // SQL语句
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery();
			while (rs.next()) {
				Teachers item = new Teachers();
				item.setTid(rs.getInt("tid"));
				item.setName(rs.getString("name"));
				item.setPassword(rs.getString("password"));
				
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

	// 根据老师编号获得老师详细资料
	public Teachers getTeachersById(int id) {
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		try {
			conn = DBHelper.getConnection();
			String sql = "select * from Teachers where tid=?;"; // SQL语句
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, id);
			rs = stmt.executeQuery();
			if (rs.next()) {
				Teachers item = new Teachers();
				item.setTid(rs.getInt("tid"));
				item.setName(rs.getString("name"));
				item.setPassword(rs.getString("password"));

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

	// 根据老师用户名和密码获得老师详细资料
		public Teachers getIdByTeachers(Teachers stu) {
			Connection conn = null;
			PreparedStatement stmt = null;
			ResultSet rs = null;
			try {
				conn = DBHelper.getConnection();
				String sql = "select * from Teachers where name=? and password=?;"; // SQL语句
				stmt = conn.prepareStatement(sql);
				stmt.setString(1, stu.getName());
				stmt.setString(2, stu.getPassword());
				rs = stmt.executeQuery();
				if (rs.next()) {
					
					Teachers item = new Teachers();
					item.setTid(rs.getInt("tid"));
					item.setName(rs.getString("name"));
					item.setPassword(rs.getString("password"));

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
	// 老师账号激活方法/密码修改
	public boolean usersActivate(Teachers stu) {
		Connection conn = null;
		PreparedStatement stmt = null;
		int count;
		try {
			conn = DBHelper.getConnection();
			String sql = "update  Teachers set password =? where tid=? and name=?;"; // SQL语句
			stmt = conn.prepareStatement(sql);
			System.out.println("0000000000000" + stmt);
			stmt.setString(1, stu.getPassword());
			stmt.setInt(2, stu.getTid());
			stmt.setString(3, stu.getName());
			System.out.println("0000000000000" + stmt);
			count=stmt.executeUpdate();
			System.out.println("老师密码修改或激活的记录" +count);
			if (count == 1) {
				System.out.println("老师账号激活或修改成功" );
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

	// 老师登录是否成功
	public boolean teacherLogin(Teachers teacher) {
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		Teachers teacher1 = null;
		try {

			conn = DBHelper.getConnection();
			String sql = "select * from teachers where name=? and password=?;"; // SQL语句
			stmt = conn.prepareStatement(sql);
			System.out.println("0000000000000" + stmt);
			stmt.setString(1, teacher.getName());
			stmt.setString(2, teacher.getPassword());
			System.out.println("0000000000000" + stmt);
			rs = stmt.executeQuery();
			System.out.println("0000000000000" + rs);
			while (rs.next()) {
				
				String name = rs.getString(1);
				String password = rs.getString(2);
				teacher1 = new Teachers();
				teacher1.setPassword(password);
				teacher1.setName(name);
			}
			if (teacher1!= null) {
				System.out.println("老师用户存在");
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
	// 判断添加管理员 是否成功
		
		public boolean addTeachers(Teachers teachers) {
			// TODO Auto-generated method stub
			Connection conn = null;
			PreparedStatement stmt = null;

			int count;
			try {
				conn = DBHelper.getConnection();
				String sql = "insert into Teachers(name,academy) values(?,?);"; // SQL语句
				stmt = conn.prepareStatement(sql);
				
				stmt.setString(1, teachers.getName());
				stmt.setString(2, teachers.getAcademy());
				

				count = stmt.executeUpdate();
				System.out.println(count + "charu");
				if (count == 1) {
					return true;
				} else

					return false; // 返回集合。
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

		// 判断修改管理员信息是否成功
	
		public boolean updateTeachers(Teachers teachers) {
			// TODO Auto-generated method stub
			Connection conn = null;
			PreparedStatement stmt = null;
			int count;
			try {
				conn = DBHelper.getConnection();
				String sql = "update Teachers set name=?,academy=? where tid=?;"; // SQL语句
				stmt = conn.prepareStatement(sql);
				
				stmt.setString(1, teachers.getName());
				stmt.setString(2, teachers.getAcademy());
				stmt.setInt(3, teachers.getTid());

				count = stmt.executeUpdate();
				System.out.println(count + "xiugai");
				if (count == 1) {
					return true;
				} else

					return false; // 返回集合。
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

		// 判断删除管理员信息是否成功

		public boolean deleteTeachers(int tid) {
			// TODO Auto-generated method stub
			Connection conn = null;
			PreparedStatement stmt = null;

			int count;
			try {
				conn = DBHelper.getConnection();
				String sql = "delete from Teachers where tid=?;"; // SQL语句
				stmt = conn.prepareStatement(sql);
				stmt.setInt(1, tid);
				count = stmt.executeUpdate();
				System.out.println(count + "shanchu");
				if (count == 1) {
					return true;
				} else

					return false; // 返回集合。
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
	
}
