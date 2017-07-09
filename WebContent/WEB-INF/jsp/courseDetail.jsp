<%@page import="com.FamilyEdu.Model.Course"%>
<%@page import="com.FamilyEdu.Model.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>首页-启学家教网</title>
<link href="${pageContext.request.contextPath}/css/bootstrap.css"
	rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/css/index.css"
	rel="stylesheet" type="text/css" />
<script src="${pageContext.request.contextPath}/js/jquery-1.11.2.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
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
							location.href =$("#bookingCourse").attr("name");
						}else if (date=="0") {
							alert("账号或密码错误,请重新输入!");
						}
					}
				});	
			});
		});
	</script>
</head>
<body>
	<div id='site-nav'>
		<div class='wrapper' id="noUserWrapper">
			<ul class='status-info'>
				<li>
					<div class='main-link-div'>
						<a class='main-link' href=''> <i
							class='glyphicon glyphicon-home'></i> 首页
						</a>
					</div>
				</li>
				<li>
					<div class='main-link-div'></div>
				</li>
				<li>客服QQ: 1226468643</li>
			</ul>
			<ul class='tag-info'>
				<li><a class='login-link' href='${pageContext.request.contextPath}/user/login'> <i
						class='glyphicon glyphicon-user'></i> 请登录
				</a> <a class='register-link' href='${pageContext.request.contextPath}/user/register'> 免费注册 </a></li>
			</ul>
		</div>
		<div class='wrapper' id="hasUserWrapper">
			<ul class='status-info'>
				<li>
					<div class='main-link-div'>
						<a class='main-link' href='${pageContext.request.contextPath}/'> 
						<i
							class='glyphicon glyphicon-home'>
							</i> 首页
						</a>
					</div>
				</li>
				<li>
					<div class='main-link-div'>
						<a class='login-link' href='${pageContext.request.contextPath}/user/myFamilyEduSelect'>
							个人中心 </a>
					</div>
				</li>
				<li>
					<div class='main-link-div'></div>
				</li>
				<li>客服QQ: 1226468643</li>
			</ul>
			<ul class='tag-info'>
				<li><a class='login-link'
					href='${pageContext.request.contextPath}/user/myFamilyEduSelect'> <i
						class='glyphicon glyphicon-user'></i> ${ sessionScope.user.username}
				</a> <a class='register-link' href='${pageContext.request.contextPath}/user/loginout'> 退出 </a></li>
			</ul>
		</div>
	</div>
	<div class='autowidth' id='header'>
		<div class='wrapper'>
			<div class='header-search'>
				<form accept-charset="UTF-8" action="${pageContext.request.contextPath}/user/search" method="post">
					<div class='header-search-form'>
						<i class='glyphicon glyphicon-search'></i> 
						<input type="hidden" name="page" value="1">
						<input type="hidden" name="sPeriod" value="0">
						<input type="hidden" name="sGender" value="0">
						<input type="hidden" name="sTeachMethod" value="0">
						<input
							class='header-search-input' name='keyword'
							placeholder='输入搜索你想学的课程试试'> <input
							class="header-search-btn" name="commit" type="submit" value="搜索" />
					</div>
				</form>

			</div>
			<div class='header-logo'>
				<a href='${pageContext.request.contextPath}/'> <img alt="启学家教网" class="header-logo-img"
					src="${pageContext.request.contextPath}/image/logo2.png" />
				</a>
			</div>
		</div>
	</div>

	<div id='details-nav'></div>
	<div id='details-info'>
		<div class='wrapper'>
			<div class='details-info-div'>
				<div class='details-header-box'>
					<div class='details-header-box1'>
						<div class='course-list-box-left-detail'>
							<img alt="Normal_a9ea805f96310cd1e9a7e06811099c296fc3bd98"
								src="${pageContext.request.contextPath}${course.createUser.userImage }" />
						</div>
					</div>
					<div class='details-header-box2'>
						<img alt="Xlrz" class="details-first-s-img"
							src="${pageContext.request.contextPath}/image/prove1.png"
							title="学历认证" /> <span class='details-first-s-name'>学历认证</span> <img
							alt="Sfrz" class="details-first-s-img"
							src="${pageContext.request.contextPath}/image/prove2.png"
							title="身份认证" /> <span class='details-first-s-name'>身份认证</span>
					</div>
				</div>
				<div class='details-first-div'>
					<div class='details-first-f'>${course.createUser.username }</div>
				</div>
				<div class='details-second-div'>
					<div class='details-second-f'>所在学校：</div>
					<div class='details-second-s'>${course.createUser.school }-
						${course.createUser.major } - ${course.createUser.grade }</div>
				</div>
				<div class='details-second-div'>
					<div class='details-second-f'>授课类型：</div>
					<div class='details-second-s'>${course.teachType }</div>
					<div class='details-second-f'>授课方式：</div>
					<div class='details-second-s'>${course.teachMethod }</div>
				</div>
				<div class='details-second-div' style="width: 800px;">
					<div class='details-second-f'>授课经验：</div>
					<div class='details-second-s'>${course.createUser.teachYear }年教龄</div>
					<div class='details-second-f'>教学科目：</div>
					<div class='details-second-s2'>${course.teachPeriod }${course.teachGrade }${course.teachSubject }</div>
				</div>
				<div class='details-second-div' style="width: 800px;">
					<div class='details-second-f'>适教时间：</div>
					<div class='details-second-s2'>${course.freeTime }</div>
					<a class="btn btn-warning" style="float: right;" id="bookingCourse" name="${pageContext.request.contextPath}/user/myFamilyEduS/order/booking/${course.id}" >预约课程</a>
				</div>
			</div>
		</div>

	</div>

	<div id='details-list-box'>
		<div class='wrapper'>
			<div class='container-fluid'>
				<div class='row'>
					<div class='col-md-9' style="width: 1130px;">
						<div class='col-md-12 info-title info-bd info-pdlr'>
							<ul class='nav nav-pills'>
								<li role='presentation'><a class='font-black'
									href='#namecard'> 我的名片 </a></li>
								<li role='presentation'><a class='font-black'
									href='#studyresult'> 学习成果 </a></li>
								<li role='presentation'><a class='font-black'
									href='#experience'> 教学经历 </a></li>
							</ul>
						</div>
						<div class='col-md-12 info-pdlr'>
							<div class='col-md-12 info-content info-mgb'
								style="background-color: #F6F8FF;">
								<div class='col-md-12 info-bbtm'>
									<h4>
										<span class='glyphicon glyphicon-user'></span> <a
											class='font-black' name='namecard'> 我的名片 </a>
									</h4>
								</div>
								<div class='col-md-12'>
									<h5>
										<div class='col-md-2 info-mgb'>
											<span class='text-muted'> 姓名： </span>
											${course.createUser.username }
										</div>
										<div class='col-md-2'>
											<span class='text-muted'> 年龄： </span> ${course.createUser.age }
										</div>
										<div class='col-md-2'>
											<span class='text-muted'> 性别： </span>
											${course.createUser.gender }
										</div>
										<div class='col-md-12 info-mgb'>
											<span class='text-muted'> 现居地点： </span> ${course.homeArea }
										</div>
										<div class='col-md-12 info-mgb subject-content'>
											<span class='text-muted'> 教学科目： </span>
											${course.teachPeriod }${course.teachGrade }${course.teachSubject}
										</div>
										<div class='col-md-12 info-mgb'>
											<span class='text-muted'> 我的简介： </span>
										</div>
										<div class='col-md-12 info-mgb introduction content-height'>${course.createUser.introduction }</div>
									</h5>
								</div>
							</div>
							<div class='col-md-12 info-pdlr info-mgb info-content'
								style="background-color: #F6F8FF;">
								<div class='row'>
									<div class='col-md-12'>
										<div class='col-md-12 info-bbtm'>
											<h4>
												<span class='glyphicon glyphicon-book'></span> <a
													class='font-black' name='studyresult'> 我的学习成果 </a>
											</h4>
										</div>
									</div>
								</div>
								<div class='col-md-12'>
									<div class='col-md-12 text-center'>
										<h4>
											<span class='glyphicon glyphicon-bookmark'></span> 我的荣誉
										</h4>
									</div>
									<div class='col-md-12'>
										<c:forEach items="${sessionScope.achievements}"
											var="achievement">
											<div class='col-md-3'>
												<div class='thumbnail honor-img'>
													<div class='img-h'>
														<img alt="Normal_acf72ca6969600c66711214d2ae1adaa4400da45"
															height="170px" src="${pageContext.request.contextPath}${achievement.achievementImage}"
															width="100%" />
													</div>
													<div class='caption text-center'>${achievement.title}</div>
												</div>
											</div>
										</c:forEach>
									</div>
								</div>
							</div>
							<div class='col-md-12 info-pdlr info-mgb info-content'
								style="background-color: #F6F8FF;">
								<div class='row'>
									<div class='col-md-12'>
										<div class='col-md-12 info-bbtm'>
											<h4>
												<span class='glyphicon glyphicon-time'> <a
													class='font-black' name='experience'> 我的教学经历 </a>
												</span>
											</h4>
										</div>
									</div>
								</div>
								<c:forEach items="${sessionScope.experiences}" var="experience">
									<div class='col-md-12'>
										<div class='qa-message-list'>
											<div class='message-item'>
												<div class='message-inner'>
													<div class='message-head clearfix'>${experience.beginDate }
														到 ${experience.endDate } | 学生：${experience.studentName } |
														学校：${experience.studentSchool } |
														辅导科目：${experience.teachSubject }</div>
													<div class='qa-message-content'>${experience.teachExperience }</div>
												</div>
											</div>
										</div>
									</div>
								</c:forEach>
							</div>
							
							<div class='col-md-12 info-pdlr info-mgb info-content'
								style="background-color: #F6F8FF;">
								<div class='row'>
									<div class='col-md-12'>
										<div class='col-md-12 info-bbtm'>
											<h4>
												<span class='glyphicon glyphicon-time'> <a
													class='font-black' name='experience'> 我的教学评价</a>
												</span>
											</h4>
										</div>
									</div>
								</div>
								<c:forEach items="${sessionScope.orderComments}" var="comment">
									<div class='col-md-12'>
										<div class='qa-message-list'>
											<div class='message-item'>
												<div class='message-inner'>
													<div class='qa-message-content'>${comment.comment }</div>
												</div>
											</div>
										</div>
									</div>
								</c:forEach>
								
							</div>
						</div>

					</div>
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
					<br> Copyright © 2015 - 2017 启学家教网
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
		function noUser() {
			jQuery("#bookingCourse").attr({
				"data-toggle" : "modal",
				"data-target" : "#myModal"
			});
			jQuery("#bookingCourse").removeAttr("href");
			jQuery("#noUserWrapper").show();
			jQuery("#hasUserWrapper").hide();
		}
		function hasUser() {
			jQuery("#bookingCourse").attr("href",
					"${pageContext.request.contextPath}/user/myFamilyEduS/order/booking/${course.id}");
			jQuery("#bookingCourse").removeAttr("data-toggle");
			jQuery("#bookingCourse").removeAttr("data-target");
			jQuery("#hasUserWrapper").show();
			jQuery("#noUserWrapper").hide();
		}
		function sameUser() {
			jQuery("#bookingCourse").attr("disabled",
					"true");
			
		}
	</script>
	<%
		if (session.getAttribute("user") == null) {
			out.print("<script type='text/javascript'>noUser();</script>");
		}
		if (session.getAttribute("user") != null) {
			out.print("<script type='text/javascript'>hasUser();</script>");
		}
		User u=(User)request.getSession().getAttribute("user");
		Course c=(Course)request.getSession().getAttribute("course");
		if(u!=null&&c.getCreateId().equals(u.getId()+"")){
			out.print("<script type='text/javascript'>sameUser();</script>");
		}
	%>
	<!-- 模态框（Modal） -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel">用户登录</h4>
				</div>
				<div class="modal-body">
				
						<div style="margin: 0; padding: 0; display: inline">
						</div>
						<div class='inputs'>
							<div class='input-group'>
								<div class='input-group-addon left_bc'>
									<span class='glyphicon glyphicon-user'></span>
								</div>
								<input autofocus="autofocus" class="login-controls txt_left"
									 name="email" placeholder="请输入注册邮箱" id="email"
									size="30" type="text" />
							</div>
						</div>
						<div class='inputs'>
							<div class='input-group'>
								<div class='input-group-addon left_bc'>
									<span class='glyphicon glyphicon-lock'></span>
								</div>
								<input autocomplete="off" class="login-controls txt-left"
									name="password"
									placeholder="请输入密码" size="30" type="password" id="password"/>
							</div>
						</div>
						<div class='input_div'>
							<input class='btn btn-lg btn-block btn_back' id="loginBtn"
								 type='button' value='登录'>
						</div>
						<div class='input_div'>
							<div class='row'>
								<div class='col-md-4 col-md-offset-4 reg_align' style="float: right;">
									<a href="${pageContext.request.contextPath}/user/register" class="login_reg">用户注册</a>
								</div>
							</div>
						</div>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal -->
	</div>
</body>
</html>