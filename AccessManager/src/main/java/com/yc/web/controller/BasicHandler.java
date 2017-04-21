package com.yc.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
/**
 * 权限控制基类，没有找到的.do操作都进入404
 * @author shuang
 *Created by shuang on 2016/11/20. 
 */
@Controller
@RequestMapping(value={"/**"})
public class BasicHandler {
		private static String  URL="404";
		
		@RequestMapping("/**")
		public String error404(){
			return URL;
		}
}
