<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- ----------begin------------- -->	
<table id="userData"></table>  
<!-- -----------end显示用户信息的表格------------ -->
		<div id="userGrid_bar" style="padding:5px;height:auto">
				<a href="javascript:void(0)" onclick="delUsers()" class="easyui-linkbutton" data-options="iconCls:'icon-remove',plain:true">删除</a>
				<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true" onclick="append()">添加</a>
				<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-edit',plain:true" onclick="updateUser()">修改</a>
		</div>
		<!-- 以上是自定义菜单区域 -->
	<div id="userGridwin">
				<div style="padding:10px 60px 20px 60px">
	    <form id="userform" class="easyui-form" method="post" data-options="novalidate:true" action="" >
	    	
	    	<table cellpadding="5">
	    		<tr>
	    			<td>用户名:</td>
	    			<td><input id="userName" class="easyui-textbox" type="text" name="userName" data-options="required:true"></input></td>
	    		</tr>
	    		<tr>
	    			<td>密码:</td>
	    			<td><input id="password" class="easyui-textbox" type="password" name="password" data-options="required:true"></input></td>
	    		</tr>
	    		<tr>
	    			<td>重复密码:</td>
	    			<td><input id="rpwd" class="easyui-textbox" type="password" name="rpwd" data-options="required:true"></input></td>
	    		</tr>
	    	</table>
	    	<input type="hidden" id="id" name="id"/>
	    </form>
	    <div style="text-align:center;padding:5px">
	    	<a id="userDataButton" href="javascript:void(0)" class="easyui-linkbutton" onclick="submitUserForm()">确定</a>
	    </div>
	    </div>
	</div>  
	<!-- 以上是添加用户的表单区域 -->

		<script type="text/javascript">
		/* 	实例化添加弹出框 */
		$('#userGridwin').dialog({ 
			title:"添加",
		    width:450,  
		    height:200,  
		    modal:true,
		    closed:true,
		   
		});
		/* 读取用户信息并设置到表格 */
		//var options=$('#center_content').panel('options');
		var editIndex = undefined;
		var editStatus=undefined;//用户进行的操作状态，用来区分添加还是修改
		 var userObj;
		userObj=$('#userData').datagrid({
			singleSelect:true,
			url:'front/findUser.do',
			striped:true,
			loadMsg:"正在加载中...",
			pagination:true,
			pageNumber:1,
			pageSize:50,
			pageList:[10,20,30,40,50],
			remoteSort:false,
			toolbar:"#userGrid_bar",
			columns:[[
			  		{field:'id',sortable:true,align:'center',checkbox:true},
			  		{field:'userName',title:'用户名',width:200,align:'center'},
			  		{field:'rname',title:'角色',width:180,align:'center'},
			  		{field:'registertime',title:'注册时间',width:180,align:'center'},
			  		{field:'updatetime',title:'上次修改时间',width:180,align:'center'}]]
			
		}); 
	/* 删除用户，一次只删除一个，由于后台的原因 */
		function delUsers(){
			var rows=userObj.datagrid("getSelections");
			var loginIngUserID=$("#loginIngUserID").val();
			if(rows!=undefined&&rows!=''){
				if(rows[0].id==loginIngUserID){
					$.messager.alert('失败提示','权限不足...','error');
				}else{
					$.messager.confirm('信息确认','您确定要删除选定的数据吗?', function(r){
						if (r){
							var nids="";
						for(var i=0;i<rows.length-1;i++){
							nids+=rows[i].id+",";
						}
						nids+=rows[rows.length-1].id;
						$.post("front/removeUser.do",{id:nids},function(data){
							if(data){
								$.messager.show({
									title:'成功提示',
									msg:'删除成功',
									timeout:2000,
									showType:'slide'
								});
								rows=undefined;
								$('#userData').datagrid('reload');//刷新表格
							}else{
								$.messager.alert('失败提示','删除失败','error');
							}
						});
						}
					});
				}
			}else{
				$.messager.alert('温馨提示','请选择要删除的数据...','info');
			}
		}
	/* 更新用户信息 */
		function updateUser(){
			editStatus="update";
			
			var rows=userObj.datagrid("getSelections");
			
			if(rows.length>0){
				$("#id").val(rows[0].id);
				$('#userGridwin').dialog({
					title:'修改',
					closed:false
				});
				$('#userName').textbox({
					value:rows[0].userName
				});
				$('#password').textbox({
					value:""
				});
				$('#rpwd').textbox({
					value:""
				});
				 $('#userDataButton').linkbutton({plain:true,iconCls:'icon-ok'});
				
			}else{
				$.messager.alert('提示','请选择要修改的行...','info');  
			}
		}
	
/* 	打开添加面板事件 */
		function append(){
			editStatus="add";
			$("#id").val('');
			$('#userGridwin').dialog({
				title:'添加',
				closed:false
			});
			$('#userName').textbox({
				value:""
			});
			$('#password').textbox({
				value:""
			});
			$('#rpwd').textbox({
				value:""
			});
			 $('#userDataButton').linkbutton({plain:true,iconCls:'icon-ok'});
		}
		/* 提交添加或更新用户信息表单事件 */
		function submitUserForm(){
			var loginIngUserID=$("#loginIngUserID").val();
			if(editStatus=="update"){
				if($("#id").val()!=loginIngUserID&&loginIngUserID!=1){
					$.messager.alert('失败提示','权限不足...','error');
					return;
				}
				$('#userform').form('submit',{
					url:'front/updateUser.do',
					onSubmit:function(){
						if($("#userName").val().length<2){
							$.messager.alert('错误','用户名长度不能太短...','error');  
							return false;
						}else if($("#password").val()==""){
							$.messager.alert('错误','密码不能为空...','error');  
							return false;
						}else if($("#password").val()!=$("#rpwd").val()){
							$.messager.alert('错误','密码输入不一致...','error');  
							return false;
						}
						return true;
					},
					success:function(data){
						if(data>0){
							$('#userGridwin').dialog('close');
							$.messager.show({
								title:'成功提示',
								msg:'用户信息更新	成功',
								timeout:5000,
								showType:'slide'
							});
							editStatus=undefined;
							$('#userData').datagrid("reload");
						}else{
							$.messager.alert('错误','用户名已被使用...');  
						}
					}
				});
			}else if(editStatus=="add"){
				$('#userform').form('submit',{
					url:'front/addUser.do',
					onSubmit:function(){
						if($("#userName").val().length<2){
							$.messager.alert('错误','用户名长度不能太短...','error');  
							return false;
						}else if($("#password").val()==""){
							$.messager.alert('错误','密码不能为空...','error');  
							return false;
						}else if($("#password").val()!=$("#rpwd").val()){
							$.messager.alert('错误','密码输入不一致...','error');  
							return false;
						}
						return true;
					},
					success:function(data){
						if(data>0){
							$('#userGridwin').dialog('close');
							$.messager.show({
								title:'成功提示',
								msg:'添加成功',
								timeout:5000,
								showType:'slide'
							});
							editStatus=undefined;
							$('#userData').datagrid("reload");
						}else{
							$.messager.alert('错误','密码输入不一致...');  
						}
					}
				});
			}
		}
	/* 	重置添加用户表单 */
		function clearUserForm(){
			$('#userform').form('clear');
		}
		</script>
