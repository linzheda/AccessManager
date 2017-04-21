package com.yc.biz;
import org.springframework.stereotype.Repository;

import com.yc.bean.TempPage;
import com.yc.bean.User;

/**
 * 用户接口
 * @author shuang
 * Created by shuang on 2016/11/20.
 */
@Repository
public interface Userservice{
	
	/**
	 * 根据用户名密码查询用户，用于登录
	 * @param name
	 * @param pwd
	 * @return
	 */
	User getUser(String name , String pwd);
	
	/**
	 * 添加用户
	 * @param user
	 * @return
	 */
	int save(User user);
	
	/**
	 * 删除
	 * @param id
	 */
	int deleteById(int uid);
	
	/**
	 * 更新
	 * @param user
	 */
	int update(User user);
	
	/**
	 * 查找
	 * @param id
	 * @return
	 */
	User fingById(int id);
	
	/**
	 * 分页查询
	 * @param page
	 * @param size
	 * @return
	 */
	TempPage<User> findPage(int page,int size);
	

}
