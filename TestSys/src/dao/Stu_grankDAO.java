package dao;

import java.util.ArrayList;

public interface Stu_grankDAO {
	// ��ȡ���е�ѧ���ɼ�����
	ArrayList<Object> getAllStu_grank();

	// ����ѧ��������¼��Ż��ѧ����ϸ������Ϣ
	Object getStu_grankById(int stu_gr_id);

	// ����ѧ���ɼ�������Ϣ
	boolean addStu_grank(Object stu_grank);

	// �޸�ѧ���ɼ�������Ϣ
	boolean updateStu_grank(Object stu_grank);

	// ɾ��ѧ���ɼ�������Ϣ
	boolean deleteStu_grank(int stu_gr_id);
}
