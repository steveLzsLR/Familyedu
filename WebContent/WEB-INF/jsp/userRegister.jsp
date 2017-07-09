<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>注册-启学家教网</title>
<link href="${pageContext.request.contextPath}/css/userRegister.css"
	media="all" rel="stylesheet" type="text/css" />
<script src="${pageContext.request.contextPath}/js/userRegister.js"
	type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/jquery.validate.js"
	type="text/javascript"></script>
<script>
	$(document).ready(function() {
		$("#new_user").validate();
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


	<div class='preg_cta'>
		<div class='reg_header'>用户注册</div>
		<div class='preg_body'>
			<div class='body_left'>
				<form accept-charset="UTF-8" action="${pageContext.request.contextPath}/user/activate"
					class="form-horizontal" id="new_user" method="post">
					<DIV class=regLine>
						<DIV class=item1>
							<SPAN style="COLOR: red">*</SPAN>电子邮箱&nbsp;(用于登录、<FONT
								style="COLOR: #2d69b4">激活帐号</FONT>及取回密码):
						</DIV>
						<DIV class=item2>
							<INPUT id=cemail name="email" maxLength=50 type=text required
								data-rule-email="true" data-msg-required="请输入email地址"
								data-msg-email="请输入正确的email地址" data-rule-remote="${pageContext.request.contextPath}/user/isRegisterEmail"
								data-msg-remote="该邮箱已被注册">
						</DIV>
					</DIV>
					<br />
					<DIV class=regLine>
						<DIV class=item1>
							<SPAN style="COLOR: red">*</SPAN>用户名(&nbsp;用户名由2-10个字符组成):
						</DIV>
						<DIV class=item2>
							<INPUT id="cname" type="text" name="name" required
								data-msg-required="请输入用户名" minlength="2" maxlength="20"
								data-msg-minlength="用户名长度为2~20个字符">
						</DIV>
					</DIV>
					<br />

					<DIV class=regLine>
						<DIV class=item1>
							<SPAN style="COLOR: red">*</SPAN>密码(密码由6-20个字符组成，区分大小写):
						</DIV>
						<DIV class=item2>
							<INPUT type="password" name="password" id="password" required
								data-msg-required="请输入密码" minlength="6"
								data-msg-minlength="至少输入6个字符" >
						</DIV>
					</DIV>
					<br />
					<DIV class=regLine>
						<DIV class=item1>确认密码：</DIV>
						<DIV class=item2>
							<INPUT type="password" equalTo="#password" name="confirm_password" required data-msg-required="确认密码不能为空" >
						</DIV>
					</DIV>
					<br/>
					<DIV class=regLine>
						<div class='form-group form-gro'>
							<div class='form-controls'>
								<input class="btn btn-success id_item" name="commit"
									type="submit" value="注册" id="registerBtn" />
								<span class='login_btn'> &nbsp;&nbsp;已有帐号，直接 <a href="${pageContext.request.contextPath}/user/login">登录</a>
								</span>
							</div>
						</div>
					</DIV>
				</form>
			</DIV>

		</DIV>


	</div>
	<div class='pbody_pic'></div>


	<div class='pbody_pic'
		style="background-image: url('${pageContext.request.contextPath}/image/registerBg.png')"></div>


	<div id='footer-div'>
		<div class='wrapper'>
			<div class='footer-service'>
				<div class='footer-service-title'>客服电话：</div>
				<div class='footer-service-content'>13119314025</div>
			</div>
			<div class='footer-intro'>
				<div class='footer-intro-head'>
					<span class='footer-intro-title'> 启学家教网 </span> <span
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