package com.yc.web.controller;



import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class AccessController {

	//访问了easyui界面
	@RequestMapping(value="toLogin.action")
	public String toMain() {
		return "adminMain";
	}
	//访问了yc界面
	@RequestMapping(value="toyc.action")
	public String toyc() {
		return "yc";
	}
	//访问了用户管理
	@RequestMapping(value="toUserGrid.action")
	public String toUserGrid() {
		return "page/userGrid";
	}
	//访问了角色管理
	@RequestMapping(value="toRoleGrid.action")
	public String toRoleGrid() {
		return "page/roleGrid";
	}
	//访问菜单管理
	@RequestMapping(value="toMenuManager.action")
	public String toMenuManager() {
		return "page/functionGrid";
	}

	//访问了用户授权toUserGrant.action
	@RequestMapping(value="toUserGrant.action")
	public String toUserGrant() {
		return "page/userGrant";
	}




}
