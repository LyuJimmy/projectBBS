<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://shiro.apache.org/tags" prefix="shiro" %>
<%@ taglib prefix="sys" uri="/WEB-INF/tld/fns.tld" %>
<%@ include file="common/include.jsp"%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="utf-8">
	<title>问题详情</title>
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<meta name="keywords" content="fly,layui,前端社区">
	<meta name="description" content="">
	<link rel="stylesheet" href="${contextPath}/assets/layui/css/layui.css">
	<link rel="stylesheet" href="${contextPath}/css/global.css">
	<script src="${contextPath}/assets/layui/layui.js"></script>
	<script src="${contextPath}/js/jquery-3.2.1.js"></script>
	<style type="text/css" rel="stylesheet">
		form {
			margin: 0;
		}
		.editor {
			margin-top: 5px;
			margin-bottom: 5px;
		}
	</style>

	</head>
	<body>
		<%--公共头部开始--%>
		<jsp:include page="/WEB-INF/jsp/common/head.jsp"></jsp:include>
		<%--公共头部结束--%>
		<div class="main layui-clear">
			<div class="wrap">
				<div class="content detail">
					<div class="fly-panel detail-box">
						<h1>${question.title}</h1>
						<div class="fly-tip fly-detail-hint" data-id="">
							<c:if test="${question.isUp eq '1'}">
								<span class="fly-tip-stick">置顶帖</span>
							</c:if>
							<shiro:hasPermission name="ques:opt:${question.id}">
								<c:choose>
									<c:when test="${question.isUp eq '0'}">
										<span class="jie-admin">
											<a href="javascript:;" onclick="toTop(${question.id},'1')">点击置顶</a>
										</span>
									</c:when>
									<c:otherwise>
										<span class="layui-btn layui-btn-mini jie-admin">
											<a href="javascript:;" onclick="toTop(${question.id},'0')">取消置顶</a>
										</span>
									</c:otherwise>
								</c:choose>
								<c:if test="${question.isClosed eq '1'}">
									<span class="jie-admin" type="del" style="margin-left: 20px;">
									<a href="javascript:;" onclick="del(${question.id})">删除该帖</a> </span>
									</span>
								</c:if>
							</shiro:hasPermission>

							<div class="fly-list-hint">
								<i class="iconfont" title="回答">&#xe60c;</i> ${answerList.size()}
							</div>
						</div>
						<div class="detail-about">
							<a class="jie-user" href=""> <img src="${contextPath}/img/uer.jpg" alt="头像"> <cite> 压缩
									<em><fmt:formatDate value="${question.createtime}" pattern="yyyy-MM-dd" />发布</em> </cite> </a>
							<div class="detail-hits" data-id="{{rows.id}}">

								<shiro:hasPermission name="ques:opt:${question.id}">
									<span class="layui-btn layui-btn-mini jie-admin">
										<c:choose>
											<c:when test="${question.isClosed eq 0}">
												<a href="#">编辑</a>
											</c:when>
											<c:otherwise>
												<a href="javascript:;">已完帖，无法编辑</a>
											</c:otherwise>
										</c:choose>
									</span>
								</shiro:hasPermission>
								<shiro:user>
									<c:choose>
										<c:when test="${sys:isCollect(question.id)}">
											<span class="layui-btn layui-btn-mini jie-admin  layui-btn-danger" type="collect" data-type="add">
												<a href="javascript:;" onclick="collectOrNot(${question.id})">取消收藏</a>
											</span>
										</c:when>
										<c:otherwise>
											<span class="layui-btn layui-btn-mini jie-admin" type="collect" data-type="add">
												<a id="collectPost" href="javascript:;" onclick="collectOrNot(${question.id})">收藏</a>
											</span>
										</c:otherwise>
									</c:choose>
								</shiro:user>
							</div>
						</div>
						<div class="detail-body photos" style="margin-bottom: 20px;">
							<p>${question.description}</p>
						</div>
					</div>

					<div class="fly-panel detail-box" style="padding-top: 0;">
						<a name="comment"></a>
						<ul class="jieda photos" id="jieda">
							<c:choose>
								<c:when test="${answerList != null}">
									<c:forEach items="${answerList}" var="answer">
										<li data-id="12" class="jieda-daan">
											<div class="detail-about detail-about-reply">
												<a class="jie-user" href="javascript:;">
													<img src="${contextPath}/img/uer.jpg" alt="">
													<cite> <i>${sys:getUser(answer.userId).username}</i></cite>
												</a>
												<div class="detail-hits">
													<span>3分钟前</span>
												</div>
												<c:if test="${answer.isAccept eq 1}">
													<i class="iconfont icon-caina" title="最佳答案"></i>
												</c:if>
											</div>
											<div class="detail-body jieda-body">
												<p>${answer.content}</p>
											</div>
											<div class="jieda-reply">
												<span id="zan${answer.id}" class="jieda-zan ${sys:isLikes(answer.id) ? 'zanok' : 'zan'}" type="zan">
													<i class="iconfont icon-zan" onclick="likes(${answer.id})"></i><em id="count${answer.id}">${answer.likes}</em>
												</span>
												<shiro:hasPermission name="ques:opt:${question.id}">
													<div class="jieda-admin">
														<c:if test="${answer.isAccept eq '0' and question.isClosed ne '1'}">
															<span type="del">
																<a href="#" class="layui-btn layui-btn-danger layui-btn-small">删除</a>
															</span>
															<span class="jieda-accept" type="accept">
																<a href="javascript:;" onclick="acceptAnswer(${answer.id},${question.id})" class="layui-btn  layui-btn-small">采纳</a>
															</span>
														</c:if>
													</div>
												</shiro:hasPermission>
											</div>
										</li>
									</c:forEach>
								</c:when>
								<c:when test="${answerList == null}">
									<li class="fly-none">没有任何回答</li>
								</c:when>
							</c:choose>
						</ul>

						<span id="toName">@ 压缩(楼主)</span>
						<div class="layui-form layui-form-pane">
							<form action="${contextPath}/ans/save" method="post">
								<input type="hidden" name="questionId" value="${question.id}">
								<div class="layui-form-item layui-form-text">
									<div class="layui-input-block">
										<textarea id="L_content" name="content" placeholder="我要回答" class="layui-textarea fly-editor" style="height: 150px;"></textarea>
									</div>
								</div>
								<div class="layui-form-item">
									<button class="layui-btn" lay-filter="*" lay-submit>提交回答</button>
								</div>
							</form>
						</div>

					</div>
				</div>
			</div>

			<div class="edge">
				<dl class="fly-panel fly-list-one">
					<dt class="fly-panel-title">最近热帖</dt>
					<dd>
						<a href="">使用 layui 秒搭后台大布局（基本结构）</a> <span><i
							class="iconfont">&#xe60b;</i> 6087</span>
					</dd>
					<dd>
						<a href="">Java实现LayIM后端的核心代码</a> <span><i class="iconfont">&#xe60b;</i>
							767</span>
					</dd>
					<dd>
						<a href="">使用 layui 秒搭后台大布局（基本结构）</a> <span><i
							class="iconfont">&#xe60b;</i> 6087</span>
					</dd>
					<dd>
						<a href="">Java实现LayIM后端的核心代码</a> <span><i class="iconfont">&#xe60b;</i>
							767</span>
					</dd>
					<dd>
						<a href="">使用 layui 秒搭后台大布局（基本结构）</a> <span><i
							class="iconfont">&#xe60b;</i> 6087</span>
					</dd>
					<dd>
						<a href="">Java实现LayIM后端的核心代码</a> <span><i class="iconfont">&#xe60b;</i>
							767</span>
					</dd>
					<dd>
						<a href="">使用 layui 秒搭后台大布局（基本结构）</a> <span><i
							class="iconfont">&#xe60b;</i> 6087</span>
					</dd>
					<dd>
						<a href="">Java实现LayIM后端的核心代码</a> <span><i class="iconfont">&#xe60b;</i>
							767</span>
					</dd>
				</dl>

				<dl class="fly-panel fly-list-one">
					<dt class="fly-panel-title">近期热议</dt>
					<dd>
						<a href="">使用 layui 秒搭后台大布局之基本结构</a> <span><i
							class="iconfont">&#xe60c;</i> 96</span>
					</dd>
					<dd>
						<a href="">使用 layui 秒搭后台大布局之基本结构</a> <span><i
							class="iconfont">&#xe60c;</i> 96</span>
					</dd>
					<dd>
						<a href="">使用 layui 秒搭后台大布局之基本结构</a> <span><i
							class="iconfont">&#xe60c;</i> 96</span>
					</dd>
					<dd>
						<a href="">使用 layui 秒搭后台大布局之基本结构</a> <span><i
							class="iconfont">&#xe60c;</i> 96</span>
					</dd>
					<dd>
						<a href="">使用 layui 秒搭后台大布局之基本结构</a> <span><i
							class="iconfont">&#xe60c;</i> 96</span>
					</dd>
					<dd>
						<a href="">使用 layui 秒搭后台大布局之基本结构</a> <span><i
							class="iconfont">&#xe60c;</i> 96</span>
					</dd>
					<dd>
						<a href="">使用 layui 秒搭后台大布局之基本结构</a> <span><i
							class="iconfont">&#xe60c;</i> 96</span>
					</dd>
					<dd>
						<a href="">使用 layui 秒搭后台大布局之基本结构</a> <span><i
							class="iconfont">&#xe60c;</i> 96</span>
					</dd>
				</dl>
			</div>
		</div>
	    <script type="text/javascript" charset="utf-8" src="${contextPath}/js/kindeditor.js"></script>
	    <script type="text/javascript" charset="utf-8" src="${contextPath}/assets/layui/layui.js"></script>
	    <script type="text/javascript" charset="utf-8" src="${contextPath}/js/jquery-3.2.1.js"></script>
	    <script type="text/javascript">
			layui.use('layer', function(){
				var layer = layui.layer;
			});

			KE.show({
				id : 'L_content',
				resizeMode : 1,
				items : [
				'fontname', 'fontsize', 'textcolor', 'bgcolor', 'bold', 'italic', 'underline',
				'removeformat', 'justifyleft', 'justifycenter', 'justifyright', 'insertorderedlist',
				'insertunorderedlist', 'emoticons', 'image', 'link']
			});

			//置顶
			function toTop(questionId,topFlag) {
				let msg = "";
				if (topFlag == '0') {
					msg = "取消";
				}
				layer.confirm('确认要' + msg + '置顶吗？', {
					btn : [ '确定', '取消' ]//按钮
				}, function(index) {
					layer.close(index);
					$.ajax({
						url:"${contextPath}/ques/toTop",
						data:{"id":questionId,"isUp":topFlag},
						success:function(data){
							layer.alert(data);
							window.location.reload();
						},
						error:function (data) {
							layer.msg(data, {
								time: 2000, //2s后自动关闭
							});
						}
					});
				});
			}

			function del(questionId) {
				layer.confirm('确认要删除吗？', {
					btn : [ '确定', '取消' ]//按钮
				}, function(index) {
					layer.close(index);
					$.ajax({
						url:"${contextPath}/ques/del/" + questionId,
						method: "delete",
						success:function(data){
							layer.alert(data);
							window.location.href = "${contextPath}/index";
						},
						error:function (data) {
							layer.msg(data, {
								time: 2000, //2s后自动关闭
							});
						}
					});
				});
			}

			//采纳回复
			function acceptAnswer(ansId,questionId) {
				layer.confirm('确认要采纳吗？', {
					btn : [ '确定', '取消' ]//按钮
				}, function(index) {
					layer.close(index);
					$.ajax({
						url:"${contextPath}/ans/acceptAnswer",
						data:{"id":ansId,"questionId":questionId},
						method: "post",
						success:function(data){
							layer.alert(data);
							window.location.reload();
						},
						error:function (data) {
							layer.msg(data, {
								time: 2000, //2s后自动关闭
							});
						}
					});
				});
			}

			//回复点赞
			function likes(answerId) {
				$.ajax({
					url:"${contextPath}/likes/up",
					data:{"answerId":answerId},
					method: "post",
					success: function(data){
						if (data.code == "101") {
							layer.alert("请先登录");
						} else  {
							$("#zan" + answerId).removeClass();
							if (data.code == "102") { //点赞
								$("#zan" + answerId).addClass("jieda-zan zanok");
							} else  {
								$("#zan" + answerId).addClass("jieda-zan zan");
							}
							$("#count" + answerId).text(data.message);
						}
					},
					error:function (data) {
						layer.msg(data.message, {
							time: 2000, //2s后自动关闭
						});
					}
				});
			}

			function collectOrNot(questionId) {
				$.ajax({
					url:"${contextPath}/collect/save",
					data:{"questionId":questionId},
					method: "post",
					success:function(data){
						if (data.code == "101") {
							layer.alert("请先登录");
						} else  {
							if (data.code == "102") { //收藏
								layer.msg("收藏成功",{
									icon:1,
									time:2000
								},function () {
									window.location.reload();
								})
							} else  {
								layer.msg("取消收藏",{
									icon:1,
									time:2000
								},function () {
									window.location.reload();
								})
							}
							$("#count" + answerId).text(data.message);
						}

					},
					error:function (data) {
						layer.msg(data, {
							time: 2000, //2s后自动关闭
						});
					}
				});
			}
		</script>

	</body>
</html>