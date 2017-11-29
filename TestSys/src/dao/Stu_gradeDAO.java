package dao;

import java.util.ArrayList;

public interface Stu_gradeDAO {
	// 获取所有的学生成绩
	ArrayList<Object> getAllStu_grade();

	// 根据学生成绩编号获得学生成绩信息
	Object getStu_gradeById(int stu_g_id);

	// 插入学生成绩记录
	boolean addStu_grade(Object stu_grade);

	// 修改学生成绩记录
	boolean updateStu_grade(Object stu_grade);

	// 删除学生成绩记录
	boolean deleteStu_grade(int stu_g_id);
	 ArrayList<Object> getStu_gradeBySid(int sid) ;
}
