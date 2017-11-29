package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import entity.Stu_grank;
import util.DBHelper;

public class Stu_grankDAOImp implements Stu_grankDAO {

	@Override
	public ArrayList<Object> getAllStu_grank() {
		// TODO Auto-generated method stub
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		ArrayList<Object> list = new ArrayList<Object>(); //������
		try {
			conn = DBHelper.getConnection();
			String sql = "select * from stu_grank order by stu_gr_id desc;"; // SQL���
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery();
			while (rs.next()) {
				Stu_grank stu_gr = new Stu_grank();
				stu_gr.setStu_gr_id(rs.getInt("stu_gr_id"));
				stu_gr.setSid(rs.getInt("sid"));
				stu_gr.setKj_id(rs.getInt("kj_id"));
				stu_gr.setStu_grank(rs.getInt("stu_grank"));									
				list.add(stu_gr);// ��һ��ѧ���ɼ�������¼���뼯��
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

	@Override
	public Object getStu_grankById(int stu_gr_id) {
		// TODO Auto-generated method stub
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		try {
			conn = DBHelper.getConnection();
			String sql = "select * from stu_grank where stu_gr_id=?;"; // SQL���
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, stu_gr_id);
			rs = stmt.executeQuery();
			if (rs.next()) {
				Stu_grank stu_gr = new Stu_grank();
				stu_gr.setStu_gr_id(rs.getInt("stu_gr_id"));
				stu_gr.setSid(rs.getInt("sid"));
				stu_gr.setKj_id(rs.getInt("kj_id"));
				stu_gr.setStu_grank(rs.getInt("stu_grank"));		
				return stu_gr;
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
	public boolean addStu_grank(Object stu_grank) {
		// TODO Auto-generated method stub
		Connection conn = null;
		PreparedStatement stmt = null;		
		Stu_grank Stu_result1 =(Stu_grank)stu_grank;
		int count;
		try {
			conn = DBHelper.getConnection();
			String sql = "insert into Stu_grank(sid,kj_id,Stu_grank) values(?,?,?);"; // SQL���
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, Stu_result1.getSid());		
			stmt.setInt(2, Stu_result1.getKj_id());
			stmt.setInt(3, Stu_result1.getStu_grank());			
			count=stmt.executeUpdate();
			System.out.println(count+"����ѧ��������¼");
			if (count==1) {
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

	@Override
	public boolean updateStu_grank(Object stu_grank) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean deleteStu_grank(int stu_gr_id) {
		// TODO Auto-generated method stub
		return false;
	}

}
