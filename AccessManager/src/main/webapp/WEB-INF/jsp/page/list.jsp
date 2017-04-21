<%@page import="com.yc.weixin.util.WeixinbasicKey"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML>
<html>
 	<head>
 		<base href="<%=WeixinbasicKey.APPNAME%>">
	   	<meta charset="utf-8">
	   	<META HTTP-EQUIV="Cache-Control" CONTENT="no-cache"> 
	   	<title>丹江口职业技术学校后台管理</title>
	   	<link rel="shortcut icon " type="images/x-icon" href="images/logo.png">
		<script type="text/javascript" src="js/jquery-1.10.2.min.js"></script>
	   	<link rel="stylesheet" type="text/css" href="easyui/css/easyui.css">
		<link rel="stylesheet" type="text/css" href="easyui/css/icon.css">
		<link rel="stylesheet" type="text/css" href="easyui/css/demo.css">
		<script type="text/javascript" src="easyui/js/jquery.easyui.min.js"></script>
		<script type="text/javascript" src="easyui/js/datagrid-detailview.js"></script>
		<script type="text/javascript" src="easyui/js/easyui-lang-zh_CN.js"></script>
		<script type="text/javascript" src="js/ajaxfileupload.js"></script>
		<script type="text/javascript" charset="utf-8" src="ueditor/ueditor.config.js"></script>
		<script type="text/javascript" charset="utf-8" src="ueditor/ueditor.all.min.js"> </script>
		<script type="text/javascript" charset="utf-8" src="ueditor/lang/zh-cn/zh-cn.js"></script>
		<script type="text/javascript" >
		$(function() {  
	        $.ajax({  
	            type : 'POST',  
	            dataType : "json",  
	            url : 'list/Roles.do',  
	            success : function(data) {  
	            	 $.each(data, function(i, n) {//加载父类节点即一级菜单  
		                    	 $('#accordions').accordion('add', {  
			                            title : n.fname,  
			                            selected : false,  
			                            content : '<div style="padding:10px"><ul name="'+n.fname+'"></ul></div>',  
			                        });  
		                    } );
	            	 $('#accordions').accordion('add', {  
                         selected : true,  
                         content : '<div ></div>',  
                     });     
	            }
	        });
	        /****以上加载一级目录 ****/
	        $('#accordions').accordion({
	            onSelect: function(title,index){
	            	alert(title);
	            	if(title==""||title==undefined ){
	            	}else{
	            		try {
	            			$('ul[name="'+title+'"]').tree('getRoots');
						} catch (e) {
							alert(e);
							$('ul[name="'+title+'"]').tree({
		            			method:'GET',
		            			queryParams:{rName:title},
			                    url: 'function/Functions.do',
			                    onClick: function(node){
			                		//alert(node.text); 
			                		/* 点击子节点中间区域加载刷新 */
			                		$('#center_content').panel({ 
			                			loadingMessage:'数据加载中...',
			                			 fit:true,
			                			  title: node.text,
			                			  href:node.url
			                			});  
			                	}
			                }); 
						}
	            	}
	            }
	        });
		});
		</script>
 	</head>
	<body class="easyui-layout">
		<div data-options="region:'north',border:false" style="height:60px;background:#B3DFDA;padding:10px">
		<!-- 该隐藏于用来存放登陆的用户的id再其它页面进行判断操作 -->
		<input type="hidden" id="loginIngUserID" value="${sessionScope.user.uid }"/>
		<span style="display:inline-block;text-align: center;font-family: cursive; font-size: 25px; margin-left: 300px;"><img alt="logo" src="images/logo.png" width="25px; " height="25px;">&nbsp;丹江口职业技术学校后台管理</span>
		 <span style="position: absolute;right: 20px;top: 20px;" >
			<a href="#" class="easyui-linkbutton" style="color: black;" data-options="plain:true,disabled:true">管理员:${sessionScope.user.uname }</a>
			<a href="#" class="easyui-menubutton" data-options="menu:'#mm1',iconCls:'icon-edit'">功能</a>
		</span>
		<div id="mm1" style="width:150px;">
		<div data-options="iconCls:'icon-undo'" onclick="loginOut()">安全退出</div>
		</div>
		</div>
		<div data-options="region:'west',split:true,title:'菜单'" style="width:150px;">
				<div id="accordions" >
			</div>
		</div>
		<div data-options="region:'east',split:true,collapsed:true,title:'工具'" style="width:100px;padding:10px;">
		</div>
		<div data-options="region:'south',border:false" style="height:50px;background:#A9FACD;">
					<p style="text-align: center ;">&copy;版权所有：源辰信息有限公司</p>
		</div>
		<div id="center_content" data-options="region:'center',title:'首页'">
				<!-- 这是显示内容的区域 -->
				<div class="easyui-calendar" style="width:475px;height:300px;float: left;"></div>
				<div style="float: left; margin: 20px;">
                            <label>关注人数:</label><b>${attentionPelple}</b>
				</div>
				<div style=" float: left; border: 1px solid blue; padding: 10px; margin: 10px;">
							<p>使用说明：</p>
							<p>1、安全权限管理的使用，步骤如下</p>
							<p>1):首先添加一个用户，设置好密码和用户名；</p>
							<p>2):在点击角色管理添加角色并且选择好该角色拥有的权限；</p>
							<p>3):点击用户授权，选中添加的用户，然后在弹出的界面下拉框中选择好角色就完成了整个授权的过程;</p>
							<p>4):菜单管理，使用来对左侧功能的显示以及显示名称的修改，一般是不使用的，里面对应的路径也</p>
							<p>   &nbsp;&nbsp;不要随意修改，谢谢配合;</p>
							<p>2、微信后台管理的使用，步骤如下</p>
							<p>1):关注信息：给第一次关注该微信公众号小伙伴推送一条学校简介，管理只能对它进行修改操作;</p>
							<p>2):分类管理：只能对已经存在的数据进行修改，只能修改图片，它和微信公众号的菜单是绑定的;</p>
							<p>3):新闻中心：添加（需要审核）、修改、删除（可以在回收站撤销删除，然后需要审核才能再一</p>
							<p> &nbsp;&nbsp;次在微信显示）;</p>
							<p>4):在线报名：选中要导出信息，点击导出，等待下载excel按钮启用，才可以点击下载表格</p>
							<p>5):用户信息：查看关注该微信公众号的人员信息</p>
							<p>6):新闻回收站：撤销删除操作（需要再新闻中心对该条信息进行审核，才能再一次在微信显示）</p>
				</div>
		</div>
	</body>
	<script type="text/javascript">
	function loginOut(){
		$.get("front/loginOut.do",{},function(data){
			if(data){
				location.href='index.jsp';
			}
		},"json");
	}
	</script>
</html>
