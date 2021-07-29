<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>注册界面</title>
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
			<div class="layui-container fly-marginTop">
				<div class="fly-panel fly-panel-user" pad20="">
					<div class="layui-tab layui-tab-brief" lay-filter="user">
						<ul class="layui-tab-title">
							<li>
								<a href="${pageContext.servletContext.contextPath}/user/loginPage">登入</a>
							</li>
							<li class="layui-this">注册</li>
						</ul>
						<div class="layui-form layui-tab-content" id="LAY_ucm" style="padding: 20px 0;">
							<div class="layui-tab-item layui-show">
								<div class="layui-form layui-form-pane">
									<form id="userForm">
										<div class="layui-form-item"> <label class="layui-form-label">用户名</label>
											<div class="layui-input-inline"> <input type="text" id="loginname" name="loginname" placeholder="请输入用户名" lay-verify="userName"  class="layui-input"> </div>
											<div class="layui-form-mid layui-word-aux">将会成为您唯一的登入名</div>
										</div>

										<div class="layui-form-item"> <label for="password" class="layui-form-label">密码</label>
											<div class="layui-input-inline"> <input type="password" id="password" placeholder="请输入密码" name="password" lay-verify="required" autocomplete="off" class="layui-input"> </div>
											<div class="layui-form-mid layui-word-aux">6到16个字符</div>
										</div>
										<div class="layui-form-item"> <label for="repass" class="layui-form-label">确认密码</label>
											<div class="layui-input-inline"> <input type="password" id="repass" name="repass" placeholder="请输入确认密码" lay-verify="required" autocomplete="off" class="layui-input"> </div>
										</div>
										<div class="layui-form-item"> <label for="L_username" class="layui-form-label" >姓名</label>
											<div class="layui-input-inline"> <input type="text" id="name" placeholder="请输入姓名" name="username"  lay-verify="required" autocomplete="off" class="layui-input"> </div>
										</div>
										<div class="layui-form-item"> <label for="L_username" class="layui-form-label" >昵称</label>
											<div class="layui-input-inline"> <input type="text" id="L_username" placeholder="请输入昵称" name="nickname" lay-verify="required" autocomplete="off" class="layui-input"> </div>
										</div>
										<div class="layui-form-item"> <button type="button" class="layui-btn" onclick="register()">立即注册</button> </div>
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
		function register() {
            var loginName = $("#loginname").val();
            var password = $("#password").val();
            var repass = $("#repass").val();
            var userData = $("#userForm").serialize();
            if (loginName == "") {
                alert("请输入登录名");
                return false;
			}
			if (password == "") {
                alert("请输入密码！");
                return false;
			}
			if (password != repass) {
                alert("两次密码不一致！");
                return false;
			}

            $.ajax({
                url :  "${pageContext.servletContext.contextPath}/user/register",
                data : userData,
                type : "post",
                success : function (msg) {
                    // alert(msg);
                    if (msg == 'success') {
                        //跳转到登录
                        window.location.href = "${pageContext.servletContext.contextPath}/user/loginPage";
                    }
                }
            });
        }
	</script>
</html>