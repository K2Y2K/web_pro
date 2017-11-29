package dao;

import java.util.ArrayList;

public interface CourseDAO {
	//获取所有的科目信息
		ArrayList<Object> getAllCourse() ;
		// 根据科目编号获得科目信息
		Object getCourseById(int kj_id) ;
		// 插入科目
	    boolean addCourse(Object kj);

		// 修改科目
	    boolean updateCourse(Object kj) ;

		// 删除科目
		boolean deleteCourse(int kj_id);
}
