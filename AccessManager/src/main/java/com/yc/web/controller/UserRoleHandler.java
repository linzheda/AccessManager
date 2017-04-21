package com.yc.web.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yc.bean.TempPage;
import com.yc.bean.UserRole;
import com.yc.biz.UserRoleservice;


/**
 * 对用户角色操作的控制器
 * @author shuang
 * Created by shuang on 2016/11/20.
 */
@Controller
@RequestMapping("/UserRole")
public class UserRoleHandler extends TreeHandler{
	
	@Resource(name="userRoleBizImpl")
	private UserRoleservice userRoleservice;
	
	//获取分页信息
	@RequestMapping("/findUserRole.do")
	@ResponseBody
	public TempPage<UserRole> findUserRole(int page,int rows) {
		TempPage<UserRole> userRoles = userRoleservice.findUserRoles((page-1)*rows,rows);
		//System.out.println("结果集"+userRoles);
		return userRoles;	
	}
	
	//删除数据
	@ResponseBody
	@RequestMapping("/remove.do")
	public int remove(int id){
		//System.out.println("要删除的id"+id);
		int result=userRoleservice.deleteById(id);
		return result;
	}
	
	//删除数据
		@ResponseBody
		@RequestMapping("/delRoleGrant.do")
		public boolean delRoleGrantByUid(int uid){
			//System.out.println("用户的id"+uid);
			int result=userRoleservice.delRoleGrantByUid(uid);
			if(result>0){
				return true;
			}
			return false;
		}
	//根据传来的uid获取该用户的角色信息
	@RequestMapping("/findRoleByuid.do")
	@ResponseBody
	public List<UserRole> findRoleByuid(int user_id, Model model) {
		List<UserRole> userRoles = userRoleservice.findRoleByuid(user_id);
		return userRoles;	
	}
	/**
	 * 通过角色赋予用户权限
	 * @param uid：用户Id
	 * @param rids：角色id数组
	 * @return
	 */
	@RequestMapping("/grantUserRole.do")
	@ResponseBody
	public boolean grantUserRole(int uid ,int[] rids){
		if(userRoleservice.grantUserRole(uid,rids)>0){
			return true;
		}
		return false;
		
	}
}
