package dao;


import java.util.ArrayList;

public interface Java_stDAO {
	ArrayList<Object> getAllJava_st() ;

	// ���ݵ�ѡ���Ż�õ�ѡ��
	Object getJava_stById(int java_dxt_id) ;

	// ���ݵ�ѡ���ô�����
	int getJava_st_idByJava_st(Object j_dxt);

	// ���뵥ѡ�⼯
    boolean addJava_st(Object j_dxt);

	// �޸ĵ�ѡ�⼯
    boolean updateJava_st(Object j_dxt) ;

	// ɾ����ѡ�⼯
	boolean deleteJava_st(int java_dxt_id);

}
