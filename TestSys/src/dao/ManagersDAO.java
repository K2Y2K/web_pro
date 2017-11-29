package dao;

import java.util.ArrayList;

import entity.Managers;

public interface ManagersDAO {
	ArrayList<Managers> getAllManagers() ;

	// ���ݵ�ѡ���Ż�õ�ѡ��
	Managers getManagersById(int m_id) ;

	// ���ݵ�ѡ���ô�����
	int getManagers_idByManagers(Managers managers);

	// ���뵥ѡ�⼯
    boolean addManagers(Managers managers);

	// �޸ĵ�ѡ�⼯
    boolean updateManagers(Managers managers) ;

	// ɾ����ѡ�⼯
	boolean deleteManagers(int m_id);
	//�ж��û��Ƿ����
	boolean usersLogin(Managers manager);
}