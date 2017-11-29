package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;


import entity.Teachers;
import util.DBHelper;

public class TeachersDAO {
	// ������е���ʦ��Ϣ
	public ArrayList<Teachers> getAllTeachers() {
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		ArrayList<Teachers> list = new ArrayList<Teachers>(); // ��Ʒ����
		try {
			conn = DBHelper.getConnection();
			String sql = "select * from Teachers;"; // SQL���
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery();
			while (rs.next()) {
				Teachers item = new Teachers();
				item.setTid(rs.getInt("tid"));
				item.setName(rs.getString("name"));
				item.setPassword(rs.getString("password"));
				
				item.setAcademy(rs.getString("academy"));
				list.add(item);// ��һ����Ʒ���뼯��
			}
			return list; // ���ؼ��ϡ�
		} catch (Exception ex) {
			ex.printStackTrace();
			return null;
		} finally {
			// �ͷ����ݼ�����
			if (rs != null) {
				try {
					rs.close();
					rs = null;
				} catch (Exception ex) {
					ex.printStackTrace();
				}
			}
			// �ͷ�������
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

	// ������ʦ��Ż����ʦ��ϸ����
	public Teachers getTeachersById(int id) {
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		try {
			conn = DBHelper.getConnection();
			String sql = "select * from Teachers where tid=?;"; // SQL���
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
			// �ͷ����ݼ�����
			if (rs != null) {
				try {
					rs.close();
					rs = null;
				} catch (Exception ex) {
					ex.printStackTrace();
				}
			}
			// �ͷ�������
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

	// ������ʦ�û�������������ʦ��ϸ����
		public Teachers getIdByTeachers(Teachers stu) {
			Connection conn = null;
			PreparedStatement stmt = null;
			ResultSet rs = null;
			try {
				conn = DBHelper.getConnection();
				String sql = "select * from Teachers where name=? and password=?;"; // SQL���
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
				// �ͷ����ݼ�����
				if (rs != null) {
					try {
						rs.close();
						rs = null;
					} catch (Exception ex) {
						ex.printStackTrace();
					}
				}
				// �ͷ�������
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
	// ��ʦ�˺ż����/�����޸�
	public boolean usersActivate(Teachers stu) {
		Connection conn = null;
		PreparedStatement stmt = null;
		int count;
		try {
			conn = DBHelper.getConnection();
			String sql = "update  Teachers set password =? where tid=? and name=?;"; // SQL���
			stmt = conn.prepareStatement(sql);
			System.out.println("0000000000000" + stmt);
			stmt.setString(1, stu.getPassword());
			stmt.setInt(2, stu.getTid());
			stmt.setString(3, stu.getName());
			System.out.println("0000000000000" + stmt);
			count=stmt.executeUpdate();
			System.out.println("��ʦ�����޸Ļ򼤻�ļ�¼" +count);
			if (count == 1) {
				System.out.println("��ʦ�˺ż�����޸ĳɹ�" );
				return true;
			} else
				return false;

		} catch (Exception ex) {
			ex.printStackTrace();
			return false;
		} finally {

			// �ͷ�������
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

	// ��ʦ��¼�Ƿ�ɹ�
	public boolean teacherLogin(Teachers teacher) {
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		Teachers teacher1 = null;
		try {

			conn = DBHelper.getConnection();
			String sql = "select * from teachers where name=? and password=?;"; // SQL���
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
				System.out.println("��ʦ�û�����");
				return true;
			} else
				return false;
		} catch (Exception ex) {
			ex.printStackTrace();
			return false;
		} finally {
			// �ͷ����ݼ�����
			if (rs != null) {
				try {
					rs.close();
					rs = null;
				} catch (Exception ex) {
					ex.printStackTrace();
				}
			}
			// �ͷ�������
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
	// �ж���ӹ���Ա �Ƿ�ɹ�
		
		public boolean addTeachers(Teachers teachers) {
			// TODO Auto-generated method stub
			Connection conn = null;
			PreparedStatement stmt = null;

			int count;
			try {
				conn = DBHelper.getConnection();
				String sql = "insert into Teachers(name,academy) values(?,?);"; // SQL���
				stmt = conn.prepareStatement(sql);
				
				stmt.setString(1, teachers.getName());
				stmt.setString(2, teachers.getAcademy());
				

				count = stmt.executeUpdate();
				System.out.println(count + "charu");
				if (count == 1) {
					return true;
				} else

					return false; // ���ؼ��ϡ�
			} catch (Exception ex) {
				ex.printStackTrace();
				return false;
			} finally {

				// �ͷ�������
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

		// �ж��޸Ĺ���Ա��Ϣ�Ƿ�ɹ�
	
		public boolean updateTeachers(Teachers teachers) {
			// TODO Auto-generated method stub
			Connection conn = null;
			PreparedStatement stmt = null;
			int count;
			try {
				conn = DBHelper.getConnection();
				String sql = "update Teachers set name=?,academy=? where tid=?;"; // SQL���
				stmt = conn.prepareStatement(sql);
				
				stmt.setString(1, teachers.getName());
				stmt.setString(2, teachers.getAcademy());
				stmt.setInt(3, teachers.getTid());

				count = stmt.executeUpdate();
				System.out.println(count + "xiugai");
				if (count == 1) {
					return true;
				} else

					return false; // ���ؼ��ϡ�
			} catch (Exception ex) {
				ex.printStackTrace();
				return false;
			} finally {

				// �ͷ�������
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

		// �ж�ɾ������Ա��Ϣ�Ƿ�ɹ�

		public boolean deleteTeachers(int tid) {
			// TODO Auto-generated method stub
			Connection conn = null;
			PreparedStatement stmt = null;

			int count;
			try {
				conn = DBHelper.getConnection();
				String sql = "delete from Teachers where tid=?;"; // SQL���
				stmt = conn.prepareStatement(sql);
				stmt.setInt(1, tid);
				count = stmt.executeUpdate();
				System.out.println(count + "shanchu");
				if (count == 1) {
					return true;
				} else

					return false; // ���ؼ��ϡ�
			} catch (Exception ex) {
				ex.printStackTrace();
				return false;
			} finally {

				// �ͷ�������
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
