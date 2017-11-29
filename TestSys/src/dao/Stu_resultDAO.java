package dao;

import java.util.ArrayList;

public interface Stu_resultDAO {
	// ��ȡ���е�ѧ���ύ�Ŀ�����Ϣ
	ArrayList<Object> getAllStu_result();

	// ����ѧ������𰸱�Ż��ѧ��������ϸ��Ϣ
	Object getStu_resultById(int stu_r_id);

	// ����ѧ�������ύ�Ĵ�
	boolean addStu_result(Object stu_result);

	// �޸�ѧ�������ύ�Ĵ�
	boolean updateStu_result(Object stu_result);

	// ɾ��ѧ�������ύ�Ĵ�
	boolean deleteStu_result(int stu_r_id);
}
