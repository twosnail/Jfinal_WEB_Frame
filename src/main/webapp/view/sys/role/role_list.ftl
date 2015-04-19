<!doctype html>
<html class="no-js">
<head>
	<link rel="stylesheet" href="${rootPath}/assets/css/amazeui.min.css"/>
	<link rel="stylesheet" href="${rootPath}/assets/css/admin.css">
</head>
<script src="${rootPath}/ext/js/jquery-1.7.2.min.js"></script>
<script type="text/javascript">
	function setroleIdValue(roleId){
		$("#roleId").val(roleId);
	}
	function roleContSize(down) {
  		var pTar = null; 
  		if (document.getElementById){ 
  			pTar = document.getElementById(down); 
  		}else{ 
  			eval('pTar = ' + down + ';'); 
  		}
  		if (pTar && !window.opera){ 
  			//begin resizing iframe 
  			pTar.style.display="block" 
	  		if (pTar.contentDocument && pTar.contentDocument.body.offsetHeight){ 
	  			//ns6 syntax 
	  			pTar.height = pTar.contentDocument.body.offsetHeight +40; 
	  			if( pTar.height < 560 ){
	  				pTar.height = 560 ;
	  			}
	  			/* pTar.width = pTar.contentDocument.body.scrollWidth - 260;  */
	  			pTar.width = document.documentElement.clientWidth-500;
	  		} else if (pTar.Document && pTar.Document.body.scrollHeight){ 
	  			//ie5+ syntax 
	  			pTar.height = pTar.Document.body.scrollHeight; 
	  			pTar.width = pTar.Document.body.scrollWidth-280; 
	  		} 
  		} 
	} 
	window.onresize=function(){
		document.getElementById('content').style.width=document.documentElement.clientWidth-500+"px";
	}

	function checkRoleId( url ){
		var roleId = $("#roleId").val() ;
		if( roleId == -1 ) {
			window.parent.tips( "请选择角色" );
			return false ;
		}
		window.open( url +  roleId ,"content_in")
	}
	
	function editRole( url ){
		var roleId = $("#roleId").val() ;
		if( roleId == -1 ) {
			window.parent.tips( "请选择角色" );
			return false ;
		}
		
		$.post( url+roleId , {}, function ( data ) {
			if ( data.status == 1 ) {
				window.location.href="${rootPath}/sys/role/listview";
			} else {
				window.top.tips( data.msg );
			}
		}, "json" );
		
	}
	
	
</script>
<body style="width: 100%;height: 100%;">

<!-- content start -->
<div class="admin-content">

	<!-- 导航 开始 -->
    <div class="am-cf am-padding">
		<div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">菜单</strong> / <small>Menu</small></div>
    </div>
    <!-- 导航 结束 -->

    <!-- 功能键和导航 开始 -->
    <div class="am-g">

    	<!-- 左边，功能键开始 -->
      	<div class="am-u-sm-12 am-u-md-6">
	        <div class="am-btn-toolbar">
	          	<div class="am-btn-group am-btn-group-xs">
	          		<a href="${rootPath}/sys/role/addview/-1" target="content_in" class="am-btn am-btn-success" ><span class="am-icon-plus"></span> 添加超级管理员 </a>
	          		<a href="javascript:checkRoleId('${rootPath}/sys/role/addview/');" id="user_role_addchiview" target="content_in" class="am-btn am-btn-success" ><span class="am-icon-plus"></span> 添加子角色 </a>
	          		<a href="javascript:checkRoleId('${rootPath}/sys/role/permissionview/');" id="user_role_permissionview" target="content_in" class="am-btn am-btn-success" ><span class="am-icon-plus"></span> 授权 </a>
	          		<a href="javascript:editRole('${rootPath}/sys/role/editstatus/');" id="user_role_editstatus" target="content_in" class="am-btn am-btn-success" ><span class="am-icon-plus"></span> 修改状态 </a>
	            	<a href="javascript:editRole('${rootPath}/sys/role/delview/');" id="user_role_delview" target="content_in" class="am-btn am-btn-danger"><span class="am-icon-trash-o"></span> 删除</a>
	          		<input type="hidden" value="-1" id="roleId" >
	          	</div>
	        </div>
      	</div>
      	<!-- 左边，功能键结束 -->
      	
    </div>
    <!-- 功能键和导航 结束 -->

	<!-- 内容 开始 -->
    <div class="am-g">
		<div class="am-u-sm-3" style="border: 1px solid #e9ecf1;">
	        <ul class="am-list admin-sidebar-list">
		        ${tree}
			</ul>
		</div>
		
		<div class="am-u-sm-9" style="border: 1px solid #e9ecf1;">
			<iframe id="content_in" name="content_in" 
		  		width="100%" height="100%" 
		  		src="${rootPath}/sys/role/addview/-1" 
		  		style="overflow-x:hidden" 
		  		scrolling="no" 
		  		frameborder=0   onload="javascript:roleContSize('content_in');" ></iframe>		
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

</body>
</html>