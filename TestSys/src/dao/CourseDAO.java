package dao;

import java.util.ArrayList;

public interface CourseDAO {
	//��ȡ���еĿ�Ŀ��Ϣ
		ArrayList<Object> getAllCourse() ;
		// ���ݿ�Ŀ��Ż�ÿ�Ŀ��Ϣ
		Object getCourseById(int kj_id) ;
		// �����Ŀ
	    boolean addCourse(Object kj);

		// �޸Ŀ�Ŀ
	    boolean updateCourse(Object kj) ;

		// ɾ����Ŀ
		boolean deleteCourse(int kj_id);
}
