package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import entity.Java_pdt;
import util.DBHelper;

public class Java_pdtDAO implements Java_stDAO {
	// �жϷ��������⼯
	@Override
	public ArrayList<Object> getAllJava_st() {
		// TODO Auto-generated method stub
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		// ����Object������ת����Java_pdt���󣬴洢�ж��⼯��
		ArrayList<Object> list = new ArrayList<Object>();
		try {
			conn = DBHelper.getConnection();
			// ͨ��java_pdt_id�Ž������ ���ݿ�java_pdt���ѯ�����SQL���
			String sql = "select * from Java_pdt order by Java_pdt_id desc;";
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery();
			while (rs.next()) {
				Java_pdt j_dxt = new Java_pdt();
				j_dxt.setJava_pdt_id(rs.getInt("Java_pdt_id"));
				j_dxt.setJava_pdt_question(rs.getString("Java_pdt_question"));
				j_dxt.setJava_pdt_result(rs.getInt("Java_pdt_result"));
				list.add(j_dxt);// ��һ���ж�����뼯��
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

	// �����ж���ŷ����ж������ϸ��Ϣ
	@Override
	public Object getJava_stById(int java_pdt_id) {
		// TODO Auto-generated method stub
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		try {
			conn = DBHelper.getConnection();
			String sql = "select * from java_pdt where java_pdt_id=?;"; // SQL���
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
	public int getJava_st_idByJava_st(Object j_dxt) {
		// TODO Auto-generated method stub
		return 0;
	}

	// �����ж��⣬����ɹ�����true��ʧ��Ϊfalse
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
			System.out.println("�����ж����¼����:" + count);
			if (count == 1) {
				System.out.println("�����ж����¼�ɹ�");
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

	// �޸��ж��⣬�޸ĳɹ�����true���޸�ʧ�ܷ���false
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
			System.out.println("�޸��ж����¼����:" + count);
			if (count == 1) {
				System.out.println("�޸��ж����¼�ɹ�");
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

	// ɾ���ж���
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
			System.out.println("ɾ���ж����¼����:" + count);
			if (count == 1) {
				System.out.println("ɾ���ж����¼�ɹ�");
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

	// ��ȡ�����ӵ��ж���
	public ArrayList<Java_pdt> getViewList(String list) {
		System.out.println("pdtlist:" + list);
		ArrayList<Java_pdt> stlist = new ArrayList<Java_pdt>();
		if (list != null && list.length() > 0) {
			String[] arr = list.split("#");
			System.out.println("arr.length=" + arr.length);
			for (int i = arr.length - 1; i >= 0; i--) {
				if (arr[i] != null && getJava_stById(Integer.parseInt(arr[i])) != null) {
					stlist.add((Java_pdt) getJava_stById(Integer.parseInt(arr[i])));
					System.out.println("�ɹ���ȡ�����ӵ��ж���java_pdt_id��:"+arr[i]);
				}System.out.println("�ɹ�������λ�ȡ�����ӵ��ж����¼����stlist:"+stlist);
			}
			return stlist;
			
		} else {
			return null;
		}
	}
}
