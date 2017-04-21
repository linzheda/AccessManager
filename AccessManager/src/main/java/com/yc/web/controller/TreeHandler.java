package com.yc.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
/**
 * 用来处理点击左子树跳转的url
 * @author shuang
 *Created by shuang on 2016/11/20.
 */
@Controller
public class TreeHandler {
	
	@RequestMapping("/{url}.do{arg}")
	public String userGrid(@PathVariable String url,String _){
		//System.out.println("自动匹配请求地址"+url);
		if(url==""||url==null){
			return "404";
		}
		return "page/"+url+".jsp?_="+_;
	}
}
