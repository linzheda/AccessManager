package com.yc.web.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.JavaType;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.yc.bean.Function;
import com.yc.bean.FunctionTree;
import com.yc.bean.TempPage;
import com.yc.bean.User;
import com.yc.biz.Functionservice;

/**
 * 对功能操作的控制器
 * @author shuang
 *Created by shuang on 2016/11/20.
 */
@Controller
@RequestMapping("/function")
@SessionAttributes("user")
public class FunctionHandler extends TreeHandler{
	
	@Resource(name="functionBizImpl")
	private Functionservice functionservice;
	
	
	/**
	 * 根据rname去查找功能子节点 根据uid去查找所拥有的功能
	 * @param user：登陆用户信息
	 * @param rName：角色名
	 * @param model
	 * @return
	 */
	@RequestMapping("/Functions.do")
	@ResponseBody
	public List<Function> Functions(User user,String rName, Model model) {
		System.out.println("点击的节点是"+rName);
		List<Function> functions=functionservice.findnextFunction(rName,user.getId());	
		return functions;		
	}
	/**
	 * 查找用户权限下拥有的功能树
	 * @param user
	 * @return
	 */
	@RequestMapping("/functionTree.do")
	@ResponseBody
	public List<FunctionTree> functionTree(User user){
		return functionservice.functionTree(user).getChildren() ;
	}
	/**
	 * 获取指定角色id拥有的属性，用于修改用户权限
	 * @param uid
	 * @return
	 */
	@RequestMapping("/updateFunctionTree.do")
	@ResponseBody
	public List<FunctionTree> updateFunctionTree(User user,int rid){
	
		return functionservice.updateFunctionTree(user,rid).getChildren() ;
	}
	
	/**
	 * 获取指定角色id拥有的属性，用于修改用户权限
	 * @param uid
	 * @return
	 */
	@RequestMapping("/selAllFunctionTree.do")
	@ResponseBody
	public List<FunctionTree> selAllFunctionTree(User user){
		List<FunctionTree> list=new ArrayList<FunctionTree>();
		list.add(functionservice.functionTree(user));		
		return list;
		
	}
	/**
	 * 分页获取指定功能菜单的子菜单
	 * @param page
	 * @param rows
	 * @return
	 */
	@RequestMapping("/findFunctionByPages.do")
	@ResponseBody
	public  TempPage<Function> findFunctionByPages(int parent_id ,int page,int rows){
		
		return functionservice.findFunctionByPages(parent_id,(page-1)*rows,rows);
	}
	/**
	 * 批量更新功能信息
	 * @param list
	 * @return
	 */
	@RequestMapping("/updateFunction.do")
	@ResponseBody
	public boolean updateFunction(String  functions ){
	        try {
	        	 ObjectMapper objectMapper = new ObjectMapper();  
	 	        JavaType javaType = objectMapper.getTypeFactory().constructParametricType(List.class, Function.class);  
				List<Function> list = objectMapper.readValue(functions, javaType);
				if(functionservice.updateFunction(list)>0){
					return true;
				}
			} catch (JsonParseException e) {
				e.printStackTrace();
			} catch (JsonMappingException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}  
		return false;
	}
}
