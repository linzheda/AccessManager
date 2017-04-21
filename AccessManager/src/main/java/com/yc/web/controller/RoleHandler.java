package com.yc.web.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.yc.bean.Role;
import com.yc.bean.TempPage;
import com.yc.bean.User;
import com.yc.biz.Roleservice;

/**
 * 对角色操作的控制器
 * @author shuang
 *Created by shuang on 2016/11/20.
 */
@Controller
@RequestMapping("/list")
@SessionAttributes("user")
public class RoleHandler extends TreeHandler{
	
	@Resource(name="roleBizImpl")
	private Roleservice roleservice;
	/**
	 * 根据用户id查找他创建的角色
	 * @param user ：登陆的用户
	 * @param model
	 * @return
	 */
	@RequestMapping("/Roles.do")
	@ResponseBody
	public List<Role> Roles(User user, Model model) {
		List<Role> roles=roleservice.findTwoFunctionById(user.getId());		
		return roles;		
	}
	/**
	 * 分页查找角色信息
	 * @param page
	 * @param rows
	 * @return
	 */
	@RequestMapping("/findRolesByPages.do")
	@ResponseBody
	public TempPage<Role> findRolesByPages(int page, int rows){
		TempPage<Role>result= roleservice.findRolesByPages((page-1)*rows,rows);
		if(result==null){
			result=new TempPage<Role>();
			result.setTotal(0);
			result.setRows(new ArrayList<Role>());
		}
		return result;
	}
	/**
	 * 根据角色id删除角色
	 * @param rid
	 * @return
	 */
	@RequestMapping("/delRole.do")
	@ResponseBody
	public int delRole(int rid){
		return roleservice.deleteRoleById(rid);
	}
	/**
	 * 增加角色，以及添加对于功能
	 * @param user
	 * @param fids
	 * @param rname
	 * @return
	 */
	@RequestMapping("/addRole.do")
	@ResponseBody
	public boolean addRole(User user,String fids,String rname){
		boolean result1= roleservice.addRole(fids,rname,user.getId());
		return result1;
	}
	/**
	 * 查询用户拥有的角色
	 * @param user
	 * @return
	 */
	@RequestMapping("/selRoles.do")
	@ResponseBody
	public List<Role> selRoles(User user){
		List<Role> result=roleservice.selRoles(user.getId());
		if(result==null){
			return new ArrayList<Role>();
		}
		return result;
	}

}
