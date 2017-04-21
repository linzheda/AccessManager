<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path=request.getContextPath();
	String basePath=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%> 
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>衡阳源辰信息科技有限公司财务系统</title>

<link rel="shortcut icon" href="image/yclogo.png">
<link rel="stylesheet" type="text/css" href="easyui/css/easyui.css">
<link rel="stylesheet" type="text/css" href="easyui/css/icon.css">
<link rel="stylesheet" type="text/css" href="easyui/css/demo.css">
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="easyui/js/jquery.easyui.min.js"></script>
<script type="text/javascript" src="easyui/js/datagrid-detailview.js"></script>
<script type="text/javascript" src="easyui/js/easyui-lang-zh_CN.js"></script>
<script language="javascript" type="text/javascript"
	src="datetool/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript" charset="utf-8"
	src="ueditor/ueditor.config.js"></script>
<script type="text/javascript" charset="utf-8"
	src="ueditor/ueditor.all.min.js"> </script>
<script type="text/javascript" src="js/ajaxfileupload.js"></script>


