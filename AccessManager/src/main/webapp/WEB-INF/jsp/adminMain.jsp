<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
 <%@ include file="inc.jsp" %> 
</head>
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
	            	if(title==""||title==undefined||title==null){
	            	}else{
	            		try {
	            			$('ul[name="'+title+'"]').tree('getRoots');
						} catch (e) {
							$('ul[name="'+title+'"]').tree({
		            			method:'GET',
		            			queryParams:{rName:title},
			                    url: 'function/Functions.do',
			                    onClick: function(node){
			                    	var id=node.id;//获取点击的节点id
			            			var title="源辰信息";
			            			var href="toyc.action";
			            			var tabObj=$('#admin_content_info');
			            			if(tabObj.tabs('exists',node.text)){
			        					tabObj.tabs('select',node.text);
			        					return;
			        				}else{
			        					title=node.text;
			        					href=node.url;
			        				}
			            			tabObj.tabs('add',{    
			            				title:title,    
			            				href:href,
			            				fit:true,
			            				closable:true,    
			            			});
			                		
			                	}
			                }); 
						}
							
	            	}
	            }
	        });
		});
		</script> 
<body class="easyui-layout" oncontextmenu="return false" onselectstart="return false">
	<div data-options="region:'north',split:true" style="height: 110px; background:url(image/YcInfo.png);background-position:center;background-repeat:no-repeat;" >
		<input type="hidden" id="loginIngUserID" value="${sessionScope.user.id }"/>
		<div data-options="iconCls:'icon-undo'" ><input type="button" value="安全退出" onclick="loginOut()" style="float:right;margin-top:60px;margin-right:80px;"></div>
	</div>
	<div data-options="region:'west',split:true,title:'导航'"
		style="width: 135px;">
		<div id="accordions" >
		</div>
	</div>
	<!-- 东边 -->
	<div data-options="region:'east',split:true,title:'工具箱'"
		style="width: 170px; padding: 10px;">
		<div class="easyui-calendar" style="width: 150px; height: 150px;"></div>
	</div>
	<!-- 南边 -->
	<div data-options="region:'south',border:false"
		style="height: 30px; padding: 10px;">
		<center>衡阳源辰信息科技有限公司</center>
	</div>
	<div
		data-options="region:'center',title:'操作',tools:[{
		iconCls:'icon-full',
		handler:function(){
			full();
		}
	},{
		iconCls:'icon-unfull',
		handler:function(){
			unFull();
		}
	}]">
		<div id="admin_content_info" class="easyui-tabs"
			data-options="fit:true"></div>

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
