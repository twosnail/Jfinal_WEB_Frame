<!doctype html>
<html class="no-js">
<head>
	<link rel="stylesheet" href="${rootPath}/assets/css/amazeui.min.css"/>
	<link rel="stylesheet" href="${rootPath}/assets/css/admin.css">
</head>
<script src="${rootPath}/ext/js/jquery-1.7.2.min.js"></script>
<body style="width: 100%;height: 100%;">

<!-- content start -->
<div class="admin-content">

	<!-- 导航 开始 -->
    <div class="am-cf am-padding">
		<div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">表格</strong> / <small>Table</small></div>
    </div>
    <!-- 导航 结束 -->

    <!-- 功能键和导航 开始 -->
    <div class="am-g">

    	<!-- 左边，功能键开始 -->
      	<div class="am-u-sm-12 am-u-md-6">
	        <div class="am-btn-toolbar">
	          	<div class="am-btn-group am-btn-group-xs">
	          		<a href="${rootPath}/sys/user/addview" class="am-btn am-btn-success" ><span class="am-icon-plus"></span> 新增</a>
	            	<button onclick="del('');" type="button" class="am-btn am-btn-danger"><span class="am-icon-trash-o"></span> 删除</button>
	          	</div>
	        </div>
      	</div>
      	<!-- 左边，功能键结束 -->

      	<!-- 右边，搜索 开始 -->
      	<form action="${rootPath}/sys/user/listview" method="get">
	      	<div class="am-u-sm-12 am-u-md-3">
		        <div class="am-form-group">
		          <select data-am-selected="{btnSize: 'sm'}" name="roleId" id="roleId">
		          	<option value="-1" >角色选择（全部）</option>
		            <#list roles as role>
					 	<option value="${role.roleId}" >${role.roleName}</option>
					 </#list>
		          </select>
		        </div>
	    	</div>
	      
	      	<div class="am-u-sm-12 am-u-md-3">
	        	<div class="am-input-group am-input-group-sm">
	          		<input type="text" class="am-form-field" id="keyWord" name="keyWord" value="${keyWord}">
	          		<span class="am-input-group-btn">
	            		<button class="am-btn am-btn-default" type="submit">搜索</button>
	          		</span>
	        	</div>
	      	</div>
      	</form>
      	<!-- 搜索 结束-->
    </div>
    <!-- 功能键和导航 结束 -->

	<!-- 内容 开始 -->
    <div class="am-g">
		<div class="am-u-sm-12">

	        <form class="am-form">
	          	<table class="am-table am-table-striped am-table-hover table-main">
		            <thead>
		            	<tr>
							<th class="table-check"><input type="checkbox" onclick="checkbox( this.checked ,'checkbox_list')" /></th>
							<th class="table-id">ID</th>
							<th class="table-title">用户名称</th>
							<th class="table-type">性别</th>
							<th class="table-type">角色</th>
							<th class="table-date am-hide-sm-only">手机</th>
							<th class="table-author am-hide-sm-only">是否有效</th>
							<th class="table-title">创建时间</th>
							<th class="table-set">操作</th>
						</tr>
		            </thead>
					<tbody>
						<#list list.datalist as infoUser>
							<tr>
								<td><input type="checkbox" value="${infoUser.userId}" class="checkbox_list" /></td>
					            <td> ${infoUser.userId} </td>
					            <td><a href="${rootPath}/sys/user/${infoUser.userId}"> ${infoUser.userName} </a></td>
					            <td><#if infoUser.sex=1>男<#else>女</#if></td>
					            <td> ${infoUser.roleName} </td>
					            <td class="am-hide-sm-only"> ${infoUser.mobile} </td>
					            <td class="am-hide-sm-only"> <#if infoUser.isUsed=1>正常<#else>无效</#if> </td>
					            <td class="am-hide-sm-only"> ${infoUser.createDate} </td>
					            <td>
					              <div class="am-btn-toolbar">
					                <div class="am-btn-group am-btn-group-xs">
					                  <a href="${rootPath}/sys/user/editview?userId=${infoUser.userId}" class="am-btn am-btn-default am-btn-xs am-text-secondary"><span class="am-icon-pencil-square-o"></span> 编辑</a>
					                  <a data-id="${infoUser.userId}" href="javascript:status(${infoUser.userId}, ${infoUser.isUsed});" class="am-btn am-btn-default am-btn-xs am-text-warning am-hide-sm-only"><span class="am-icon-toggle-on"></span>状态</a>
					                  <a href="javascript:del(${infoUser.userId});" class="am-btn am-btn-default am-btn-xs am-text-danger am-hide-sm-only"><span class="am-icon-trash-o"></span> 删除</a>
					                </div>
					              </div>
					            </td>
							</tr>
						</#list>
					</tbody>
	        	</table>
	        </form>

	        <!-- 分页 开始 -->
			<div class="am-cf" id="page"><input type="hidden" id="pageValue" value="${list.totalCount}_${list.pageSize}_${list.curPage}_5_${rootPath}/sys/user/listview"> </div>
			<!-- 分页 结束 -->
	        
		</div>
    </div>
</div>
<!-- content end -->


<!--[if lt IE 9]>
<script src="http://libs.baidu.com/jquery/1.11.1/jquery.min.js"></script>
<script src="http://cdn.staticfile.org/modernizr/2.8.3/modernizr.js"></script>
<script src="${rootPath}/assets/js/polyfill/rem.min.js"></script>
<script src="${rootPath}/assets/js/polyfill/respond.min.js"></script>
<script src="${rootPath}/assets/js/amazeui.legacy.js"></script>
<![endif]-->

<!--[if (gte IE 9)|!(IE)]><!-->
<script src="${rootPath}/assets/js/amazeui.min.js"></script>
<!--<![endif]-->
<script src="${rootPath}/assets/js/app.js"></script>
<script src="${rootPath}/ext/js/page.js"></script>
<script type="text/javascript">
	//删除
	function del( userId  ) {
		if( userId != null && userId != '' ) {

		} else {
			$(".checkbox_list").each(function() {  
	            if ($(this).attr("checked")) {  
	                userId += $(this).val() + ",";  
	            } 
	        });
			userId = userId.substring(0,userId.length-1) ;
		}
		
		$('#my-confirm', window.parent.document ).modal({
	        relatedTarget: this,
	        onConfirm: function(options) {
	        	$.post( "${rootPath}/sys/user/del", {		
						"userId":userId
					}, function ( data ) {
						if ( data.state == 1 ) {
							location.href="${rootPath}/sys/user/listview";
						} else {
							window.parent.tips( data.msg );
						}
				}, "json" );
	        },
	        onCancel: function() {          
	        }
	    });	
	    delete userId;
	}
	//修改状态
	function status( userId , isUsed ) {
		if( isUsed == 1 ) {
			$('#confirm_info' , window.parent.document ).html(  '你，确定要禁用该用户' );
			isUsed = 0 ;
		} else {
			$('#confirm_info' , window.parent.document ).html(  '你，确定要启用该用户' );
			isUsed = 1 ;
		}
	    $('#my-confirm', window.parent.document ).modal({
	        relatedTarget: this,
	        onConfirm: function(options) {
	        	$.post( "${rootPath}/sys/user/edit/status", {		
						"userId":userId ,
						"isUsed":isUsed
					}, function ( data ) {
						if ( data.state == 1 ) {
							location.href="${rootPath}/sys/user/listview";
						} else {
							window.parent.tips( data.msg );
						}
				}, "json" );
	        },
	        onCancel: function() {          
	        }
	    });		
	}
	
</script>
</body>
</html>