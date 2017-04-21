
package com.yc.biz.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.yc.bean.Function;
import com.yc.bean.FunctionTree;
import com.yc.bean.TempPage;
import com.yc.bean.User;
import com.yc.biz.Functionservice;
import com.yc.dao.BaseDao;

/**
 * 功能业务
 * @author lzd
 * 
 * Created by shuang on 2016/11/20.
 */
@Service
public class FunctionBizImpl implements Functionservice {
	
	private BaseDao baseDao;

	@Resource(name = "baseDaoImpl")
	public void setBaseDao(BaseDao baseDao) {
		this.baseDao = baseDao;
	}
	
	@Override
	public List<Function> findnextFunction(String rName,int uid) {
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("rName", rName);
		map.put("uid", uid);
		List<Function> list=this.baseDao.findAll(new Function(), map,"findnextFunction");
		return list;
	}
	@Override
	public int update(Function function) {
		int result=this.baseDao.update(function, "update");
		return result;
	}

	@Override
	public int deleteById(int fid) {
		Function function=new Function();
		function.setFid(fid);
		int result=this.baseDao.delete(function, "deleteById");
		return result;
	}

	@Override
	public FunctionTree functionTree(User user) {
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("uid", user.getId());
		List<FunctionTree> list=this.baseDao.findAll(new Function(),map, "functionTree");
		return list.get(0);
	}
	@Override
	public FunctionTree updateFunctionTree(User user, int rid) {
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("uid", user.getId());
		map.put("rid", rid);
		List<FunctionTree>list=this.baseDao.findAll(new Function(),map, "updateFunctionTree");
		return list.get(0);
	}
	@Override
	public TempPage<Function> findFunctionByPages(int parent_id,int page, int rows) {
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("parent_id", parent_id);
		map.put("page", page);
		map.put("rows", rows);
		List<TempPage>list=this.baseDao.findAll(new Function(),map, "findFunctionByPages");
		return list.get(0);
	}

	@Override
	public int updateFunction(List<Function> list) {
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("list", list);
		int result=this.baseDao.update(new Function(), map,"updateFunction");
		return result;
	}

}
