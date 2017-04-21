package com.yc.biz;


import java.util.List;

import org.springframework.stereotype.Repository;

import com.yc.bean.Function;
import com.yc.bean.FunctionTree;
import com.yc.bean.TempPage;
import com.yc.bean.User;
/**
 * 功能接口
 * @author shuang
 * Created by shuang on 2016/11/20.
 */
@Repository
public interface Functionservice{
	/**
     * 根据rname去查找功能子节点
     * 根据uid去查找功能
     * @param rName
     * @param uid
     * @return
     */
    List<Function> findnextFunction(String rName,int uid);
    
    /**
     * 根据id更新function
     * @param function
     */
    int update(Function function);
       
    /**
     * 根据id删除function
     * @param id
     */
    int deleteById(int fid);
    
    /**
     * 根据角色获取所拥有的功能树
     * @param user
     * @return
     */
	FunctionTree functionTree(User user);
	
	/**
	 * 更新功能树
	 * @param user
	 * @param rid
	 * @return
	 */
	FunctionTree updateFunctionTree(User user, int rid);
	
	/**
	 * 根据父节点分页查询功能
	 * @param parent_id
	 * @param page
	 * @param rows
	 * @return
	 */
	TempPage<Function> findFunctionByPages(int parent_id,int page, int rows);
	
	/**
	 * 批量更新功能信息
	 * @param list
	 * @return
	 */
	int updateFunction(List<Function> list);
 
}
