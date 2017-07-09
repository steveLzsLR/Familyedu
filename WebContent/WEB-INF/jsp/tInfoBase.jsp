<%@page import="com.FamilyEdu.Model.User"%>
<%@page import="javafx.scene.control.Alert"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>个人中心-启学家教网</title>
<link href="${pageContext.request.contextPath}/css/bootstrap.css"
	rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/css/index.css"
	rel="stylesheet" type="text/css" />
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery-1.11.2.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.validate.js"
	type="text/javascript"></script>
<script>
	$(document).ready(function() {
		$("#edidTBaseInfo").validate();
	});
	$(document).ready(function() {
		$("#updateImages").validate();
	});
	$(document).ready(function() {
		$("#updateUserImage").validate();
	});
	$(document).ready(function() {
		$("#updateTBaseInfo").validate();
	});
</script>
<%
	if (session.getAttribute("user") == null) {
		response.sendRedirect(request.getContextPath()+"/user/login");
	}
%>
<style type="text/css">
#grade {
	width: 113px;
	height: 34px;
}
</style>
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
						<a class='login-link' href='${pageContext.request.contextPath}/user/myFamilyEduT'> 个人中心 </a>
					</div>
				</li>
				<li>
					<div class='main-link-div'></div>
				</li>
				<li>客服QQ: 1226468643</li>
			</ul>
			<ul class='tag-info'>
				<li><a class='login-link' href='${pageContext.request.contextPath}/user/myFamilyEduT'> <i
						class='glyphicon glyphicon-user'></i> ${ sessionScope.user.username}
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
						<li><a href='${pageContext.request.contextPath}/user/myFamilyEduT'> <i
								class='glyphicon glyphicon-user'></i> 用户中心
						</a></li>
						<li><a class='p_active'
							href='${pageContext.request.contextPath}/user/myFamilyEduT/base'> <span
								class='pnav-left'> 基本信息 </span>
						</a></li>
						<li><a href='${pageContext.request.contextPath}/user/myFamilyEduT/achievement'> <span
								class='pnav-left'> 学习成果 </span>
						</a></li>
						<li><a href='${pageContext.request.contextPath}/user/myFamilyEduT/experience'> <span
								class='pnav-left'> 教学经历 </span>
						</a></li>
						<li><a href='${pageContext.request.contextPath}/user/myFamilyEduT/userPassword'>
								<i class='pnav-left'></i> 密码修改
						</a></li>
					</ul>
				</div>
				<div class='p_block'>
					<div class='p_block_title'>
						<h4>我的课程</h4>
					</div>
				</div>
				<div class='p_block'>
					<ul class='nav'>
						<li><a 
							href='${pageContext.request.contextPath}/user/myCourses/release'> <i
								class='glyphicon glyphicon-circle-arrow-up'></i> 我的课程
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
						<li><a href='${pageContext.request.contextPath}/user/myFamilyEduT/order?page=1'> <i
								class='glyphicon glyphicon-align-justify'></i> 全部订单
						</a> <a href='${pageContext.request.contextPath}/user/myFamilyEduT/order/unconfirmed?page=1'> <i
								class='glyphicon glyphicon-time'></i> 待确认的订单
						</a> <a href='${pageContext.request.contextPath}/user/myFamilyEduT/order/confirmed?page=1'> <i
								class='glyphicon glyphicon glyphicon-check'></i> 已确认的订单
						</a>
					</ul>
				</div>
				<div class='p_block'></div>
			</div>

			<div class='p_content' id="noValidateImage">
				<div class='p_block'>
					<div class='p_block_title p_content_block_title'>
						<h4>
							<i class='glyphicon-color glyphicon glyphicon-circle-arrow-up'>
								基本信息 </i>
						</h4>
					</div>
				</div>
				<div class='p_block'>
					<div class='t_main'>
						<div class='t_right'>
							<div class='show'>
								<div class='panel-body'>
									<form accept-charset="UTF-8"
										action="${pageContext.request.contextPath}/user/myFamilyEduT/base/updateImages"
										class="form-horizontal tpadding" enctype="multipart/form-data"
										id="updateImages" method="post">
										<h4 class='text-danger'>
											1.资格认证和个人基本信息将作为资格审核的重要依据，请认真填写，资格审核通过才能发布课程</h4>
										<h4 class='text-danger'>2.仅当个人头像、个人证件、教学证件全部上传完毕后才会进行资格审核</h4>
										<div class='form-group te-mgb'>
											<div class='col-md-12 info-bottom'>
												<div class='col-md-8'>
													<h4>
														1.资格认证 <span class='font-orange'> (*必填) </span>
													</h4>
												</div>
											</div>
											<div class='col-md-11'>

												<div class='col-md-6'>
													<div class='panel panel-default basicpanel-height b-radius'>
														<div class='panel-heading b-radius'>
															<strong>个人头像</strong>
														</div>
														<div class='panel-body text-danger'>
															<div class='row'>
																<div class='col-md-6'>
																	<img alt="User" class="img-circle" height="120px"
																		src="${pageContext.request.contextPath}/image/userImg.png"
																		width="120px" />
																</div>
																<div class='col-md-6 tp-left'>
																	<P>1.请使用近期个人照片</P>
																	<p>2.照片不大于3M</p>
																	<p style="color: #C00;">
																		<input id="userImage" name="userImage" type="file"
																			required data-msg-required="进行资格认证个人照片不能为空"
																			accept="image/*" />
																	</p>
																</div>
															</div>
														</div>
													</div>
												</div>
												<div class='col-md-6'>
													<div class='panel panel-default basicpanel-height b-radius'>
														<div class='panel-heading b-radius'>
															<strong>个人证件(*必填，否则无法发布课程)</strong>
														</div>
														<div class='panel-body text-danger'>
															<div class='row'>
																<div class='col-md-6'>
																	<img alt="Paper" class="img-circle" height="120px"
																		src="${pageContext.request.contextPath}/image/userImg3.png"
																		width="120" />
																</div>
																<div class='col-md-6 tp-left'>
																	<p>1.身份证正面图片</p>
																	<p>2.请确保图片清晰可见</p>
																	<p>3.照片不大于3M</p>
																	<p style="color: #C00;">
																		<input id="idImage" name="idImage" accept="image/*"
																			type="file" required
																			data-msg-required="进行资格认证个人证件不能为空" />
																	</p>
																</div>
															</div>
														</div>
													</div>
												</div>
												<div class='col-md-6'>
													<div class='panel panel-default basicpanel-height b-radius'>
														<div class='panel-heading b-radius'>
															<strong>教学证件(*必填，否则无法发布课程)</strong>
														</div>
														<div class='panel-body text-danger'>
															<div class='row'>
																<div class='col-md-6'>
																	<img alt="Paper" class="img-circle" height="120px"
																		src="${pageContext.request.contextPath}/image/userImg2.png"
																		width="120" />
																</div>
																<div class='col-md-6 tp-left'>
																	<p>1.学生使用学生证</p>
																	<p>2.家教使用教师资格证</p>
																	<p>3.照片不大于3M</p>
																	<p style="color: #C00;">
																		<input id="teachImage" name="teachImage"
																			accept="image/*" type="file" required
																			data-msg-required="进行资格认证教学证件不能为空" />
																	</p>
																</div>
															</div>
														</div>
													</div>
												</div>
												<div class='col-md-6'>
													<input class=" btn btn-success" type="submit"
														value="进行资格审核"
														style="margin-top: 80px; margin-left: 100px;" />
												</div>
											</div>
										</div>
									</form>
									<form accept-charset="UTF-8"
										action="${pageContext.request.contextPath}/user/myFamilyEduT/base/updateUserImage"
										class="form-horizontal tpadding" enctype="multipart/form-data"
										id="updateUserImage" method="post">
										<h4 class='text-danger'>1.用户已通过资格认证,完善个人基本信息后可以发布课程</h4>
										<div class='form-group te-mgb'>
											<div class='col-md-12 info-bottom'>
												<div class='col-md-8'>
													<h4>1.修改个人头像</h4>
												</div>
											</div>
											<div class='col-md-11'>

												<div class='col-md-6'>
													<div class='panel panel-default basicpanel-height b-radius'>
														<div class='panel-heading b-radius'>
															<strong>个人头像</strong>
														</div>
														<div class='panel-body text-danger'>
															<div class='row'>
																<div class='col-md-6'>
																	<img alt="User" class="img-circle" height="120px"
																		src="${pageContext.request.contextPath}${sessionScope.user.userImage}" width="120px" />
																</div>
																<div class='col-md-6 tp-left'>
																	<P>1.请使用近期个人照片</P>
																	<p>2.照片不大于3M</p>
																	<p style="color: #C00;">
																		<input id="userImage" name="userImage" type="file"
																			required data-msg-required="修改头像图片不能为空" />
																	</p>
																</div>
															</div>
														</div>
													</div>
												</div>
												<div class='col-md-6'>
													<input class=" btn btn-success" type="submit"
														value="修改用户头像"
														style="margin-top: 80px; margin-left: 100px;" />
												</div>
											</div>
										</div>
									</form>
									<div id="ingValidateImage">
										<div class='col-md-12 info-bottom'>
											<div class='col-md-8'>
												<h4>
													1.资格认证 <span class='font-orange'> (*必填) </span>
												</h4>
											</div>
										</div>
										<h4 class='text-danger'>
											1.用户正在进行资格审核中，我们将会在两个工作日之内对用户信息进行审核，并将以邮件的形式进行通知，请注意注册邮箱邮件！</h4>
										<h4 class='text-danger'>2.用户通过资格审核后才能发布课程</h4>
									</div>
									<form accept-charset="UTF-8"
										action="${pageContext.request.contextPath}/user/myFamilyEduT/base/updateUserInfo"
										class="form-horizontal tpadding" enctype="multipart/form-data"
										id="edidTBaseInfo" method="post">
										<div class='col-md-12 info-bottom'>
											<div class='col-md-4'>
												<h4>
													2.个人基本信息 <span class='font-orange'> (*必填) </span>
												</h4>
											</div>
										</div>
										<input type="hidden" name="id"
											value="${sessionScope.user.id }">
										<div class='col-md-11'>
											<div class='row'>
												<div class='col-md-4'>
													<div class='form-group'>
														<label class="col-md-5 control-label " for="teacher_姓名：">姓名：</label>
														<div class='col-md-7' style="color: #c00;">
															<input class="form-control" id="teacher_name" name="name"
																required data-msg-required="请输入用户名" minlength="2"
																maxlength="20" data-msg-minlength="用户名长度为2~20个字符"
																value="${sessionScope.user.username }" />
														</div>
													</div>
												</div>
												<div class='col-md-4'>
													<div class='form-group'>
														<label class="col-md-5 control-label " for="teacher_年龄：">年龄：</label>
														<div class='col-md-7' style="color: #c00;">
															<input class="form-control" id="teacher_age" name="age"
																type="number" value="${sessionScope.user.age }" />
														</div>
													</div>
												</div>
												<div class='col-md-4'>
													<div class='form-group'>
														<label class="col-md-5 control-label" for="teacher_性别：">性别：</label>
														<div class='col-md-7'>
															<label class='radio-inline'> <input
																id="teacher_sex_1" name="gender" type="radio" value="男" />
																男
															</label> <label class='radio-inline'> <input
																id="teacher_sex_2" name="gender" type="radio" value="女" />
																女
															</label>
														</div>
													</div>
												</div>
											</div>
										</div>
										<div class='col-md-11'>
											<div class='row'>
												<div class='col-md-4'>
													<div class='form-group'>
														<label class="col-md-5 control-label"
															for="student_identity_学校：">学校：</label>
														<div class='col-md-7' style="color: #c00;">
															<input class="form-control" id="student_identity_school"
																name="school" size="30" type="text" required
																data-msg-required="学校一栏不能为空，所在学校或毕业院校"
																value="${sessionScope.user.school }" />
														</div>
													</div>
												</div>
												<div class='col-md-4'>
													<div class='form-group'>
														<label class="col-md-5 control-label"
															for="student_identity_年级：">年级：</label>
														<div class='col-md-7' style="color: #c00;">
															<select name="grade" required id="grade"
																style="color: black;" data-msg-required="年级一栏不能为空"
																class="grade">
																<option value="">--选择年级--</option>
																<option value="高一">高一</option>
																<option value="高二">高二</option>
																<option value="高三">高三</option>
																<option value="大一">大一</option>
																<option value="大二">大二</option>
																<option value="大三">大三</option>
																<option value="大四">大四</option>
																<option value="在读研究生">在读研究生</option>
																<option value="在读博士">在读博士</option>
																<option value="已毕业">已毕业</option>
																<option value="在教教师">在教教师</option>
															</select>

														</div>
													</div>
												</div>
												<div class='col-md-4'>
													<div class='form-group'>
														<label class="col-md-5 control-label"
															for="student_identity_专业：">专业：</label>
														<div class='col-md-7' style="color: #c00;">
															<input class="form-control" id="student_identity_major"
																name="major" size="30" type="text" required
																data-msg-required="所学专业不能为空"
																value="${sessionScope.user.major}" />
														</div>
													</div>
												</div>
											</div>
										</div>
										<div class='col-md-11'>
											<div class='row'>
												<div class='col-md-4'>
													<div class='form-group'>
														<label class="col-md-5 control-label  " for="teacher_教龄：">教龄：</label>
														<div class='col-md-7'>
															<input class="form-control" id="teacher_teaching_age"
																min="0" name="teachYear" type="number"
																value="${sessionScope.user.teachYear}" />
														</div>
													</div>
												</div>
												<div class='col-md-4'>
													<div class='form-group'>
														<label class="col-md-5 control-label">用户邮箱：</label>
														<div class='col-md-7'>
															<input class="form-control" id="teacher_pay_num"
																type="text" disabled="disabled"
																value="${sessionScope.user.email }"
																style="width: 250px;" />
														</div>
													</div>
												</div>
											</div>
										</div>
										<div class='col-md-11'>
											<div class='col-md-12 te-right'>
												<textarea class="form-control" cols="40"
													id="teacher_introduction" name="introduction"
													placeholder="请填写个人简介,可以详细的说明一下自己的学习，工作，性格，经验等，以便家长更好的了解你，加深自己在家长心中的印象，提高自己的竞争力。。。。。。"
													rows="8">${sessionScope.user.introduction}</textarea>
												<input class=" btn btn-success" type="submit" value="保存信息"
													style="float: right; margin-top: 20px;" />
											</div>
										</div>
									</form>
								</div>
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
		/**
		function noValidateImage() {
			jQuery("#noValidateImage").show();
			jQuery("#hasValidateImage").hide();
			jQuery("#ingValidateImage").hide();
		}
		function hasValidateImage() {
			jQuery("#hasValidateImage").show();
			jQuery("#noValidateImage").hide();
			jQuery("#ingValidateImage").hide();
		}
		function ingValidateImage() {
			jQuery("#ingValidateImage").show();
			jQuery("#hasValidateImage").hide();
			jQuery("#noValidateImage").hide();
		}**/
		function noValidateImage() {
			jQuery("#updateImages").show();
			jQuery("#updateUserImage").hide();
			jQuery("#ingValidateImage").hide();
		}
		function hasValidateImage() {
			jQuery("#updateUserImage").show();
			jQuery("#updateImages").hide();
			jQuery("#ingValidateImage").hide();
		}
		function ingValidateImage() {
			jQuery("#ingValidateImage").show();
			jQuery("#updateImages").hide();
			jQuery("#updateUserImage").hide();
		}
		function fGenderChecked() {
			jQuery("#teacher_sex_2").attr("checked", "checked");
		}
		function mGenderChecked() {
			jQuery("#teacher_sex_1").attr("checked", "checked");
		}

		function gradeSelete() {
			jQuery("#grade").val("${sessionScope.user.grade}");
		}
		
		function noStatus(){
			alert("用户尚未进行资格认证，请资格认证后再进行课程发布");
		}
	</script>

	<%
		User u = (User) session.getAttribute("user");
		if(u==null){
			response.sendRedirect(request.getContextPath()+"/user/login");
		}
		if (u.getImageStatus()!=null&&u.getImageStatus().equals("0")) {
			out.print("<script type='text/javascript'>noValidateImage();</script>");
		} else if (u.getImageStatus()!=null&&u.getImageStatus().equals("2")) {
			out.print("<script type='text/javascript'>hasValidateImage();</script>");
		} else {
			out.print("<script type='text/javascript'>ingValidateImage();</script>");
		}

		String gender = u.getGender();
		if(gender!=null){
		if (gender.equals("2")) {
			out.print("<script type='text/javascript'>fGenderChecked();</script>");
		} else {
			out.print("<script type='text/javascript'>mGenderChecked();</script>");
		}
		if (u.getGender() != null) {
			out.print("<script type='text/javascript'>gradeSelete();</script>");
		}
		}
		if (session.getAttribute("noStatus") != null) {
			out.print("<script type='text/javascript'>noStatus();</script>");
			session.removeAttribute("noStatus");
		}
	%>
</body>
</html>