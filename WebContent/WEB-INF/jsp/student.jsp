<%@page import="com.FamilyEdu.Model.User"%>
<%@page import="javafx.scene.control.Alert"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>个人中心-启学家教网</title>
<link href="${pageContext.request.contextPath}/css/bootstrap.css"
	rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/css/index.css"
	rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/css/jquery-ui.css"
	rel="stylesheet" type="text/css" />
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.validate.js"
	type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/jquery-1.11.2.js"
	type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/jquery-ui.js"
	type="text/javascript"></script>

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
						<a class='login-link' href='${pageContext.request.contextPath}/user/myFamilyEduS'> 个人中心 </a>
					</div>
				</li>
				<li>
					<div class='main-link-div'></div>
				</li>
				<li>客服QQ:1226468643</li>
			</ul>
			<ul class='tag-info'>
				<li><a class='login-link' href='${pageContext.request.contextPath}/user/myFamilyEduS'> <i
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
						<li><a href='${pageContext.request.contextPath}/user/myFamilyEduS'> <i
								class='glyphicon glyphicon-user'></i> 用户中心
						</a></li>
						<li><a href='${pageContext.request.contextPath}/user/myFamilyEduS/base'> <span
								class='pnav-left'> 基本信息 </span>
						</a></li>
						<li><a class='p_active' href='${pageContext.request.contextPath}/user/myFamilyEduS/student'> <span
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
						<li><a href='javascript:void(0);'> <i
								class='glyphicon glyphicon glyphicon-pencil'></i> 生成订单</a>
						<a href='${pageContext.request.contextPath}/user/myFamilyEduS/order?page=1'> <i
								class='glyphicon glyphicon-align-justify'></i> 全部订单
						</a> <a  href='${pageContext.request.contextPath}/user/myFamilyEduS/order/unconfirmed?page=1'> <i
								class='glyphicon glyphicon-time'></i> 待确认的订单
						</a> <a href='${pageContext.request.contextPath}/user/myFamilyEduS/order/confirmed?page=1'> <i
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
							<i class='glyphicon-color glyphicon glyphicon-circle-arrow-up'>
								学生信息</i>
						</h4>
					</div>
				</div>
				<div class='p_block'>
					<div class='t_main'>
						<div class='t_right'>
							<div class='show'>
								<div class='panel-body'>
									<form accept-charset="UTF-8"
										action="${pageContext.request.contextPath}/user/myFamilyEduS/student/addStudent"
										class="form-horizontal tpadding" id="addStudent"
										method="post">
										<div class='col-md-12 info-bottom'>
											<div class='col-md-4'>
												<h4>
													填写学生信息 <span class='font-orange'> (*必填) </span>
												</h4>
											</div>
										</div>
										<div class='col-md-11'>
											<div class='row'>
												<div class='col-md-4'>
													<div class='form-group'>
														<label class="col-md-5 control-label ">姓名：</label>
														<div class='col-md-7' style="color: #c00;">
															<input class="form-control" id="teacher_name" name="stuName"
																required data-msg-required="请输入用户名" minlength="2"
																maxlength="20" data-msg-minlength="用户名长度为2~20个字符"
																 />
														</div>
													</div>
												</div>
												<div class='col-md-4'>
													<div class='form-group'>
														<label class="col-md-5 control-label " for="teacher_年龄：">年龄：</label>
														<div class='col-md-7' style="color: #c00;">
															<input class="form-control" id="teacher_age" name="stuAge"
																type="number"  />
														</div>
													</div>
												</div>
												<div class='col-md-4'>
													<div class='form-group'>
														<label class="col-md-5 control-label" >性别：</label>
														<div class='col-md-7'>
															<label class='radio-inline'> <input
																id="teacher_sex_1" name="stuGender" type="radio" value="男" checked="checked"/>
																男
															</label> <label class='radio-inline'> <input
																id="teacher_sex_2" name="stuGender" type="radio" value="女" />
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
																name="stuSchool" size="30" type="text" required
																data-msg-required="学校一栏不能为空，所在学校或毕业院校"
																 />
														</div>
													</div>
												</div>
												<div class='col-md-4'>
													<div class='form-group'>
														<label class="col-md-5 control-label"
															for="student_identity_年级：">年级：</label>
														<div class='col-md-7' style="color: #c00;">
															<select name="stuGrade" required id="grade"
																style="color: black;" data-msg-required="年级一栏不能为空"
																class="grade">
																<option value="">--选择年级--</option>
																<option value="一年级">一年级</option>
																<option value="二年级">二年级</option>
																<option value="三年级">三年级</option>
																<option value="四年级">四年级</option>
																<option value="五年级">五年级</option>
																<option value="六年级">六年级</option>
																<option value="初一">初一</option>
																<option value="初二">初二</option>
																<option value="初三">初三</option>
																<option value="高一">高一</option>
																<option value="高二">高二</option>
																<option value="高三">高三</option>
															</select>

														</div>
													</div>
												</div>
											</div>
										</div>
										<div class='col-md-11'>
											<div class='col-md-12 te-right'>
												<textarea class="form-control" cols="40"
													id="teacher_introduction" name="stuInfo"
													placeholder="学生信息简介"
													rows="8"></textarea>
												<input class=" btn btn-success" type="submit" value="保存信息"
													style="float: right; margin-top: 20px;" />
											</div>
										</div>
									</form>
								</div>
								<div class='panel-body'>
									<div class="form-horizontal tpadding">
										<input type="hidden" name="id"
											value="${sessionScope.user.id }">
										<div class='form-group te-mgb'>
											<div class='col-md-12 col-xs-12'>
												<div class='form-group'>
													<div class='tpadding'>
														<div class='form-group'>
															<div class='tpadding'>
																<div class='form-group'>
																	<div class='col-md-12 col-xs-12'>
																		<div class='col-md-12 col-xs-12 info-bottom'>
																			<div class='col-md-4 col-xs-4'>
																				<h4>学生信息</h4>
																			</div>
																		</div>
																	</div>
																</div>
															</div>
														</div>
														<div id='careers_content'></div>
														<div class="fields">
															<c:forEach var="student"
																items="${sessionScope.students}">
																<form
																	action="${pageContext.request.contextPath}/user/myFamilyEduS/student/deleteStudent"
																	method="post">
																	<input name="stuId" type="hidden"
																		value="${student.id }">
																	<div
																		class='panel panel-default tpanel-titles tpanel-ab b-radius'>
																		<div class='panel-heading tpanel-titles b-radius'>
																			<div class='tpadding'>
																				<div class='row'>
																					<div class='col-md-4 col-xs-4'>学生信息</div>
																					<div
																						class='col-md-1 col-xs-1 col-md-offset-7 col-xs-offset-7'>
																						<button
																							onClick="return confirm('点击确定将删除该学生信息，是否确定？')"
																							style="border: none; height: 20px; background-color: #EFEFEF;">
																							<span class='glyphicon glyphicon-remove-circle'></span>
																						</button>
																					</div>
																				</div>
																			</div>
																		</div>
																		<div class='panel-body'>
																			<div class='row form-group'>
																				<div class='col-md-2 col-xs-2'>
																					<div class='start-time'>
																						<input class="form-control sel_time"
																							value="${student.stuName }" size="30"
																							type="text" readonly="readonly" />
																					</div>
																				</div>
																				<div class='col-md-2 col-xs-2'>
																					<div class='end-time'>
																						<input class="form-control sel_time"
																							value="${student.stuAge }" type="text"
																							readonly="readonly" />
																					</div>
																				</div>
																				<div class='col-md-2 col-xs-2'>
																					<input class="form-control" size="30"
																						value="${student.stuGender }" type="text"
																						readonly="readonly" />
																				</div>
																				<div class='col-md-3 col-xs-3'>
																					<input class="form-control" size="30"
																						value="${student.stuSchool }" type="text"
																						readonly="readonly" />
																				</div>
																				<div class='col-md-3 col-xs-3'>
																					<input class="form-control" size="30"
																						value="${student.stuGrade}" type="text"
																						readonly="readonly" />
																				</div>
																			</div>
																			<div class='row'>
																				<div class='col-md-12 col-xs-12'>
																					<textarea class="form-control" cols="40" rows="6"
																						readonly="readonly">${student.stuInfo }</textarea>
																				</div>
																			</div>
																		</div>
																	</div>
																</form>
															</c:forEach>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
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
				<div class='footer-service-content'>1226468643</div>
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
<script type="text/javascript">
	jQuery(document).ready(function() {
		$("#addStudent").validate();
	});

	function noStudents(){
		alert("用户缺少学生信息，请添加学生信息后进行家教预约！");
	}
</script>
<% 
	if (session.getAttribute("noStudents") != null) {
			out.print("<script type='text/javascript'>noStudents();</script>");
			session.removeAttribute("noStudents");
		}
	%>
</html>