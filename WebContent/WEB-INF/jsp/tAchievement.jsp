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
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.validate.js"
	type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/jquery-1.11.2.js"
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
						<li><a class='p_active'
							href='${pageContext.request.contextPath}/user/myFamilyEduT/achievement'> <span
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

			<div class='p_content'>
				<div class='p_block'>
					<div class='p_block_title p_content_block_title'>
						<h4>
							<i class='glyphicon-color glyphicon glyphicon-circle-arrow-up'>
								学习成果 </i>
						</h4>
					</div>
				</div>
				<div class='p_block'>
					<div class='t_main'>
						<div class='t_right'>
							<div class='show'>
								<div class='panel-body'>
									<form accept-charset="UTF-8"
										action="${pageContext.request.contextPath}/user/myFamilyEduT/achievement/addAchievement"
										class="form-horizontal tpadding" enctype="multipart/form-data"
										id="addAchievement" method="post">
										<h4 class='text-danger'>1.上传学习成绩单、荣誉单、资格证书等,更好展示自我</h4>
										<div class='form-group te-mgb' id="InputsWrapper">
											<div class='col-md-12 info-bottom'>
												<a href="javascript:void(0)" id="addInput"
													class="add_nested_fields"
													style="color: #545454; font-size: 18px; top: 10px; position: absolute; right: 10px;">添加<span
													class='glyphicon glyphicon-pencil'></span></a>
												<div class='col-md-8'>
													<h4>学习成果图片上传</h4>
												</div>
											</div>
											<div class='col-md-4 col-xs-4'>
												<div class='tpadding'>
													<div class='form-group'>
														<div class='panel panel-default tpanel-border tpanel-ab'>
															<div class='panel-heading'>
																<div class='form-group te-mgb'>
																	<div
																		class='col-md-1 col-xs-1 col-md-offset-10 col-xs-offset-10'>
																		<h4 class='panel-title'>
																			<a href="javascript:void(0)"
																				class=" input-group btn-default glyphicon glyphicon-trash remove_nested_fields"
																				data-association="pictures" id="removeInput"></a>
																		</h4>
																	</div>
																</div>
															</div>
															<div class='panel-body'>
																<div class='tpadding'>
																	<div class='form-group'>
																		<label class="control-label col-md-3 tp-left"
																			for="teacher_pictures_attributes_0_标题">标题</label>
																		<div class='col-md-9 col-xs-9'>
																			<div class='btn-group'>
																				<input class="form-control  ctg-title" id="titles"
																					list="img_category" name="titles" size="30"
																					type="text" value="英语四级" required />
																				<datalist id='img_category'>
																				<option value='高考成绩单'></option>
																				<option value='英语四级'></option>
																				<option value='英语六级'></option>
																				<option value='奖学金证书'></option>
																				<option value='荣誉证书'></option>
																				</datalist>
																			</div>
																		</div>
																	</div>
																	<div class='form-group'>
																		<label class="control-label col-md-3 tp-left"
																			for="teacher_pictures_attributes_0_图片">图片</label>
																		<div class='col-md-9 col-xs-9 te-flow'>
																			<input id="imgs" name="imgs" type="file" required />
																		</div>
																	</div>
																</div>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
										<input class=" btn btn-success" type="submit" value="保存图片"
											style="float: right;" />
									</form>
								</div>
								<div class='panel-body'>
									<div class='form-group te-mgb'>
										<div class='col-md-12 info-bottom'>
											<div class='col-md-8'>
												<h4>学习成果展示</h4>
											</div>
										</div>
									</div>
									<c:forEach var="achievement"
										items="${sessionScope.achievements}">
										<form
											action="${pageContext.request.contextPath}/user/myFamilyEduT/achievement/deleteAchievement"
											method="post">
											<input name="id" type="hidden" value="${achievement.id }">
											<div class='col-md-3 col-xs-3'>
												<div class='tpadding'>
													<div class='form-group'>
														<div class='panel panel-default tpanel-border tpanel-ab'>
															<div class='panel-heading' style="height: 30px;">
																<div class='form-group te-mgb'>
																	<div class='col-md-10 col-xs-10 te-right tleft'>
																		${achievement.title}</div>
																	<div class='col-md-2 col-xs-2 tp-left te-zero'>
																		<label class='te-bottom te-top cursor-pointer'>
																			<button
																				onClick="return confirm('点击确定将删除该学习经历，是否确定？')"
																				style="border: none; background-color: #EFEFEF;">
																				<span class='glyphicon glyphicon-remove-circle'></span>
																			</button>
																		</label>
																	</div>
																</div>
															</div>
															<div class='panel-body tp-left te-bottom te-top'>
																<div class='thumbnail honor-img2 te-mgb'>
																	<div class='img-h'>
																		<img
																			alt="Normal_03e4ab7778c3fd6ca91ba7e955dde956bbf33171"
																			height="170px" src="${achievement.achievementImage}"
																			width="100%" />
																	</div>
																</div>
															</div>
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
<script type="text/javascript">
	jQuery(document)
			.ready(
					function() {

						var MaxInput = 6;//设置一次最多上传6张图片
						var inputCount = 1;
						var x = jQuery("#InputsWrapper").length;

						jQuery("#addInput")
								.click(
										function() {
											if (x < MaxInput) {
												inputCount++;
												jQuery("#InputsWrapper")
														.append(
																"<div class='col-md-4 col-xs-4'><div class='tpadding'><div class='form-group'><div class='panel panel-default tpanel-border tpanel-ab'><div class='panel-heading'><div class='form-group te-mgb'><div class='col-md-1 col-xs-1 col-md-offset-10 col-xs-offset-10'><h4 class='panel-title'><a href='javascript:void(0)' class='input-group btn-default glyphicon glyphicon-trash remove_nested_fields' data-association='pictures'></a></h4></div></div></div><div class='panel-body'><div class='tpadding'><div class='form-group'><label class='control-label col-md-3 tp-left' for='teacher_pictures_attributes_0_标题'>标题</label><div class='col-md-9 col-xs-9'><div class='btn-group'><input class='form-control ctg-title' id='titles' list='img_category' name='titles' size='30' type='text' value='英语四级' required><datalist id='img_category'><option value='高考成绩单'></option><option value='英语四级'></option><option value='英语六级'></option><option value='奖学金证书'></option><option value='荣誉证书'></option></datalist></div></div></div><div class='form-group'><label class='control-label col-md-3 tp-left' for='teacher_pictures_attributes_0_图片'>图片</label><div class='col-md-9 col-xs-9 te-flow'><input id='imgs' name='imgs' type='file' required></div></div></div></div></div></div></div></div>");
												x++;
											}
										});

						jQuery("body").on("click", ".remove_nested_fields",
								function(e) {
									$(this).parents("div.col-xs-4").remove();
									x--;
								});
						$("#addAchievement").validate();
					});
</script>
</html>