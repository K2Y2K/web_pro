package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;


import entity.Java_dxts;
import util.DBHelper;

public class Java_dxtsDAO {
	//返回多选题列表
	public ArrayList<Java_dxts> getAllJava_dxts() {
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		ArrayList<Java_dxts> list = new ArrayList<Java_dxts>(); // 商品集合
		try {
			conn = DBHelper.getConnection();
			String sql = "select * from Java_dxts order by Java_dxts_id desc;"; // SQL语句
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
				list.add(j_dxt);// 把一个商品加入集合
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

	// 根据多选题编号获得单选题
	public Java_dxts getJava_dxtsById(int Java_dxts_id) {
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		try {
			conn = DBHelper.getConnection();
			String sql = "select * from Java_dxts where Java_dxts_id=?;"; // SQL语句
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

	// 根据多选题获得储存编号
	public int getJava_dxts_idByJava_dxts(Java_dxts j_dxt) {
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		try {
			conn = DBHelper.getConnection();
			String sql = "select Java_dxts_id from Java_dxts where Java_dxts_question=? and Java_dxts_opt=?;"; // SQL语句
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

	// 插入多选题集
	public boolean addJava_dxts(Java_dxts j_dxt) {
		Connection conn = null;
		PreparedStatement stmt = null;
		// ResultSet rs = null;
		int count;
		try {
			conn = DBHelper.getConnection();
			String sql = "insert into Java_dxts(Java_dxts_question,Java_dxts_opt1,Java_dxts_opt2,Java_dxts_opt3,Java_dxts_opt4,Java_dxts_result)  values(?,?,?,?,?,?);"; // SQL语句
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, j_dxt.getJava_dxts_question());
			stmt.setString(2, j_dxt.getJava_dxts_opt1());
			stmt.setString(3, j_dxt.getJava_dxts_opt2());
			stmt.setString(4, j_dxt.getJava_dxts_opt3());
			stmt.setString(5, j_dxt.getJava_dxts_opt4());
			stmt.setString(6, j_dxt.getJava_dxts_result());
			count = stmt.executeUpdate();
			System.out.println(count + "插入多选题");
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

	// 修改单选题集
	public boolean updateJava_dxts(Java_dxts j_dxt) {
		Connection conn = null;
		PreparedStatement stmt = null;
		// ResultSet rs = null;
		int count;
		try {
			conn = DBHelper.getConnection();
			String sql = "update Java_dxts set Java_dxts_question=?,Java_dxts_opt1=?,Java_dxts_opt2=?,Java_dxts_opt3=?,Java_dxts_opt4=?,Java_dxts_result=? where Java_dxts_id=?;"; // SQL语句
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, j_dxt.getJava_dxts_question());
			stmt.setString(2, j_dxt.getJava_dxts_opt1());
			stmt.setString(3, j_dxt.getJava_dxts_opt2());
			stmt.setString(4, j_dxt.getJava_dxts_opt3());
			stmt.setString(5, j_dxt.getJava_dxts_opt4());
			stmt.setString(6, j_dxt.getJava_dxts_result());
			stmt.setInt(7, j_dxt.getJava_dxts_id());
			count = stmt.executeUpdate();
			System.out.println(count + "修改多选题");
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

	// 删除单选题集
	public boolean deleteJava_dxts(int Java_dxts_id) {
		Connection conn = null;
		PreparedStatement stmt = null;
		// ResultSet rs = null;
		int count;
		try {
			conn = DBHelper.getConnection();
			String sql = "delete from Java_dxts where Java_dxts_id=?;"; // SQL语句
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, Java_dxts_id);
			count = stmt.executeUpdate();
			System.out.println(count + "删除多选题");
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
	//获取最近添加的判断题
			public ArrayList<Java_dxts> getViewList(String list)
			{
				System.out.println("dxtslist:"+list);
				ArrayList<Java_dxts> stlist = new ArrayList<Java_dxts>();
				//int iCount=5; //每次返回前五条记录
				if(list!=null&&list.length()>0)
				{
				    String[] arr = list.split("#");
				    System.out.println("arr.length="+arr.length);
				    for(int i=arr.length-1;i>=0;i--)
				       {if(arr[i]!=null&&getJava_dxtsById(Integer.parseInt(arr[i]))!=null){
				    	  stlist.add(getJava_dxtsById(Integer.parseInt(arr[i])));  
				       }} 
				    /*//如果多选题记录大于等于5条
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
