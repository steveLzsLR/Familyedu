<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户登录-家教网</title>
<link href="${pageContext.request.contextPath}/css/bootstrap.css"
	rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/css/userLogin.css"
	media="all" rel="stylesheet" type="text/css" />
<script src="${pageContext.request.contextPath}/js/userRegister.js"
	type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/jquery.validate.js"
	type="text/javascript"></script>
<script>
	$(document).ready(function() {
		$("#userLogin").validate();
	});
	function noActivate(){
		alert("用户尚未进行激活，请到注册邮箱进行账户激活后登陆！");
	}
</script>
	<%
		if (session.getAttribute("noActivate") != null) {
			out.print("<script type='text/javascript'>noActivate();</script>");
			session.removeAttribute("noActivate");
		}
	%>

	<script type="text/javascript">
		$(document).ready(function(){
			$("#loginBtn").click(function(){
				$.ajax({
					type:'POST',
					url:'${pageContext.request.contextPath}/user/isTrueLogin',
					data:{
					"email":$("#email").val(),
					"password":$("#password").val()					
					},
					success:function(date){
						if(date=="1"){
						}else if (date=="0") {
							alert("账号或密码错误,请重新输入!");
							location.href ="${pageContext.request.contextPath}/user/login"
						}
					}
				});	
			});
		});
	</script>
</head>
<body>
	<div class='bigbar-header autowidth'>
		<div class='bigbar-wrapper'>
			<h1>
				<a href='${pageContext.request.contextPath}/'> <img alt="启学家教网" class="bigbar-logo-img"
					src="${pageContext.request.contextPath}/image/logo2.png" />
				</a>
			</h1>
			<h2>
				你好，欢迎来到启学家教网！ <a href="login">请登录</a>
			</h2>
		</div>
	</div>


	<div class='login_container autowidth'>
		<div class='login_main'>
			<div class='left'>
				<img alt="启学家教网宣传图片" class="bgimg"
					src="${pageContext.request.contextPath}/image/registerImg2.png" />
			</div>
			<div class='right'>
				<div class="LoginText">用户登录</div>
				<div class='login-panel'>
					<form accept-charset="UTF-8" action="${pageContext.request.contextPath}/user/sign_in"
						class="form-horizontal" id="userLogin" method="post">

						<div class='inputs'>
							<div class='input-group'>
								<div class='input-group-addon left_bc'>
									<span class='glyphicon glyphicon-user'></span>
								</div>
								<input autofocus="autofocus" class="login-controls txt_left" required
								data-rule-email="true" data-msg-required="请输入email地址"
								data-msg-email="请输入正确的email地址" id="email" name="email" placeholder="请输入注册邮箱"
								size="30" type="text" value="" 	style="	margin-left: 40px;"/>
							</div>
						</div>
						<div class='inputs'>
							<div class='input-group'>
								<div class='input-group-addon left_bc'>
									<span class='glyphicon glyphicon-lock'></span>
								</div>
								<input autocomplete="off" class="login-controls txt-left"
									id="password" name="password" required
									data-msg-required="请输入密码,密码不能为空"
									placeholder="请输入密码" size="30" type="password" 	style="	margin-left: 40px;"/>
							</div>
						</div>
						<div class='input_div'>
							<input class="btn btn-lg btn-block btn_back" name="commit" id="loginBtn"
								type="submit" value="登录"/>
						</div>
						<span> 
							<a style="float: left; margin-left: 169px;  margin-top: 10px;"
							href="${pageContext.request.contextPath}/user/register">未有帐号，立即注册</a></span>
					</form>


				</div>
			</div>
		</div>
	</div>



	<div id='footer-div'>
		<div class='wrapper'>
			<div class='footer-service'>
				<div class='footer-service-title'>客服电话：</div>
				<div class='footer-service-content'>13119314025</div>
			</div>
			<div class='footer-intro'>
				<div class='footer-intro-head'>
					<span class='footer-intro-title'>启学家教网 </span> <span
						class='footer-intro-substitle'> 中小学生家教预约平台 </span>
				</div>
				<p class='footer-desc'>启学家教网 -中小学生家教预约平台
					是一个互联网教育平台。为了学习更有效、为了教育更灵活、更亲切，我们致力于本地化家教教育。在这个平台上，老师和学生可以免费发布信息、随时沟通、灵活教学。学生无论是为了应对升学，攻克难题，还是课外兴趣发展，我们都能提供强大的知识和经验支持。
				</p>
				<p class='footer-desc'>
					<br> Copyright © 2015 - 2017启学家教网
				</p>
			</div>
			<div class='footer-about'>
				<i></i>
				<ul class='footer-list'>
					<li><a> 活动公告 </a></li>
					<li><a> 常见问题 </a></li>
					<li><a> 服务协议 </a></li>
					<li><a> 隐私声明 </a></li>
					<li><a> 商务合作 </a></li>
				</ul>
			</div>
			<div class='footer-contact'>
				<i></i>
				<ul class='footer-list'>
					<li><a> 意见反馈 </a></li>
					<li><a> 官方微信 </a></li>
					<li><a> 新浪微博 </a></li>
					<li><a> 关于我们 </a></li>
					<li><a> 联系我们 </a></li>
				</ul>
			</div>
		</div>
	</div>
</body>
</html>