package com.yc.web.controller;

import java.util.ArrayList;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.yc.bean.TempPage;
import com.yc.bean.User;
import com.yc.biz.Userservice;
import com.yc.util.SessionAttributeKey;


/**
 * 对用户操作的控制器
 * @author shuang
 * Created by shuang on 2016/11/20.
 */
@Controller
@RequestMapping("/front")
@SessionAttributes("user")
public class UserHandler extends TreeHandler{
	
	@Resource(name="userBizImpl")
	private Userservice userservice;
	//@Resource(name="weixinUserInfoService")
	//private WeixinUserInfoService weixinUserInfoService;
	//验证登入
	@RequestMapping("/login.do")
	public String Login(User user, Model model) {
		if(user.getUserName()==null&&user.getPassword()==null){
			model.addAttribute("errorMsg", "用户名或密码不能为空...");
			return "index";
		}
			user = userservice.getUser(user.getUserName(), user.getPassword());
			if (user!=null) {
				//查询微信关注公众号的人数
				model.addAttribute("attentionPelple","90");
				model.addAttribute(SessionAttributeKey.LOGIN_ADMIN, user);
				return "adminMain";
			} else {
				model.addAttribute("errorMsg", "用户名或密码错误...");
				return "index";
			}
	}
	
	//获取分页信息
	@RequestMapping("/findUser.do")
	@ResponseBody
	public TempPage<User> findUser(int page,int rows) {
		TempPage<User> users = userservice.findPage((page-1)*rows,rows);
		if(users==null){
			users=new TempPage<User>();
			users.setRows(new ArrayList<User>());
			users.setTotal(0);
		}
		return users;	
	}
	
	//添加数据
	@RequestMapping("/addUser.do")
	@ResponseBody
	public int addUser(String userName,String password) {
		User user=new User();
		user.setUserName(userName);
		user.setPassword(password);
		int result = userservice.save(user);
		return result;	
	}
	
	//删除数据
	@ResponseBody
	@RequestMapping("/removeUser.do")
	public int removeUser(int id){
		//System.out.println("要删除的id"+uid);
		int result=userservice.deleteById(id);
		return result;
	}
	
	//修改数据
	@ResponseBody
	@RequestMapping(value= "/updateUser.do",method=RequestMethod.POST)
	public int updataUser(int id,String userName,String password) {
		User user=new User(id,userName,password);
		int result=userservice.update(user);
		return result;
	}
	
	//获取某一个用户
	@ResponseBody
	@RequestMapping(value= "/fingById",method=RequestMethod.POST)
	public User fingById(int id) {
		User user=userservice.fingById(id);
		return user;
	}
	
}
