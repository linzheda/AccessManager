package com.yc.web.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yc.biz.RoleFunctionservice;


/**
 * Copy Right Information : yuanchen
 * Project : Limits 
 * JDK version used : jdk1.7
 * Description :  角色功能表的操作
 * Comments Name : RoleFunctionHandler
 * author ：shuang
 * date ：2016年11月23日
 * version : 1.00 
 */

@Controller
@RequestMapping("/roleFunction")
public class RoleFunctionHandler {
			
	@Resource(name="roleFunctionBizImpl")
	private RoleFunctionservice roleFunctionservice;
	
	/**
	 * 修改角色的权限功能，（想法是先删除原有的权限再进行添加）
	 * @param rid：角色id
	 * @param fids功能id字符串数组
	 * @return
	 */
	@RequestMapping("/updateRoleGrant.do")
	@ResponseBody
	public boolean updateRoleGrant(int rid ,String fids){
		return roleFunctionservice.updateRoleGrant(rid,fids);
	}
	
}


