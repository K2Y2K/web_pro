package dao;

import java.util.ArrayList;

import entity.Managers;

public interface ManagersDAO {
	ArrayList<Managers> getAllManagers() ;

	// 根据单选题编号获得单选题
	Managers getManagersById(int m_id) ;

	// 根据单选题获得储存编号
	int getManagers_idByManagers(Managers managers);

	// 插入单选题集
    boolean addManagers(Managers managers);

	// 修改单选题集
    boolean updateManagers(Managers managers) ;

	// 删除单选题集
	boolean deleteManagers(int m_id);
	//判断用户是否存在
	boolean usersLogin(Managers manager);
}