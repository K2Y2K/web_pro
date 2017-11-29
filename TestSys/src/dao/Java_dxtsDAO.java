package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;


import entity.Java_dxts;
import util.DBHelper;

public class Java_dxtsDAO {
	//���ض�ѡ���б�
	public ArrayList<Java_dxts> getAllJava_dxts() {
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		ArrayList<Java_dxts> list = new ArrayList<Java_dxts>(); // ��Ʒ����
		try {
			conn = DBHelper.getConnection();
			String sql = "select * from Java_dxts order by Java_dxts_id desc;"; // SQL���
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery();
			while (rs.next()) {
				Java_dxts j_dxt = new Java_dxts();
				j_dxt.setJava_dxts_id(rs.getInt("Java_dxts_id"));
				j_dxt.setJava_dxts_question(rs.getString("Java_dxts_question"));
				j_dxt.setJava_dxts_opt1(rs.getString("Java_dxts_opt1"));
				j_dxt.setJava_dxts_opt2(rs.getString("Java_dxts_opt2"));
				j_dxt.setJava_dxts_opt3(rs.getString("Java_dxts_opt3"));
				j_dxt.setJava_dxts_opt4(rs.getString("Java_dxts_opt4"));
				j_dxt.setJava_dxts_result(rs.getString("Java_dxts_result"));
				list.add(j_dxt);// ��һ����Ʒ���뼯��
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

	// ���ݶ�ѡ���Ż�õ�ѡ��
	public Java_dxts getJava_dxtsById(int Java_dxts_id) {
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		try {
			conn = DBHelper.getConnection();
			String sql = "select * from Java_dxts where Java_dxts_id=?;"; // SQL���
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, Java_dxts_id);
			rs = stmt.executeQuery();
			if (rs.next()) {
				Java_dxts j_dxt = new Java_dxts();
				j_dxt.setJava_dxts_id(rs.getInt("Java_dxts_id"));
				j_dxt.setJava_dxts_question(rs.getString("Java_dxts_question"));
				j_dxt.setJava_dxts_opt1(rs.getString("Java_dxts_opt1"));
				j_dxt.setJava_dxts_opt2(rs.getString("Java_dxts_opt2"));
				j_dxt.setJava_dxts_opt3(rs.getString("Java_dxts_opt3"));
				j_dxt.setJava_dxts_opt4(rs.getString("Java_dxts_opt4"));
				j_dxt.setJava_dxts_result(rs.getString("Java_dxts_result"));
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

	// ���ݶ�ѡ���ô�����
	public int getJava_dxts_idByJava_dxts(Java_dxts j_dxt) {
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		try {
			conn = DBHelper.getConnection();
			String sql = "select Java_dxts_id from Java_dxts where Java_dxts_question=? and Java_dxts_opt=?;"; // SQL���
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, j_dxt.getJava_dxts_question());
			stmt.setString(2, j_dxt.getJava_dxts_opt1());

			rs = stmt.executeQuery();
			if (rs.next()) {
				Java_dxts j_dxt1 = new Java_dxts();
				j_dxt1.setJava_dxts_id(rs.getInt("Java_dxts_id"));

				return j_dxt1.getJava_dxts_id();
			} else {
				return -1;
			}

		} catch (Exception ex) {
			ex.printStackTrace();
			return -1;
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

	// �����ѡ�⼯
	public boolean addJava_dxts(Java_dxts j_dxt) {
		Connection conn = null;
		PreparedStatement stmt = null;
		// ResultSet rs = null;
		int count;
		try {
			conn = DBHelper.getConnection();
			String sql = "insert into Java_dxts(Java_dxts_question,Java_dxts_opt1,Java_dxts_opt2,Java_dxts_opt3,Java_dxts_opt4,Java_dxts_result)  values(?,?,?,?,?,?);"; // SQL���
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, j_dxt.getJava_dxts_question());
			stmt.setString(2, j_dxt.getJava_dxts_opt1());
			stmt.setString(3, j_dxt.getJava_dxts_opt2());
			stmt.setString(4, j_dxt.getJava_dxts_opt3());
			stmt.setString(5, j_dxt.getJava_dxts_opt4());
			stmt.setString(6, j_dxt.getJava_dxts_result());
			count = stmt.executeUpdate();
			System.out.println(count + "�����ѡ��");
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

	// �޸ĵ�ѡ�⼯
	public boolean updateJava_dxts(Java_dxts j_dxt) {
		Connection conn = null;
		PreparedStatement stmt = null;
		// ResultSet rs = null;
		int count;
		try {
			conn = DBHelper.getConnection();
			String sql = "update Java_dxts set Java_dxts_question=?,Java_dxts_opt1=?,Java_dxts_opt2=?,Java_dxts_opt3=?,Java_dxts_opt4=?,Java_dxts_result=? where Java_dxts_id=?;"; // SQL���
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, j_dxt.getJava_dxts_question());
			stmt.setString(2, j_dxt.getJava_dxts_opt1());
			stmt.setString(3, j_dxt.getJava_dxts_opt2());
			stmt.setString(4, j_dxt.getJava_dxts_opt3());
			stmt.setString(5, j_dxt.getJava_dxts_opt4());
			stmt.setString(6, j_dxt.getJava_dxts_result());
			stmt.setInt(7, j_dxt.getJava_dxts_id());
			count = stmt.executeUpdate();
			System.out.println(count + "�޸Ķ�ѡ��");
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

	// ɾ����ѡ�⼯
	public boolean deleteJava_dxts(int Java_dxts_id) {
		Connection conn = null;
		PreparedStatement stmt = null;
		// ResultSet rs = null;
		int count;
		try {
			conn = DBHelper.getConnection();
			String sql = "delete from Java_dxts where Java_dxts_id=?;"; // SQL���
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, Java_dxts_id);
			count = stmt.executeUpdate();
			System.out.println(count + "ɾ����ѡ��");
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
	//��ȡ�����ӵ��ж���
			public ArrayList<Java_dxts> getViewList(String list)
			{
				System.out.println("dxtslist:"+list);
				ArrayList<Java_dxts> stlist = new ArrayList<Java_dxts>();
				//int iCount=5; //ÿ�η���ǰ������¼
				if(list!=null&&list.length()>0)
				{
				    String[] arr = list.split("#");
				    System.out.println("arr.length="+arr.length);
				    for(int i=arr.length-1;i>=0;i--)
				       {if(arr[i]!=null&&getJava_dxtsById(Integer.parseInt(arr[i]))!=null){
				    	  stlist.add(getJava_dxtsById(Integer.parseInt(arr[i])));  
				       }} 
				    /*//�����ѡ���¼���ڵ���5��
				    if(arr.length>=5)
				    {
				       for(int i=arr.length-1;i>=arr.length-iCount;i--)
				       {
				    	  stlist.add(getJava_dxtsById(Integer.parseInt(arr[i])));  
				       }
				    }
				    else
				    {
				    	for(int i=arr.length-1;i>=0;i--)
				    	{
				    		stlist.add(getJava_dxtsById(Integer.parseInt(arr[i])));
				    	}
				    }*/
				    return stlist;
				}
				else
				{
					return null;
				}
				
			}
}
