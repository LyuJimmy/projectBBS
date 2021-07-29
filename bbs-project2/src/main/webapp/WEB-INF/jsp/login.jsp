<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<%
	String basePath=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+
			request.getContextPath()+"/";
%>
<html>

	<head>
		<meta charset="UTF-8">
		<title>注册界面</title>
		<base href="<%=basePath%>">
		<link rel="stylesheet" href="assets/layui/css/layui.css">
		<link rel="stylesheet" href="css/global.css">
		<script src="assets/layui/layui.js"></script>
		<script src="js/jquery-3.2.1.js"></script>


	</head>

	<body>
	<jsp:include page="/WEB-INF/jsp/common/head.jsp"></jsp:include>

	<div class="main layui-clear">
			<div class=" layui-container fly-marginTop">
				<div class="fly-panel fly-panel-user" pad20="">
					<div class="layui-tab layui-tab-brief" lay-filter="user">
						<ul class="layui-tab-title">
							<li class="layui-this">登入</li>
							<li>
								<a href="user/registerPage">注册</a>
							</li>
						</ul>
						<div class="layui-form layui-tab-content" id="LAY_ucm" style="padding: 20px 0;">
							<div class="layui-tab-item layui-show">
								<div class="layui-form layui-form-pane">
									<form id="loginForm" action="user/login" method="post">
										<div class="layui-form-item"> <label  class="layui-form-label">用户名</label>
											<div class="layui-input-inline"> <input type="text" id="loginname" name="loginname" required=""  placeholder="请输入用户名"  autocomplete="off" class="layui-input"> </div>
										</div>
										<div class="layui-form-item"> <label  class="layui-form-label">密码</label>
											<div class="layui-input-inline"> <input type="password" id="password" name="password"  placeholder="请输入密码" required="" lay-verify="required" autocomplete="off" class="layui-input"> </div>
										</div>
										<div class="layui-form-item"> <button class="layui-btn" onclick="login()" >立即登录</button> <span style="padding-left:20px;"> </span></div>


									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</body>


	<script>
		function login(){
			//获取表单的账号和密码
			var formData=$("#loginForm").serialize();
			$.ajax({
				url:"user/login",
				//data:{"loginname":loginname,"password":password},
				data:formData,
				type:"post",
				success:function (msg){
					if (msg==="101"){
						//登入成功 跳转到首页
						alert("登入成功")
						window.location.href="index"
					}else {
						//登入失败
						alert("账户或者密码不正确");
						return;
					}
				}


			});

		}

	</script>

</html>