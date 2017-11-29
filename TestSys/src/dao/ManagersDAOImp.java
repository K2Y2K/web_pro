package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import entity.Managers;
import util.DBHelper;

public class ManagersDAOImp implements ManagersDAO {
	// ��ȡ����Ա��������Ϣ
	@Override
	public ArrayList<Managers> getAllManagers() {
		// TODO Auto-generated method stub
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		ArrayList<Managers> list = new ArrayList<Managers>(); // ��Ʒ����
		try {
			conn = DBHelper.getConnection();
			String sql = "select * from Managers;"; // SQL���
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery();
			while (rs.next()) {
				Managers item = new Managers();
				item.setM_id(rs.getInt("m_id"));
				item.setM_name(rs.getString("M_name"));
				item.setM_password(rs.getString("m_password"));
				item.setM_type(rs.getInt("m_type"));
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

	// ���ݹ���Աid ��ȡ������Ϣ
	@Override
	public Managers getManagersById(int m_id) {
		// TODO Auto-generated method stub
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		try {
			conn = DBHelper.getConnection();
			String sql = "select * from Managers where m_id=?;"; // SQL���
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, m_id);
			rs = stmt.executeQuery();
			if (rs.next()) {
				Managers item = new Managers();
				item.setM_id(rs.getInt("m_id"));
				item.setM_name(rs.getString("M_name"));
				item.setM_password(rs.getString("m_password"));
				item.setM_type(rs.getInt("m_type"));
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

	@Override
	public int getManagers_idByManagers(Managers managers) {
		// TODO Auto-generated method stub
		return 0;
	}

	// �ж���ӹ���Ա �Ƿ�ɹ�
	@Override
	public boolean addManagers(Managers managers) {
		// TODO Auto-generated method stub
		Connection conn = null;
		PreparedStatement stmt = null;

		int count;
		try {
			conn = DBHelper.getConnection();
			String sql = "insert into managers values(?,?,?,?);"; // SQL���
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, managers.getM_id());
			stmt.setString(2, managers.getM_name());
			stmt.setString(3, managers.getM_password());
			stmt.setInt(4, managers.getM_type());

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
	@Override
	public boolean updateManagers(Managers managers) {
		// TODO Auto-generated method stub
		Connection conn = null;
		PreparedStatement stmt = null;
		int count;
		try {
			conn = DBHelper.getConnection();
			String sql = "update managers set m_name=?,m_password=?,m_type=? where m_id=?;"; // SQL���
			stmt = conn.prepareStatement(sql);
			stmt.setInt(4, managers.getM_id());
			stmt.setString(1, managers.getM_name());
			stmt.setString(2, managers.getM_password());
			stmt.setInt(3, managers.getM_type());

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
	@Override
	public boolean deleteManagers(int m_id) {
		// TODO Auto-generated method stub
		Connection conn = null;
		PreparedStatement stmt = null;

		int count;
		try {
			conn = DBHelper.getConnection();
			String sql = "delete from managers where m_id=?;"; // SQL���
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, m_id);
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

	// ����Ա��¼�˺�
	public boolean usersLogin(Managers manager) {
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		Managers manager1 = null;
		try {
			conn = DBHelper.getConnection();
			String sql = "select * from Managers  where m_name=? and m_password=?;"; // SQL���
			stmt = conn.prepareStatement(sql);
			System.out.println("0000000000000" + stmt);
			stmt.setString(1, manager.getM_name());
			stmt.setString(2, manager.getM_password());
			System.out.println("0000000000000" + stmt);
			rs = stmt.executeQuery();
			System.out.println("0000000000000" + stmt);
			while (rs.next()) {
				String name = rs.getString(1);
				String password = rs.getString(2);
				manager1 = new Managers();
				manager1.setM_password(password);
				manager1.setM_name(name);
			}
			if (manager1 != null) {
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
