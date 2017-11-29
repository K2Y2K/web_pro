package dao;

import java.util.ArrayList;

public interface Stu_grankDAO {
	// 获取所有的学生成绩排名
	ArrayList<Object> getAllStu_grank();

	// 根据学生排名记录编号获得学生详细排名信息
	Object getStu_grankById(int stu_gr_id);

	// 插入学生成绩排名信息
	boolean addStu_grank(Object stu_grank);

	// 修改学生成绩排名信息
	boolean updateStu_grank(Object stu_grank);

	// 删除学生成绩排名信息
	boolean deleteStu_grank(int stu_gr_id);
}
