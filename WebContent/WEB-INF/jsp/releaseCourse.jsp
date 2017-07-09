<%@page import="com.FamilyEdu.Model.User"%>
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
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery-1.11.2.js"></script>
<script src="${pageContext.request.contextPath}/js/area.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.validate.js"
	type="text/javascript"></script>
<%
	if (session.getAttribute("user") == null) {
		response.sendRedirect(request.getContextPath()+"/user/login");
	}%>
	<% 
	User u=(User)session.getAttribute("user");
	if(u.getImageStatus()!=null&&!u.getImageStatus().equals("2")){
		session.setAttribute("noStatus", "未进行资格认证");
		response.sendRedirect(request.getContextPath()+"/user/myFamilyEduT/base");
	}
%>
<script type="text/javascript">
	jQuery(document).ready(function() {
		$("#addCource").validate();
	});
</script>
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
						<a class='login-link' href='${pageContext.request.contextPath}/user/myFamilyEduT'>
							个人中心 </a>
					</div>
				</li>
				<li>
					<div class='main-link-div'></div>
				</li>
				<li>客服QQ: 1226468643</li>
			</ul>
			<ul class='tag-info'>
				<li><a class='login-link' href='${pageContext.request.contextPath}/user/myFamilyEduT'>
						<i class='glyphicon glyphicon-user'></i> ${ sessionScope.user.username}
				</a> <a class='register-link' href='${pageContext.request.contextPath}/user/loginout'> 退出 </a></li>
			</ul>
		</div>
	</div>
	<div id='p_header'>
		<div class='p_wrapper'>
			<div class='p_logo'>
				<a href='${pageContext.request.contextPath}/'> <img alt="家教网" class="header-logo-img2"
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
						<li><a class='p_active'
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
						</a> <a  href='${pageContext.request.contextPath}/user/myFamilyEduT/order/confirmed?page=1'> <i
								class='glyphicon glyphicon glyphicon-check'></i> 已确认的订单
						</a></li>
					</ul>
				</div>
				<div class='p_block'></div>
			</div>

			<div class='p_content'>
				<div class='p_block'>
					<div class='p_block_title p_content_block_title'>
						<h4>
							<i class='glyphicon-color glyphicon glyphicon-circle-arrow-up'>
								我的课程</i>
						</h4>
					</div>
				</div>
				<div class='p_block'>
					<div class='t_main'>
						<div class='t_right'>
							<div class='show'>
								<div class='panel-body'>
									<form accept-charset="UTF-8"
										action="${pageContext.request.contextPath}/user/myCourses/addCourse"
										class="form-horizontal tpadding" id="addCourse" method="post">
										<input type="hidden" name="id"
											value="${sessionScope.user.id }">
										<h4 class='text-danger'>
											用户已通过资格认证，可以发布课程，每个用户最多可同时发布3个课程！</h4>
										<div class='col-md-12 info-bottom'>
											<div class='col-md-4'>
												<h4>
													发布课程 <span class='font-orange'> (*必填) </span>
												</h4>
											</div>
										</div>
										<div class='col-md-11'>
											<div class='row'>
												<label class="col-md-5 control-label" style="width: 106px;">居住地区：</label>
												<div class='col-md-7' style="height: 49px;">
													<select id="s_province" name="teachProvince"
														style="height: 34px; width: 113px;" required></select> <select
														id="s_city" name="teachCity"
														style="height: 34px; width: 113px; margin-left: 20px;"></select>
													<select id="s_county" name="teachDistrict"
														style="height: 34px; width: 113px; margin-left: 20px;"></select>

												</div>
											</div>
										</div>
										<div class='col-md-11'>
											<div class='row'>
												<div class='col-md-4'>
													<div class='form-group'>
														<label class="col-md-5 control-label">授课方式：</label>
														<div class='col-md-7' style="color: #c00;">
															<select name="teachMethod" required id="teachMethod"
																style="width: 200px; height: 34px; color: #6D6D6D;">
																<option value="">--授课方式--</option>
																<option value="一对一上门教授">一对一上门教授</option>
																<option value="一对多补习班式教学">一对多补习班式教学</option>
															</select>

														</div>
													</div>
												</div>

												<div class='col-md-4' style="margin-left: 100px;">
													<div class='form-group'>
														<label class="col-md-5 control-label">授课类型：</label>
														<div class='col-md-7' style="color: #c00;">
															<select name="teachType" required id="teachType"
																style="width: 200px; height: 34px; color: #6D6D6D;">
																<option value="">--授课类型--</option>
																<option value="小初高教育">小初高教育</option>
																<option value="兴趣特长教学">兴趣特长教学</option>
															</select>

														</div>
													</div>
												</div>
											</div>
										</div>
										<div class='col-md-11'>
											<div class='row'>
												<label class="col-md-5 control-label" style="width: 106px;">适教区域：</label>
												<div class='col-md-7' style="height: 49px;">
													<input class="form-control" name="ableArea" type="text"
														style="width: 630px;" placeholder="填写适教区域" required />
												</div>
											</div>
										</div>
										<div class='col-md-11'>
											<div class='row'>
												<label class="col-md-5 control-label" style="width: 106px;">教授科目：</label>
												<div class='col-md-4' style="width: 160px;" >
													<div class='form-group'>
												<div class='col-md-7' style="color: #c00;">
															<select name="teachPeriod" required
																style="width: 150px; height: 34px; color: #6D6D6D;">
																<option value="">--学生学段--</option>
																<option value="全学段">全学段</option>
																<option value="小学">小学</option>
																<option value="初中">初中</option>
																<option value="高中">高中</option>
															</select>
														</div>
														</div></div>
														<div class='col-md-4' style="width: 160px;" >
														<div class='form-group'>
												<div class='col-md-7' style="color: #c00;">
															<select name="teachGrade" required
																style="width: 150px; height: 34px; color: #6D6D6D;">
																<option value="">--学生年级--</option>
																<option value="小学全年级">小学全年级</option>
																<option value="一年级">一年级</option>
																<option value="二年级">二年级</option>
																<option value="三年级">三年级</option>
																<option value="四年级">四年级</option>
																<option value="五年级">五年级</option>
																<option value="六年级">六年级</option>
																<option value="初中全年级">初中全年级</option>
																<option value="初一">初一</option>
																<option value="初二">初二</option>
																<option value="初三">初三</option>
																<option value="高中全年级">高中全年级</option>
																<option value="高一">高一</option>
																<option value="高二">高二</option>
																<option value="高三">高三</option>
																
															</select>
														</div>
														</div></div>
														<div class='col-md-4' style="width: 160px;" >
														<div class='form-group'>
												<div class='col-md-7'>
															<input style="height: 34px;" type="text" name="teachSubject" placeholder="输入教学科目" required>
														</div></div>
														</div>
											</div>
										</div>
										<div class='col-md-11'>
											<div class='row'>
												<label class="col-md-5 control-label" style="width: 106px;">适教时间：</label>
												<div class='col-md-7' style="height: 49px;">
													<input class="form-control" name="freeTime" required
														type="text" style="width: 630px;"
														placeholder="填写能够教学的时间段，如星期天下午，星期六全天有空，星期五下午2:00~下午5:00等等" />
												</div>
											</div>
										</div>
										<div class='col-md-11'>
											<div class='row'>
												<div class='col-md-2 col-xs-2'
													style="float: right; margin-top: 20px;">
													<button class='btn btn-success'>
														<span class='glyphicon glyphicon-pencil'></span> 发布课程
													</button>
												</div>
											</div>
										</div>
									</form>
								</div>
								<div class='panel-body' style="padding-bottom: 30px;">
									<div class='col-md-12 info-bottom'>
										<div class='col-md-4'>
											<h4>已发布课程</h4>
										</div>
									</div>
								</div>
								<c:forEach items="${sessionScope.courses }" var="course">
								<div class='panel-body'
									style="width: 850px; background: #F7F7F7;margin-left: 13px;margin-bottom: 20px;">
									<form accept-charset="UTF-8"
										action="${pageContext.request.contextPath}/user/myCourses/deleteCourse"
										class="form-horizontal tpadding" id="deleteCourse"
										method="post">
										<input type="hidden" name="id"
											value="${course.id }">
										<div class='col-md-11'>
											<div class='row'>
												<label class="col-md-5 control-label" style="width: 106px;">居住地区：</label>
												<div class='col-md-7' style="height: 49px;">
													<input class="form-control" name="homeArea" type="text"
														style="width: 630px;" value="${course.homeArea }"
														disabled="disabled" />
												</div>
											</div>
										</div>
										<div class='col-md-11'>
											<div class='row' style="height: 49px;">
												<label class="col-md-5 control-label" style="width:106px;">授课方式：</label>
												<div class='col-md-7' style="width: 200px;">
													<input class="form-control" name="teachMethod" type="text"
														value="${course.teachMethod }" disabled="disabled"
														style="width: 230px;">
												</div>

												<label class="col-md-5 control-label" style="text-align: left;width:106px;margin-left: 93px;">授课类型：</label>
												<div class='col-md-7' style="width: 200px;">
													<input class="form-control" name="teachType" type="text"
														value="${course.teachType }" disabled="disabled"
														style="width: 230px;">
												</div>
											</div>
										</div>
								<div class='col-md-11'>
									<div class='row'>
										<label class="col-md-5 control-label" style="width: 106px;">适教区域：</label>
										<div class='col-md-7' style="height: 49px;">
											<input class="form-control" name="ableArea" type="text"
												style="width: 630px;" disabled="disabled"  value="${course.ableArea }"/>
										</div>
									</div>
								</div>
								<div class='col-md-11'>
									<div class='row'>
										<label class="col-md-5 control-label" style="width: 106px;">教授科目：</label>
										<div class='col-md-7' style="height: 49px;">
											<input class="form-control" name="teachSubject" type="text"
												required style="width: 630px;"
												disabled="disabled"  value="${course.teachPeriod }${course.teachGrade }${course.teachSubject }" />
										</div>
									</div>
								</div>
								<div class='col-md-11'>
									<div class='row'>
										<label class="col-md-5 control-label" style="width: 106px;">适教时间：</label>
										<div class='col-md-7' style="height: 49px;">
											<input class="form-control" name="freeTime" required
												type="text" style="width: 630px;"
												disabled="disabled"  value="${course.freeTime }" />
										</div>
									</div>
								</div>
								<div class='col-md-11'>
									<div class='row'>
										<div class='col-md-2 col-xs-2'
											style="float: right; margin-top: 20px;">
											<button class='btn btn-success'>
												<span class='glyphicon glyphicon-pencil'></span> 删除课程
											</button>
										</div>
									</div>
								</div>
								</form>
							</div></c:forEach>
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
	_init_area();
</script>

</html>