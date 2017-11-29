package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import entity.Java_dxt;

import util.DBHelper;

public class Java_dxtDAO {
	// 获取所有的单选题集
	public ArrayList<Java_dxt> getAllJava_dxt() {
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		ArrayList<Java_dxt> list = new ArrayList<Java_dxt>(); // 商品集合
		try {
			conn = DBHelper.getConnection();
			String sql = "select * from Java_dxt order by java_dxt_id desc;"; // SQL语句
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery();
			while (rs.next()) {
				Java_dxt j_dxt = new Java_dxt();
				j_dxt.setJava_dxt_id(rs.getInt("java_dxt_id"));
				j_dxt.setJava_dxt_question(rs.getString("java_dxt_question"));
				j_dxt.setJava_dxt_opt1(rs.getString("java_dxt_opt1"));
				j_dxt.setJava_dxt_opt2(rs.getString("java_dxt_opt2"));
				j_dxt.setJava_dxt_opt3(rs.getString("java_dxt_opt3"));
				j_dxt.setJava_dxt_opt4(rs.getString("java_dxt_opt4"));
				j_dxt.setJava_dxt_result(rs.getString("java_dxt_result"));
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

	// 根据单选题编号获得单选题
	public Java_dxt getJava_dxtById(int java_dxt_id) {
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		try {
			conn = DBHelper.getConnection();
			String sql = "select * from Java_dxt where java_dxt_id=?;"; // SQL语句
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, java_dxt_id);
			rs = stmt.executeQuery();
			if (rs.next()) {
				Java_dxt j_dxt = new Java_dxt();
				j_dxt.setJava_dxt_id(rs.getInt("java_dxt_id"));
				j_dxt.setJava_dxt_question(rs.getString("java_dxt_question"));
				j_dxt.setJava_dxt_opt1(rs.getString("java_dxt_opt1"));
				j_dxt.setJava_dxt_opt2(rs.getString("java_dxt_opt2"));
				j_dxt.setJava_dxt_opt3(rs.getString("java_dxt_opt3"));
				j_dxt.setJava_dxt_opt4(rs.getString("java_dxt_opt4"));
				j_dxt.setJava_dxt_result(rs.getString("java_dxt_result"));
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

	// 根据单选题获得储存编号
		public int getJava_dxt_idByJava_dxt(Java_dxt j_dxt) {
			Connection conn = null;
			PreparedStatement stmt = null;
			ResultSet rs = null;
			try {
				conn = DBHelper.getConnection();
				String sql = "select java_dxt_id from Java_dxt where java_dxt_question=? and java_dxt_opt=?;"; // SQL语句
				stmt = conn.prepareStatement(sql);
				stmt.setString(1, j_dxt.getJava_dxt_question());
				stmt.setString(2, j_dxt.getJava_dxt_opt1());
				
				rs = stmt.executeQuery();
				if (rs.next()) {
					Java_dxt j_dxt1 = new Java_dxt();
					j_dxt1.setJava_dxt_id(rs.getInt("java_dxt_id"));
					
					return j_dxt1.getJava_dxt_id();
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
	// 插入单选题集
	public boolean addJava_dxt(Java_dxt j_dxt) {
		Connection conn = null;
		PreparedStatement stmt = null;
		//ResultSet rs = null;
		int count;
		System.out.println("插入单选题1");
	/*	String str = "A:B;C:D:E;F;G;H:I:J;,4,7";
		 String[] strArr = str.split(",");
		  for(int i=0; i<strArr.length; i++) {
		   System.out.println("输出分隔字符在"+strArr[i]);
		  }测试split分离(; : ,)都成功
		  */
		try {
			conn = DBHelper.getConnection();
			String sql = "insert into java_dxt(java_dxt_question,java_dxt_opt1,java_dxt_opt2,java_dxt_opt3,java_dxt_opt4,java_dxt_result)  values(?,?,?,?,?,?);"; // SQL语句
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, j_dxt.getJava_dxt_question());
			stmt.setString(2, j_dxt.getJava_dxt_opt1());
			stmt.setString(3, j_dxt.getJava_dxt_opt2());
			stmt.setString(4, j_dxt.getJava_dxt_opt3());
			stmt.setString(5, j_dxt.getJava_dxt_opt4());
			stmt.setString(6, j_dxt.getJava_dxt_result());
			count=stmt.executeUpdate();
			System.out.println(count+"插入单选题");
			if (count==1) {
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
	public boolean updateJava_dxt(Java_dxt j_dxt) {
		Connection conn = null;
		PreparedStatement stmt = null;
		System.out.println("修改单选题2");
		int count;
		try {
			conn = DBHelper.getConnection();
			String sql = "update java_dxt set java_dxt_question=?,java_dxt_opt1=?,java_dxt_opt2=?,java_dxt_opt3=?,java_dxt_opt4=?,java_dxt_result=? where java_dxt_id=?;"; // SQL语句
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, j_dxt.getJava_dxt_question());
			stmt.setString(2, j_dxt.getJava_dxt_opt1());
			stmt.setString(3, j_dxt.getJava_dxt_opt2());
			stmt.setString(4, j_dxt.getJava_dxt_opt3());
			stmt.setString(5, j_dxt.getJava_dxt_opt4());
			stmt.setString(6, j_dxt.getJava_dxt_result());
			stmt.setInt(7, j_dxt.getJava_dxt_id());
			count=stmt.executeUpdate();
			System.out.println(count+"修改单选题");
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
	public boolean deleteJava_dxt(int java_dxt_id) {
		Connection conn = null;
		PreparedStatement stmt = null;
		//ResultSet rs = null;
		int count;
		try {
			conn = DBHelper.getConnection();
			String sql = "delete from java_dxt where java_dxt_id=?;"; // SQL语句
			stmt = conn.prepareStatement(sql);		
			stmt.setInt(1, java_dxt_id);
			count=stmt.executeUpdate();
			System.out.println(count+"删除单选题");
			if (count ==1) {
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
		public ArrayList<Java_dxt> getViewList(String list)
		{
			System.out.println("dxtlist:"+list);
			ArrayList<Java_dxt> stlist = new ArrayList<Java_dxt>();
			//int iCount=5; //每次返回前五条记录
			if(list!=null&&list.length()>0)
			{
			    String[] arr = list.split("#");
			    System.out.println("arr.length="+arr.length);
			    for(int i=arr.length-1;i>=0;i--)
			       {if(arr[i]!=null&&getJava_dxtById(Integer.parseInt(arr[i]))!=null){
			    	  stlist.add(getJava_dxtById(Integer.parseInt(arr[i])));  
			       }}
			    /*//如果试题记录大于等于5条  限制试题数量的做法
			    if(arr.length>=5)
			    {
			       for(int i=arr.length-1;i>=arr.length-iCount;i--)
			       {
			    	  stlist.add(getJava_dxtById(Integer.parseInt(arr[i])));  
			       }
			    }
			    else
			    {
			    	for(int i=arr.length-1;i>=0;i--)
			    	{
			    		stlist.add(getJava_dxtById(Integer.parseInt(arr[i])));
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
