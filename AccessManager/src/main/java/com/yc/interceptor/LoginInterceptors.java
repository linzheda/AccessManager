package com.yc.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.HttpRequest;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.yc.util.SessionAttributeKey;

/**
 * 拦截器
 * @author shuang
 * Created by shuang on 2016/11/20.
 */
public class LoginInterceptors implements HandlerInterceptor {
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response,
			Object arg2) throws Exception {
		if(request.getSession().getAttribute(SessionAttributeKey.LOGIN_ADMIN)==null){
			System.out.println(1);
			String path=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath();
			response.getWriter().print("<script>location.href='"+path+"/index.jsp'</script>");
			return false;
		}
		if(request.getRequestURI().contains("front/loginOut.do")){
			request.getSession().removeAttribute(SessionAttributeKey.LOGIN_ADMIN);
			response.getWriter().print(true);
			return false;
		}
		return true;
	}

	@Override
	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1,
			Object arg2, ModelAndView arg3) throws Exception {

	}

	@Override
	public void afterCompletion(HttpServletRequest arg0,
			HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {

	}
}
