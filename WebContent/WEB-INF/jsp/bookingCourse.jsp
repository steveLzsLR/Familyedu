<%@page import="com.FamilyEdu.Model.Course"%>
<%@page import="com.FamilyEdu.Model.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>个人中心-启学家教网</title>
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


</head>
<body>
	<div id='site-nav'>
		<div class='wrapper' id="hasUserWrapper">
			<ul class='status-info'>
				<li>
					<div class='main-link-div'>
						<a class='main-link' href='${pageContext.request.contextPath}/'> <i
							class='glyphicon glyphicon-home'></i> 首页
						</a>
					</div>
				</li>
				<li>
					<div class='main-link-div'>
						<a class='login-link' href='${pageContext.request.contextPath}/user/myFamilyEduS'>
							个人中心 </a>
					</div>
				</li>
				<li>
					<div class='main-link-div'></div>
				</li>
				<li>客服QQ: 1226468643</li>
			</ul>
			<ul class='tag-info'>
				<li><a class='login-link' href='${pageContext.request.contextPath}/user/myFamilyEduS'>
						<i class='glyphicon glyphicon-user'></i> ${ sessionScope.user.username}
				</a> <a class='register-link' href='${pageContext.request.contextPath}/user/loginout'> 退出 </a></li>
			</ul>
		</div>
	</div>
	<div id='p_header'>
		<div class='p_wrapper'>
			<div class='p_logo'>
				<a href='${pageContext.request.contextPath}/'> <img alt="启学家教网" class="header-logo-img2"
					src="${pageContext.request.contextPath}/image/logo2.png" />
				</a>
			</div>
			<img alt="用户头像" class="p_title_img"
				src="${pageContext.request.contextPath}${sessionScope.user.userImage}" />
			<div class='p_title'>个人主页</div>
		</div>
	</div>

	<div class='p_main'>
		<div class='p_wrapper'>
			<div class='p_menu'>
				<div class='p_block'>
					<div class='p_block_title'>
						<h4>我的信息</h4>
					</div>
				</div>
				<div class='p_block'>
					<ul class='nav'>
						<li><a href='${pageContext.request.contextPath}/user/myFamilyEduS'> <i
								class='glyphicon glyphicon-user'></i> 用户中心
						</a></li>
						<li><a href='${pageContext.request.contextPath}/user/myFamilyEduS/base'> <span
								class='pnav-left'> 基本信息 </span>
						</a></li>
						<li><a href='${pageContext.request.contextPath}/user/myFamilyEduS/student'> <span
								class='pnav-left'> 学生信息</span>
						</a></li>
						<li><a href='${pageContext.request.contextPath}/user/myFamilyEduS/userPassword'>
								<i class='pnav-left'></i> 密码修改
						</a></li>
					</ul>
				</div>
				<div class='p_block'>
					<div class='p_block_title'>
						<h4>我的订单</h4>
					</div>
				</div>
				<div class='p_block'>
					<ul class='nav'>
						<li><a href='javascript:void(0);' class='p_active'> <i
								class='glyphicon glyphicon glyphicon-pencil'></i> 生成订单
						</a><a href='${pageContext.request.contextPath}/user/myFamilyEduS/order'> <i
								class='glyphicon glyphicon-align-justify'></i> 全部订单
						</a> <a href='${pageContext.request.contextPath}/teachers/order_unpay'> <i
								class='glyphicon glyphicon-time'></i> 待确认的订单
						</a> <a href='/teachers/order_reserving'> <i
								class='glyphicon glyphicon glyphicon-check'></i> 已确认的订单
						</a>
					</ul>
				</div>
				<div class='p_block'></div>
			</div>

			<div class='p_content'>
				<div class='p_block'>
					<div class='p_block_title p_content_block_title'>
						<h4>
							<i class='glyphicon glyphicon-pencil'></i> 生成订单
						</h4>
					</div>
				</div>
				<div class="p_block">
					<form accept-charset="UTF-8" id="addOrder"
						action="${pageContext.request.contextPath}/user/myFamilyEduS/order/addOrder"
						class="form-horizontal" method="post">
						<input name="teacherId" type="hidden" value="${bookCourse.createUser.id }" />
						<div class='order-step-title' style="width: 880px;">第一步：确认课程信息</div>
						<div class='order-step-info' style="width: 880px;">
							<div class='order-info-image'>
								<img class="img-circle"
									src="${pageContext.request.contextPath}${bookCourse.createUser.userImage }" />
							</div>
							<div class='order-info-teacher'>
								<p class='order-info-title'>${bookCourse.createUser.username }</p>
								<p>${bookCourse.createUser.school }</p>
								<p>联系方式：${bookCourse.createUser.phoneNum}</p>
							</div>
							<div class='order-info-course'>
								<p>课程：${bookCourse.teachSubject}</p>
								<p>适教时间：${bookCourse.freeTime}</p>
							</div>
						</div>
						<div class='order-step-title' style="width: 880px;">第二步：确认联系方式</div>
						<div class='order-step-content' style="width: 880px;">
							<div class='form-group'>
								<label class="col-md-2 col-xs-2 control-label">联系人</label>
								<div class='col-md-4 col-xs-4'>
									<input class="form-control" size="30" type="text"
										value="${user.username }" disabled="disabled" />
								</div>
							</div>
							<div class='form-group'>
								<label class="col-md-2 col-xs-2 control-label">联系电话</label>
								<div class='col-md-4 col-xs-4'>
									<input class="form-control" size="30" type="text"
										value="${user.phoneNum }" disabled="disabled" />
								</div>
							</div>
							<div class='form-group'>
								<label class=" col-md-2 col-xs-2 control-label">授课地址</label>
								<div class='col-md-4 col-xs-4'>
									<input class="form-control" value="${user.address }"
										disabled="disabled" size="30" type="text" />
								</div>
							</div>
						</div>
						<div class='order-step-title' style="width: 880px;">第三步：填写授课详细信息</div>
						<div class='order-step-content' style="width: 880px;">
							<div class='form-group'>
								<label class="col-md-2 col-xs-2 control-label">选择辅导学生</label>
								<div class='col-md-4 col-xs-4'>
									<c:forEach items="${myStudents}" var="myStudent">
										<label class='radio-inline'> <input id="teacher_sex_1"
											name="stuId" type="radio" value="${myStudent.id}" required/>
											${myStudent.stuName}
										</label>
									</c:forEach>
								</div>
							</div>
							<div class='form-group'>
								<label class="col-md-2 col-xs-2 control-label">选择教学时间</label>
								<div class='col-md-4 col-xs-4'>
									<input class="form-control sel_time" id="teachDate"
										name="teachDate" placeholder="选择教学时间" size="30" type="text"
										required />
								</div>
							</div>
							<div class='form-group'>
								<label class="col-md-2 col-xs-2 control-label">填写补习课程</label>
								<div class='col-md-4 col-xs-4'>
									<input class="form-control" 
										name="teachSubject"  type="text"
										value="" size="30" placeholder="填写补习课程" required/>
								</div>
							</div>
						</div>
						

						<div class='order-step-title' style="width: 880px;">
							<div class='form-group' style="width:800px;">
								<div class='col-md-2 col-xs-2' style="float: right;">
									<input class="btn  btn-warning" name="commit"
										type="submit" value="提交订单" id="commitOrder"/>
								</div>
							</div>
						</div>
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
	<script type="text/javascript">
	jQuery('#teachDate').datepicker({
		minDate:new Date()
		
	});
	
	jQuery("#addOrder").validate();
	function sameUser() {
		jQuery("#commitOrder").attr("disabled",
				"true");
		
	}
</script>
<%
User u=(User)request.getSession().getAttribute("user");
Course c=(Course)request.getSession().getAttribute("bookCourse");
if(u!=null&&c.getCreateId().equals(u.getId()+"")){
	out.print("<script type='text/javascript'>sameUser();</script>");
}
%>
</body>
</html>