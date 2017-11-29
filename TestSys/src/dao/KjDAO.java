package dao;

import java.util.ArrayList;

public interface KjDAO {
	//获取所有的试卷信息
	ArrayList<Object> getAllKj() ;
	// 根据考卷编号获得考卷
	Object getKtById(int kj_id) ;
	// 插入单选题集
    boolean addKj(Object kj);
	// 修改考试试卷
    boolean updateKj(Object kj) ;
	// 删除考试试卷
	boolean deleteKj(int kj_id);
}
