package dao;

import java.util.ArrayList;

public interface Stu_gradeDAO {
	// ��ȡ���е�ѧ���ɼ�
	ArrayList<Object> getAllStu_grade();

	// ����ѧ���ɼ���Ż��ѧ���ɼ���Ϣ
	Object getStu_gradeById(int stu_g_id);

	// ����ѧ���ɼ���¼
	boolean addStu_grade(Object stu_grade);

	// �޸�ѧ���ɼ���¼
	boolean updateStu_grade(Object stu_grade);

	// ɾ��ѧ���ɼ���¼
	boolean deleteStu_grade(int stu_g_id);
	 ArrayList<Object> getStu_gradeBySid(int sid) ;
}
