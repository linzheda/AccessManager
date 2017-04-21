$(function(){

	$('#admin_content_info').tabs('add',{    
		title:"源辰信息",    
		href:'toyc.action',
		fit:true,
		closable:true,    
	});

	$('#admin_menu_ui1').tree({
		onClick: function(node){
			var id=node.id;//获取点击的节点id
			var title="源辰信息";
			var href="toyc.action";
			var tabObj=$('#admin_content_info');

			if(id=="admin_userManager"){
				if(tabObj.tabs('exists','用户管理')){
					tabObj.tabs('select','用户管理');
					return;
				}else{
					title="用户管理";
					href='toUserGrid.action';
				}

			}else if(id=="admin_roleManager"){
				if(tabObj.tabs('exists','角色管理')){
					tabObj.tabs('select','角色管理');
					return;
				}else{
					title="角色管理";
					href='toRoleGrid.action';
				}
			}else if(id=="admin_menuManager"){
				if(tabObj.tabs('exists','菜单管理')){
					tabObj.tabs('select','菜单管理');
					return;
				}else{
					title="菜单管理";
					href='toMenuManager.action';
				}
			}else if(id=="admin_userAddaccess"){
				if(tabObj.tabs('exists','用户授权')){
					tabObj.tabs('select','用户授权');
					return;
				}else{
					title="用户授权";
					href='toUserGrant.action';
				}
			}
			tabObj.tabs('add',{    
				title:title,    
				href:href,
				fit:true,
				closable:true,    
			});

		}
	});

	
})