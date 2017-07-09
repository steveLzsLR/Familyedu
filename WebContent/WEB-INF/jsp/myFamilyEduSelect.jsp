<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>个人中心-启学家教网</title>
<link href="${pageContext.request.contextPath}/css/register.css" media="all" rel="stylesheet" type="text/css" />
<script src="${pageContext.request.contextPath}/js/register.js" type="text/javascript"></script>
<%
	if (session.getAttribute("user") == null) {
		response.sendRedirect(request.getContextPath()+"/user/login");
	}
%>
</head>
<body>
	<div class='bigbar-header autowidth'>
		<div class='bigbar-wrapper'>
			<h1>
				<a href='${pageContext.request.contextPath}/'> <img alt="启学家教网" class="bigbar-logo-img"
					src="${pageContext.request.contextPath}/image/logo2.png"" />
				</a>
			</h1>
			<h2>
				你好，欢迎来到家教网！
			</h2>
		</div>
	</div>


	<div class='reg_cnt'>
		<div class='preg_img' style="background-image: url(${pageContext.request.contextPath}/image/registerStudent.png)">
			<img alt="Pword" class="pword"
				src="${pageContext.request.contextPath}/image/registerStudentWord.png" /> 
				<a
				href="myFamilyEduS" class="btn btn-lg btn-success preg_btn">我是家长</a>
		</div>
		<div class='split_line'></div>
		<div class='treg_img' style="background-image: url(${pageContext.request.contextPath}/image/registerTeacher.png)">
			<img alt="Tword" class="tword"
				src="${pageContext.request.contextPath}/image/registerTeacherWord.png" /> <a
				href="myFamilyEduT" class="btn btn-lg btn-success reg_btn">我是教师</a>
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
				<p class='footer-desc'>
					启学家教网 -中小学生家教预约平台 是一个互联网教育平台。为了学习更有效、为了教育更灵活、更亲切，我们致力于本地化家教教育。在这个平台上，老师和学生可以免费发布信息、随时沟通、灵活教学。学生无论是为了应对升学，攻克难题，还是课外兴趣发展，我们都能提供强大的知识和经验支持。
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