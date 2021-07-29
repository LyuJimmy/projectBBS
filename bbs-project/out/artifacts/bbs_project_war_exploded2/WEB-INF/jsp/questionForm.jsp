<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title>发表问题</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="keywords" content="fly,layui,前端社区">
    <meta name="description" content="Fly社区是模块化前端UI框架Layui的官网社区，致力于为web开发提供强劲动力">

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
      <div class="fly-panel" pad20>
        <h2 class="page-title">发表问题</h2>

        <!-- <div class="fly-none">并无权限</div> -->

        <div class="layui-form layui-form-pane">
          <form action="${pageContext.servletContext.contextPath}/ques/save" method="post">
            <div class="layui-form-item">
              <label for="L_title" class="layui-form-label">标题</label>
              <div class="layui-input-block">
                <input type="text" id="L_title" name="title" required lay-verify="required" autocomplete="off" class="layui-input">
              </div>
            </div>
            <div class="layui-form-item layui-form-text">
              <div class="layui-input-block">
                 <div class="editor">
                    <textarea id="content" name="description" style="width:1040px;height:450px;visibility:hidden;"></textarea>
                 </div>
              </div>
              <label class="layui-form-label" style="top: -2px;">描述</label>
            </div>
            <div class="layui-form-item">
              <label for="L_title" class="layui-form-label">悬赏</label>
              <div class="layui-input-block">
                <input type="number"  name="coin" required lay-verify="required" autocomplete="off" class="layui-input">
              </div>
            </div>
            <div class="layui-form-item">
              <button class="layui-btn" lay-filter="*" lay-submit>立即发布</button>
            </div>
          </form>
        </div>
      </div>
    </div>

     <script type="text/javascript" charset="utf-8" src="${pageContext.servletContext.contextPath}/js/kindeditor.js"></script>
      <script type="text/javascript">
        KE.show({
            id : 'content',
            resizeMode : 1,
            //cssPath : './index.css',
            items : [
            'fontname', 'fontsize', 'textcolor', 'bgcolor', 'bold', 'italic', 'underline',
            'removeformat', 'justifyleft', 'justifycenter', 'justifyright', 'insertorderedlist',
            'insertunorderedlist', 'emoticons', 'image', 'link']
        });
      </script>
  </body>
</html>