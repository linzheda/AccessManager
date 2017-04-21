package com.yc.biz.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yc.bean.TempPage;
import com.yc.bean.User;
import com.yc.biz.Userservice;
import com.yc.dao.BaseDao;


/**
 * 用户业务
 * @author lzd
 * Created by shuang on 2016/11/20.
 */
@Service
public class UserBizImpl implements Userservice {

	private BaseDao baseDao;

	@Resource(name = "baseDaoImpl")
	public void setBaseDao(BaseDao baseDao) {
		this.baseDao = baseDao;
	}

	@Override
	public User getUser(String name, String pwd) {
		User user=new User();
		user.setUserName(name);
		user.setPassword(pwd);
		List<User> list=this.baseDao.findAll(user, "login");
		return 	list.get(0);
	}

	@Override
	public int save(User user) {
		int i=this.baseDao.add(user, "save");
		return i;
	}

	@Override
	public int deleteById(int uid) {
		User user=new User();
		user.setId(uid);
		int result=this.baseDao.delete(user, "deleteById");
		return result;
	}

	@Override
	public int update(User user) {
		int result=this.baseDao.update(user, "update");
		return result;
	}

	@Override
	public User fingById(int uid) {
		User user=new User();
		user.setId(uid);
		List<User>list=this.baseDao.findAll(user, "findById");
		return list.get(0);
	}

	@Override
	public TempPage<User> findPage(int page,int size) {
		Map<String,Integer>map=new HashMap<String,Integer>();
		map.put("oage", page);
		map.put("size", size);
		List<TempPage>list=this.baseDao.findAll(new User(), map, "findPage");
		return list.get(0);
	}



}
