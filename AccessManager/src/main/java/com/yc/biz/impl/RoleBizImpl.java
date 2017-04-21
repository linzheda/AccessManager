package com.yc.biz.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yc.bean.Role;
import com.yc.bean.RoleFunction;
import com.yc.bean.TempPage;
import com.yc.bean.UserRole;
import com.yc.biz.RoleFunctionservice;
import com.yc.biz.Roleservice;
import com.yc.biz.UserRoleservice;
import com.yc.dao.BaseDao;


/**
 * 角色业务
 * @author shuang
 * Created by shuang on 2016/11/20.
 */
@Service
public class RoleBizImpl implements Roleservice {
	private BaseDao baseDao;

	@Resource(name = "baseDaoImpl")
	public void setBaseDao(BaseDao baseDao) {
		this.baseDao = baseDao;
	}
	
	@Resource(name="roleFunctionBizImpl")
	private RoleFunctionservice roleFunctionservice;
	
	@Resource(name="userRoleBizImpl")
	private UserRoleservice userRoleservice;
	@Override
	public List<Role> findTwoFunctionById(int uid) {
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("uid", uid);
		return this.baseDao.findAll(new Role(), map,"findTwoFunctionById");
	}

	@Override
	public int saveRole(Role role) {
		return this.baseDao.add(role, "saveRole");
	}

	@Override
	public int deleteRoleById(int rid) {
		Role role=new Role();
		role.setRid(rid);
		return this.baseDao.delete(role, "deleteRoleById");
	}

	@Override
	public int updateRole(Role role) {
		return this.baseDao.update(role, "updateRole");
	}

	@Override
	public TempPage<Role> findRolesByPages(int page, int size) {
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("page", page);
		map.put("size", size);
		List<TempPage<Role>> list=this.baseDao.findAll(new Role(), map,"findRolesByPages");
		return list.get(0);
	}

	/**
	 * 注意这里要做事务处理
	 * @param fids，功能id字符串数组
	 * @param rname：功能名
	 * @param uid:登陆的用户的id
	 * @return
	 */
	@Override
	public boolean addRole(String fids, String rname,int uid) {
		Role role = new Role(rname);
		int result = 0;
		try {//捕获插入相同用户名的异常
			result = this.baseDao.add(role, "saveRole");
		} catch (Exception e) {
				e.printStackTrace();
				return false;
		}
		if(result>0){
			UserRole userRole = new UserRole(role.getRid(),uid);
			//用户创建角色，则保证这个角色属于这个用户，所以用户角色表需要添加相关记录
			boolean result2 = userRoleservice.saveUserRole(userRole);
			if(result2){
				List<RoleFunction> list=new ArrayList<RoleFunction>();
				int role_id = role.getRid();
				RoleFunction roleFunction=null;
				String[] strs = fids.split(",");
				int j=strs.length;
				for(int i=0;i<j;i++){
					roleFunction=new RoleFunction(role_id,Integer.parseInt( strs[i]));
					list.add(roleFunction);
				}
				//创建角色同时必须赋予角色功能（权限）信息，否则角色是没有权限
			    int result3 = roleFunctionservice.saveRoleFunction(list);
				if(j==result3){
					return true;
				}
			}
		}
		return false;
	}

	@Override
	public List<Role> selRoles(int uid) {
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("uid", uid);
		return this.baseDao.findAll(new Role(),map, "selRoles");
	}

}
