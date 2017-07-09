<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>订单详情</title>
<link href="${pageContext.request.contextPath}/css/jquery-ui.css"
	rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/css/bootstrap.css"
	rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/css/index.css"
	rel="stylesheet" type="text/css" />
<script src="${pageContext.request.contextPath}/js/jquery.validate.js"
	type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery-1.11.2.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery-ui.js"
	type="text/javascript"></script>


<%
	if (session.getAttribute("user") == null) {
		response.sendRedirect(request.getContextPath()+"/user/login");
	}
%>

</head>
<body>



	<div
		style="width: 910px; height:900px; padding: 0px; border: 1px solid #dfdfdf; margin:0px auto; background-color: #fdfdfe">
		<div class='p_block'>
			<div class='p_block_title p_content_block_title'>
				<h4>
					<i class='glyphicon glyphicon-pencil'></i> 订单详情
				</h4>
			</div>
		</div>
		<div class="p_block">
				<div class='order-step-title' style="width: 880px;">家教信息</div>
				<div class='order-step-info' style="width: 880px;">
					<div class='order-info-image' style="padding-left: 0px;width: 150px;padding-top: 10px;">
						<img class="img-circle" src="${pageContext.request.contextPath}${order.teacher.userImage }" />
					</div>
					<div class='order-info-teacher'>
						<p class='order-info-title'>${order.teacher.username }</p>
						<p>${order.teacher.school }</p>
						<p>性别：${order.teacher.gender}</p>
					</div>
					<div class='order-info-teacher'>
						<p>年龄：${order.teacher.age}</p>
						<p>年级：${order.teacher.grade}</p>
					</div>
					<div style="padding-top: 30px">
						<p>联系方式：${order.teacher.phoneNum}</p>
						<p>专业：${order.teacher.major}</p>
					</div>
				</div>
				<div class='order-step-title' style="width: 880px;">家长信息</div>
				<div class='order-step-info' style="width: 880px;">
					<div class='order-info-image' style="padding-left: 0px;width: 150px;padding-top: 10px;">
						<img class="img-circle" src="${pageContext.request.contextPath}${order.parent.userImage }" />
					</div>
					<div class='order-info-teacher' style="padding-top: 50px;width: 120px;">
						<p class='order-info-title'>${order.parent.username }</p>
					</div>
					<div class='order-info-teacher' style="padding-top: 52px;">
						<p >联系方式：${order.parent.phoneNum }</p>
					</div>
					<div class='order-info-teacher' style="padding-top: 52px;padding-left: 20px;">
						<p >居住地区：${order.parent.address }</p>
					</div>
				</div>
				<div class='order-step-title' style="width: 880px;">学生信息</div>
				<div class='order-step-content' style="width: 880px;padding-left: 80px;margin-bottom: 10px;">
					<div class='order-info-teacher' style="width: 120px; margin-right: 30px;">
						<p class='order-info-title' style="width: 120px; margin-right: 30px;">${order.student.stuName}</p>
					</div>
					<div class='order-info-teacher' style="padding-top: 30px">
						<p>年级：${order.student.stuGrade}</p>
						<p>年龄：${order.student.stuAge}</p>
					</div>
					<div class='order-info-teacher' style="padding-top: 30px">
						<p>学校：${order.student.stuSchool}</p>
						<p>性别：${order.student.stuGender}</p>
					</div>
				</div>
				<div class='order-step-content' style="width: 880px;padding-left: 80px;min-height: 30px;margin-top: 0px;">
				学生简介：${order.student.stuInfo}
				</div>
				<div class='order-step-title' style="width: 880px;">课程信息</div>
				<div class='order-step-content' style="width: 880px;margin-left: 0px;padding-left: 100px;">
					<div class='order-info-teacher' style="padding-top: 30px;">
						<p>教授课程：${order.teachSubject}</p>
					</div>
					<div class='order-info-teacher' style="padding-top: 30px">
						<p>教授时间：${order.teachDate}</p>
					</div>
					<c:if test="${order.status==0 }">
					<div class='order-info-teacher' style="padding-top: 30px">
						<p>订单状态：订单未确认</p>
					</div>
					</c:if>
					<c:if test="${order.status==1 }">
					<div class='order-info-teacher' style="padding-top: 30px">
						<p>订单状态：订单已确认</p>
					</div>
					</c:if>
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
	<script type="text/javascript">
		jQuery('#teachDate').datepicker({
			minDate : new Date()

		});

		jQuery("#addOrder").validate();
	</script>
</body>
</html>