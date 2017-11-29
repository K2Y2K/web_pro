package dao;


import java.util.ArrayList;

public interface Java_stDAO {
	ArrayList<Object> getAllJava_st() ;

	// 根据单选题编号获得单选题
	Object getJava_stById(int java_dxt_id) ;

	// 根据单选题获得储存编号
	int getJava_st_idByJava_st(Object j_dxt);

	// 插入单选题集
    boolean addJava_st(Object j_dxt);

	// 修改单选题集
    boolean updateJava_st(Object j_dxt) ;

	// 删除单选题集
	boolean deleteJava_st(int java_dxt_id);

}
