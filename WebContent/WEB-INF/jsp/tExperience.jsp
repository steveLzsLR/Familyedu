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
						<li><a href='${pageContext.request.contextPath}/user/myFamilyEduT/base'> <span
								class='pnav-left'> 基本信息 </span>
						</a></li>
						<li><a href='${pageContext.request.contextPath}/user/myFamilyEduT/achievement'> <span
								class='pnav-left'> 学习成果 </span>
						</a></li>
						<li><a class='p_active'
							href='${pageContext.request.contextPath}/user/myFamilyEduT/experience'> <span
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

			<div class='p_content'>
				<div class='p_block'>
					<div class='p_block_title p_content_block_title'>
						<h4>
							<i class='glyphicon-color glyphicon glyphicon-circle-arrow-up'>
								教学经历 </i>
						</h4>
					</div>
				</div>
				<div class='p_block'>
					<div class='t_main'>
						<div class='t_right'>
							<div class='show'>
								<div class='panel-body'>
									<form accept-charset="UTF-8"
										action="${pageContext.request.contextPath}/user/myFamilyEduT/achievement/addExperience"
										class="form-horizontal tpadding" id="addExperience"
										method="post">
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
																				<h4>我的教学生涯</h4>
																			</div>
																			<div class='col-md-2 col-xs-2' style="float: right;">
																				<button class='btn btn-success'>
																					<span class='glyphicon glyphicon-floppy-save'></span>
																					保存信息
																				</button>
																			</div>
																		</div>
																	</div>
																</div>
															</div>
														</div>
														<div id='careers_content'></div>
														<div class="fields">
															<div
																class='panel panel-default tpanel-titles tpanel-ab b-radius'>
																<div class='panel-heading tpanel-titles b-radius'>
																	<div class='tpadding'>
																		<div class='row'>
																			<div class='col-md-4 col-xs-4'>我的学生</div>
																		</div>
																	</div>
																</div>
																<div class='panel-body'>
																	<div class='row form-group'>
																		<div class='col-md-2 col-xs-2'>
																			<div class='start-time'>
																				<input class="form-control sel_time" id="beginDate"
																					name="beginDate" placeholder="开始辅导时间" size="30"
																					type="text" required readonly="readonly" />
																			</div>
																		</div>
																		<div class='col-md-2 col-xs-2'>
																			<div class='end-time'>
																				<input class="form-control sel_time" id="endDate"
																					name="endDate" placeholder="辅导结束时间" type="text"
																					required readonly="readonly" />
																			</div>
																		</div>
																		<div class='col-md-2 col-xs-2'>
																			<input class="form-control" id="studentName"
																				name="studentName" placeholder="学生姓名" size="30"
																				type="text" required />
																		</div>
																		<div class='col-md-3 col-xs-3'>
																			<input class="form-control" id="studentSchool"
																				name="studentSchool" placeholder="学生所在学校、年级"
																				size="30" type="text" required />
																		</div>
																		<div class='col-md-3 col-xs-3'>
																			<input class="form-control" id="studentSubject"
																				name="teachSubject" placeholder="辅导科目" size="30"
																				type="text" required />
																		</div>
																	</div>
																	<div class='row'>
																		<div class='col-md-12 col-xs-12'>
																			<textarea class="form-control" cols="40"
																				id="teachExperience" name="teachExperience"
																				placeholder="请根据你对学生的辅导情况，谈谈辅导经验" rows="6" required>
</textarea>
																		</div>
																	</div>
																</div>
															</div>
														</div>
													</div>
												</div>
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
																				<h4>我的教学生涯展示</h4>
																			</div>
																		</div>
																	</div>
																</div>
															</div>
														</div>
														<div id='careers_content'></div>
														<div class="fields">
															<c:forEach var="experience"
																items="${sessionScope.experiences}">
																<form
																	action="${pageContext.request.contextPath}/user/myFamilyEduT/achievement/deleteExperience"
																	method="post">
																	<input name="id" type="hidden"
																		value="${experience.id }">
																	<div
																		class='panel panel-default tpanel-titles tpanel-ab b-radius'>
																		<div class='panel-heading tpanel-titles b-radius'>
																			<div class='tpadding'>
																				<div class='row'>
																					<div class='col-md-4 col-xs-4'>我的学生</div>
																					<div
																						class='col-md-1 col-xs-1 col-md-offset-7 col-xs-offset-7'>
																						<button
																							onClick="return confirm('点击确定将删除该学习经历，是否确定？')"
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
																							value="${experience.beginDate }" size="30"
																							type="text" readonly="readonly" />
																					</div>
																				</div>
																				<div class='col-md-2 col-xs-2'>
																					<div class='end-time'>
																						<input class="form-control sel_time"
																							value="${experience.endDate }" type="text"
																							readonly="readonly" />
																					</div>
																				</div>
																				<div class='col-md-2 col-xs-2'>
																					<input class="form-control" size="30"
																						value="${experience.studentName }" type="text"
																						readonly="readonly" />
																				</div>
																				<div class='col-md-3 col-xs-3'>
																					<input class="form-control" size="30"
																						value="${experience.studentSchool }" type="text"
																						readonly="readonly" />
																				</div>
																				<div class='col-md-3 col-xs-3'>
																					<input class="form-control" size="30"
																						value="${experience.teachSubject }" type="text"
																						readonly="readonly" />
																				</div>
																			</div>
																			<div class='row'>
																				<div class='col-md-12 col-xs-12'>
																					<textarea class="form-control" cols="40" rows="6"
																						readonly="readonly">${experience.teachExperience }</textarea>
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
<script type="text/javascript">
	jQuery(document).ready(function() {
		$("#addExperience").validate();
	});
	jQuery('#beginDate').datepicker();
	jQuery('#endDate').datepicker();
</script>
</html>