<!doctype html>
<html class="no-js">
<head>
	<link rel="stylesheet" href="${rootPath}/assets/css/amazeui.min.css"/>
	<link rel="stylesheet" href="${rootPath}/assets/css/admin.css">
</head>
<style type="text/css">
	.p-top{
		padding-top:9.6px;
	}
</style>
<body>
<!-- content start -->
<div class="admin-content">
    <div class="am-cf am-padding">
      	<div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">个人资料</strong> / <small>Personal information</small></div>
    </div>
    <hr/>
    <div class="am-g">
		<form class="am-form am-form-horizontal">
		 	<div class="am-u-sm-12 am-u-md-6 am-u-md-push-6">
	        
		        <div class="am-form-group">
		           	<label class="am-u-sm-3 am-form-label">手机号码 </label>
		           	<div class="am-u-sm-9 p-top">
		           	 	${info.mobile}
		           </div>
		        </div>        
				<div class="am-form-group">
				 	<label for="birthday" class="am-u-sm-3 am-form-label">生日</label>
					<div class="am-u-sm-9 p-top">
					  	${info.birthday}
					</div>
				 </div>
				 
				 <div class="am-form-group">
				 	<label class="am-u-sm-3 am-form-label">角色</label>
				 	<div class="am-u-sm-9 p-top">${info.roleId}</div>				 	
				 </div>
				 
				 <div class="am-form-group">
					<label for="user-role" class="am-u-sm-3 am-form-label">性别</label>
					<div class="am-u-sm-9 p-top">			      
			             <#if info.isUsed=1 > 男 <#else> 女 </#if>
					</div>
				</div>
				
				<div class="am-form-group">
					<label for="user-role" class="am-u-sm-3 am-form-label">状态</label>
					<div class="am-u-sm-9 p-top">			      
			            <#if info.isUsed=1 > 正常 <#else>  无效 </#if>
					</div>
				</div>
			 
	      	</div>
	      
			<div class="am-u-sm-12 am-u-md-6 am-u-md-pull-6">
	        
		        <div class="am-form-group">
		            <label for="userName" class="am-u-sm-3 am-form-label">姓名</label>
		            <div class="am-u-sm-9 p-top">
		              	${info.userName}
		            </div>
		        </div>

		        <div class="am-form-group">
		            <label for="email" class="am-u-sm-3 am-form-label">电子邮件</label>
		            <div class="am-u-sm-9 p-top">
		              	${info.email}
		            </div>
		        </div>

		        <div class="am-form-group">
		            <label for="idCard" class="am-u-sm-3 am-form-label">身份证</label>
		            <div class="am-u-sm-9 p-top">
		              	${info.idCard}
		            </div>
		        </div>
				
		        <div class="am-form-group">
		            <label for="addr" class="am-u-sm-3 am-form-label">地址</label>
		            <div class="am-u-sm-9 p-top">
		              	${info.addr}
		            </div>
		        </div>

		          
		        <div class="am-form-group">
		            <label for="sortNo" class="am-u-sm-3 am-form-label">排序号</label>
		            <div class="am-u-sm-9 p-top">
		              	${info.sortNo}
		            </div>
		        </div>
		          

		         <div class="am-form-group">
		            <div class="am-u-sm-9 am-u-sm-push-3">
		              	<button type="button" onclick="history.go(-1);" class="am-btn am-btn-primary">返回</button>
		            </div>
		        </div>
	      	</div>
	     </form>
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
<script src="${rootPath}/assets/js/jquery.min.js"></script>
<script src="${rootPath}/assets/js/amazeui.min.js"></script>
<!--<![endif]-->
<script src="${rootPath}/assets/js/app.js"></script>
</body>
</html>
