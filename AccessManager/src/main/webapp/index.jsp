<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
 <base href="">
    <title>登录页面</title>
    <meta charset="utf-8">
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	
</head>
<body >
	<div style="background-color: #6F71C9; ">
	
	<form action="front/login.do" method="post" style="text-align: center; margin: 180px auto 0 auto; width: 360px; padding: 20px 0 0 0;">
	<p style="text-align: center;font-family: cursive; font-size: 25px;">权限管理系统后台管理</p>
		<table style="padding-left: 60px">
			<tr>
				<td>用户名：</td>
				<td><input type="text" name="userName" value=""  style="border: 1px  solid  blue; border-radius:3px;" required="required" autofocus="autofocus" /></td>
			</tr>
			<tr>
				<td>密&nbsp;码：</td>
				<td><input type="password" name="password" value=""   style="border: 1px  solid  blue; border-radius:3px;" required="required"/></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="登  录"  style="background-color: gray; border: 0; width: 80px; font-size: 16px ;margin-top: 10px"/></td>
			</tr>
		</table>
		<div class="input-group">
		<!--   显示登陆出错信息 -->
		<p  style="text-align: center; color: red; padding-bottom: 20px ; ">${errorMsg}</p>
		</div>
	</form>
	
	</div>
</body>
</html>