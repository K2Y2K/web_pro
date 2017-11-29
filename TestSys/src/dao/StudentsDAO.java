package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import entity.Students;
import entity.Teachers;
import util.DBHelper;

//ѧ����ҵ���߼�
public class StudentsDAO {

	// ������е�ѧ����Ϣ
	public ArrayList<Students> getAllStudents() {
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		ArrayList<Students> list = new ArrayList<Students>(); // ��Ʒ����
		try {
			conn = DBHelper.getConnection();
			String sql = "select * from Students;"; // SQL���
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery();
			while (rs.next()) {
				Students item = new Students();
				item.setSid(rs.getInt("sid"));
				item.setName(rs.getString("name"));
				item.setPassword(rs.getString("password"));
				item.setBanji(rs.getString("banji"));
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

	// ����ѧ����Ż��ѧ����ϸ����
	public Students getStudentsById(int id) {
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		try {
			conn = DBHelper.getConnection();
			String sql = "select * from Students where sid=?;"; // SQL���
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

	// ����ѧ���û�����������ѧ����ϸ����
			public Students getIdByStudents(Students stu) {
				Connection conn = null;
				PreparedStatement stmt = null;
				ResultSet rs = null;
				Students item =null;
				try {
					conn = DBHelper.getConnection();
					String sql = "select * from Students where name=? and password=?;"; // SQL���
					stmt = conn.prepareStatement(sql);
					stmt.setString(1, stu.getName());
					stmt.setString(2, stu.getPassword());
					System.out.println("ѧ���˺���Ϣ" + stmt);
					rs = stmt.executeQuery();
					System.out.println("ѧ���˺���Ϣ��ѯ���" + rs);
					while (rs.next()) {
						System.out.println("ѧ���˺���Ϣrs ��Ϊ��");	
						 item = new Students();
						item.setSid(rs.getInt("sid"));
						item.setName(rs.getString("name"));
						item.setPassword(rs.getString("password"));

						item.setAcademy(rs.getString("academy"));
						
					} 
					if(item != null){
						System.out.println("����ѧ���˺���Ϣ" );
						return item;
					}
					else {
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
	// ѧ�������/�����޸�
	public boolean usersActivate(Students stu) {
		Connection conn = null;
		PreparedStatement stmt = null;	
		int count;
		try {
			conn = DBHelper.getConnection();
			String sql = "update  Students set password =? where sid=? and name=?;";
			stmt = conn.prepareStatement(sql);
			System.out.println("ѧ������������˺���Ϣ" + stmt);
			stmt.setString(1, stu.getPassword());
			stmt.setInt(2, stu.getSid());
			stmt.setString(3, stu.getName());
			System.out.println("ѧ������������˺���Ϣ2" + stmt);
			count=stmt.executeUpdate();
			System.out.println("ѧ������������˺���Ϣ��¼" + count);
			if (count== 1) {
				System.out.println("ѧ���˺ż�����޸ĳɹ�" );
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

	// ѧ����¼�˺�
	public boolean usersLogin(Students stu) {
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		Students stu1 = null;
		try {
			conn = DBHelper.getConnection();
			String sql = "select * from Students  where name=? and password=?;"; // SQL���
			stmt = conn.prepareStatement(sql);
			System.out.println("0000000000000ѧ��" + stmt);
			stmt.setString(1, stu.getName());
			stmt.setString(2, stu.getPassword());
			System.out.println("0000000000000ѧ��" + stmt);
			rs = stmt.executeQuery();
			System.out.println("0000000000000ѧ��" + rs);
			while (rs.next()) {
				
				String name = rs.getString(1);
				String password = rs.getString(2);
				stu1 = new Students();
				stu1.setPassword(password);
				stu1.setName(name);
			}
			if (stu1 != null) {
				System.out.println("ѧ���˺Ŵ���" );
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

}