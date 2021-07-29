<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
		<title>登录界面</title>
		<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/assets/layui/css/layui.css">
		<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/css/global.css">
		<script src="${pageContext.servletContext.contextPath}/assets/layui/layui.js"></script>
		<script src="${pageContext.servletContext.contextPath}/js/jquery-3.2.1.js"></script>
	</head>

	<body>
		<%--公共头部开始--%>
		<jsp:include page="/WEB-INF/jsp/common/head.jsp"></jsp:include>
		<%--公共头部结束--%>

		<div class="main layui-clear">
			<div class=" layui-container fly-marginTop">
				<div class="fly-panel fly-panel-user" pad20="">
					<div class="layui-tab layui-tab-brief" lay-filter="user">
						<ul class="layui-tab-title">
							<li class="layui-this">登入</li>
							<li>
								<a href="${pageContext.servletContext.contextPath}/user/registerPage">注册</a>
							</li>
						</ul>
						<div class="layui-form layui-tab-content" id="LAY_ucm" style="padding: 20px 0;">
							<div class="layui-tab-item layui-show">
								<div class="layui-form layui-form-pane">
									<form id="loginForm" action="${pageContext.servletContext.contextPath}/user/login" method="post">
										<div class="layui-form-item"> <label class="layui-form-label">用户名</label>
											<div class="layui-input-inline"> <input type="text" id="loginname" name="username"  placeholder="请输入用户名"  autocomplete="off" class="layui-input"> </div>
										</div>
										<div class="layui-form-item"> <label class="layui-form-label">密码</label>
											<div class="layui-input-inline"> <input type="password" id="password" name="password"  placeholder="请输入密码"  autocomplete="off" class="layui-input"> </div>
										</div>
										<div class="layui-form-item">
											<input type="submit" class="layui-btn" value="立即登录"/> <span style="padding-left:20px;"></span>
										</div>
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
		function login() {
			//获取表单中的账户和密码
			var formData = $("#loginForm").serialize(); //序列化方法，目的：可以获取表单所有输入框的值（键值对方式）
			$.ajax({
				url :  "${pageContext.servletContext.contextPath}/user/login",
				// data : {"loginname":loginName,"password":password},
				data : formData,
				type : "post",// var loginName = $("#loginname").val();
                // var password = $("#password").val();
				success : function (msg) {
					// alert(msg);
					if (msg == '101') {
					    //跳转到首页
						window.location.href = "${pageContext.servletContext.contextPath}/index";
                    } else {
					    //提示登录信息出错
						alert("账户或密码不正确！");
						return;
                    }
                }
			});
        }
	</script>

</html>