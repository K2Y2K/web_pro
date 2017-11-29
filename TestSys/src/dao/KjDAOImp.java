package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;


import entity.Kj;
import util.DBHelper;

public class KjDAOImp implements KjDAO {

	@Override
	public ArrayList<Object> getAllKj() {
		// TODO Auto-generated method stub
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		ArrayList<Object> list = new ArrayList<Object>(); //������
		try {
			conn = DBHelper.getConnection();
			String sql = "select * from kj order by kj_id desc;"; // SQL���
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery();
			while (rs.next()) {
				Kj kj = new Kj();
				kj.setKj_id(rs.getInt("kj_id"));
				kj.setKj_name(rs.getString("kj_name"));
				kj.setKj_dxt_id(rs.getString("kj_dxt_id"));
				kj.setKj_dxt_g(rs.getInt("kj_dxt_g"));
				kj.setKj_dxts_id(rs.getString("kj_dxts_id"));
				kj.setKj_dxts_g(rs.getInt("kj_dxts_g"));
				kj.setKj_pdt_id(rs.getString("kj_pdt_id"));
				kj.setKj_pdt_g(rs.getInt("kj_pdt_g"));
				kj.setKj_type(rs.getInt("kj_type"));
				kj.setC_id(rs.getInt("c_id"));
				kj.setTid(rs.getInt("tid"));		
				list.add(kj);// ��һ�������Ծ���뼯��
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
//���ݿ��Ա�Ż�ȡ�����������
	@Override
	public Object getKtById(int kj_id) {
		// TODO Auto-generated method stub
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		try {
			conn = DBHelper.getConnection();
			String sql = "select * from kj where kj_id=?;"; // SQL���
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, kj_id);
			rs = stmt.executeQuery();
			if (rs.next()) {
				Kj kj = new Kj();
				kj.setKj_id(rs.getInt("kj_id"));
				kj.setKj_name(rs.getString("kj_name"));
				kj.setKj_dxt_id(rs.getString("kj_dxt_id"));
				kj.setKj_dxt_g(rs.getInt("kj_dxt_g"));
				kj.setKj_dxts_id(rs.getString("kj_dxts_id"));
				kj.setKj_dxts_g(rs.getInt("kj_dxts_g"));
				kj.setKj_pdt_id(rs.getString("kj_pdt_id"));
				kj.setKj_pdt_g(rs.getInt("kj_pdt_g"));
				kj.setKj_type(rs.getInt("kj_type"));
				kj.setC_id(rs.getInt("c_id"));
				kj.setTid(rs.getInt("tid"));
				return kj;
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

//�жϲ����Ծ��Ƿ�ɹ�
	@Override
	public boolean addKj(Object kj) {
		// TODO Auto-generated method stub
		Connection conn = null;
		PreparedStatement stmt = null;		
		Kj kj1 =(Kj)kj;
		int count;
		try {
			conn = DBHelper.getConnection();
			String sql = "insert into kj(kj_name,kj_dxt_id,kj_dxt_g,kj_dxts_id,kj_dxts_g,kj_pdt_id,kj_pdt_g,kj_type,c_id,tid)  values(?,?,?,?,?,?,?,?,?,?);"; // SQL���
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, kj1.getKj_name());		
			stmt.setString(2, kj1.getKj_dxt_id());
			stmt.setInt(3, kj1.getKj_dxt_g());
			stmt.setString(4, kj1.getKj_dxts_id());
			stmt.setInt(5, kj1.getKj_dxts_g());
			stmt.setString(6, kj1.getKj_pdt_id());
			stmt.setInt(7, kj1.getKj_pdt_g());
			stmt.setInt(8, kj1.getKj_type());
			stmt.setInt(9, kj1.getC_id());
			stmt.setInt(10, kj1.getTid());
			count=stmt.executeUpdate();
			System.out.println(count+"�����Ծ�");
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
//�ж��޸��Ծ��Ƿ�ɹ�
	@Override
	public boolean updateKj(Object kj) {
		// TODO Auto-generated method stub
		Connection conn = null;
		PreparedStatement stmt = null;
		Kj kj1 =(Kj)kj;
		int count;
		try {
			conn = DBHelper.getConnection();
			String sql = "update kj set kj_name=?,kj_dxt_id=?,kj_dxt_g=?,kj_dxts_id=?,kj_dxts_g=?,kj_pdt_id=?,kj_pdt_g=?,kj_type=?,c_id=?,tid=? where kj_id=?;"; // SQL���
			stmt = conn.prepareStatement(sql);			
			stmt.setString(1, kj1.getKj_name());		
			stmt.setString(2, kj1.getKj_dxt_id());
			stmt.setInt(3, kj1.getKj_dxt_g());
			stmt.setString(4, kj1.getKj_dxts_id());
			stmt.setInt(5, kj1.getKj_dxts_g());
			stmt.setString(6, kj1.getKj_pdt_id());
			stmt.setInt(7, kj1.getKj_pdt_g());
			stmt.setInt(8, kj1.getKj_type());
			stmt.setInt(9, kj1.getC_id());
			stmt.setInt(10, kj1.getTid());
			stmt.setInt(11, kj1.getKj_id());
			count=stmt.executeUpdate();
			System.out.println(count+"�޸��Ծ�");
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
//�ж�ɾ���Ծ��Ƿ�ɹ�
	@Override
	public boolean deleteKj(int kj_id) {
		// TODO Auto-generated method stub
		Connection conn = null;
		PreparedStatement stmt = null;		
		int count;
		try {
			conn = DBHelper.getConnection();
			String sql = "delete from kj where kj_id=?;"; // SQL���
			stmt = conn.prepareStatement(sql);		
			stmt.setInt(1, kj_id);
			count=stmt.executeUpdate();
			System.out.println(count+"ɾ���Ծ�");
			if (count ==1) {
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
