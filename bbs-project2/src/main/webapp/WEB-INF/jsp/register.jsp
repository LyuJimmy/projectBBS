<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<%
	String basePath=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+
			request.getContextPath()+"/";
%>
<html>

	<head>
		<meta charset="UTF-8">
		<title></title>
		<base href="<%=basePath%>">
		<link rel="stylesheet" href="assets/layui/css/layui.css">
		<link rel="stylesheet" href="css/global.css">
		<script src="assets/layui/layui.js"></script>
		<script src="js/jquery-3.2.1.js"></script>

	</head>

	<body>
	<%--头部开始--%>
	<jsp:include page="/WEB-INF/jsp/common/head.jsp"></jsp:include>

	<div class="main layui-clear">
		<div class="layui-container fly-marginTop">
			<div class="fly-panel fly-panel-user" pad20="">
				<div class="layui-tab layui-tab-brief" lay-filter="user">
					<ul class="layui-tab-title">
						<li>
							<a href="user/loginPage">登入</a>
						</li>
						<li class="layui-this">注册</li>
					</ul>
					<div class="layui-form layui-tab-content" id="LAY_ucm" style="padding: 20px 0;">
						<div class="layui-tab-item layui-show">
							<div class="layui-form layui-form-pane">
								<form method="post" id="userForm">
									<div class="layui-form-item"> <label  class="layui-form-label">用户名</label></div>
										<div class="layui-input-inline"> <input type="text" id="loginname" name="loginname" placeholder="请输入用户名"    class="layui-input"> </div>
										<div class="layui-form-mid layui-word-aux">将会成为您唯一的登入名</div>

									
									<div class="layui-form-item"> <label  class="layui-form-label">密码</label>
										<div class="layui-input-inline"> <input type="password" id="password" placeholder="请输入密码" name="password"   autocomplete="off" class="layui-input"> </div>
										<div class="layui-form-mid layui-word-aux">6到16个字符</div>
									</div>
									<div class="layui-form-item"> <label  class="layui-form-label">确认密码</label>
										<div class="layui-input-inline"> <input type="password" id="repassword" name="repassword" placeholder="请输入确认密码"  autocomplete="off" class="layui-input"> </div>
									</div>
									<div class="layui-form-item"> <label class="layui-form-label" >姓名</label>
										<div class="layui-input-inline"> <input type="text" id="username" placeholder="请输入姓名" name="username"  autocomplete="off" class="layui-input"> </div>
									</div>
									<div class="layui-form-item"> <label  class="layui-form-label" >昵称</label>
										<div class="layui-input-inline"> <input type="text" id="nickname" placeholder="请输入昵称" name="nickname"   autocomplete="off" class="layui-input"> </div>
									</div>
									
									
									<div class="layui-form-item"> <button class="layui-btn" onclick="register()"  >立即注册</button> </div>

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
	function register(){
		var loginName=$("#loginname").val();
		var password=$("#password").val();
		var repassword=$("#repassword").val();
		var formData=$("#userForm").serialize()
		if (loginName==""){
			alert("请输入用户名")
			return false;
		}
		if (password==""){
			alert("请输入密码")
			return false;
		}
		if (repassword!=password){
			alert("两次密码不一致")
			return false;
		}

		$.ajax({
			url:"user/register",
			data:formData,
			type:"post",
			success:function (msg){
				if (msg==='success'){
					alert("注册成功")
					window.location.href="user/loginPage";
				}
				else {
					alert("注册失败")
					return;
				}
			}


		})

	}

</script>


</html>