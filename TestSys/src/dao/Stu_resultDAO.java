package dao;

import java.util.ArrayList;

public interface Stu_resultDAO {
	// 获取所有的学生提交的考卷信息
	ArrayList<Object> getAllStu_result();

	// 根据学生考卷答案编号获得学生答卷的详细信息
	Object getStu_resultById(int stu_r_id);

	// 插入学生考试提交的答案
	boolean addStu_result(Object stu_result);

	// 修改学生考试提交的答案
	boolean updateStu_result(Object stu_result);

	// 删除学生考试提交的答案
	boolean deleteStu_result(int stu_r_id);
}
