package dao;

import java.util.ArrayList;

public interface KjDAO {
	//��ȡ���е��Ծ���Ϣ
	ArrayList<Object> getAllKj() ;
	// ���ݿ����Ż�ÿ���
	Object getKtById(int kj_id) ;
	// ���뵥ѡ�⼯
    boolean addKj(Object kj);
	// �޸Ŀ����Ծ�
    boolean updateKj(Object kj) ;
	// ɾ�������Ծ�
	boolean deleteKj(int kj_id);
}
