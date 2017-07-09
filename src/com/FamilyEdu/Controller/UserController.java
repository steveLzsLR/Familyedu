package com.FamilyEdu.Controller;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import com.FamilyEdu.Model.Achievement;
import com.FamilyEdu.Model.Course;
import com.FamilyEdu.Model.Experience;
import com.FamilyEdu.Model.Order;
import com.FamilyEdu.Model.Student;
import com.FamilyEdu.Model.User;
import com.FamilyEdu.Service.AchievementService;
import com.FamilyEdu.Service.CourseService;
import com.FamilyEdu.Service.ExperienceService;
import com.FamilyEdu.Service.OrderService;
import com.FamilyEdu.Service.RegisterValidateService;
import com.FamilyEdu.Service.StudentService;
import com.FamilyEdu.Service.UserService;
import com.FamilyEdu.Tools.Md5Util;

@Controller
@RequestMapping("user")
public class UserController {

	@Autowired
	private UserService userService;

	@Autowired
	private AchievementService achievementService;

	@Autowired
	private RegisterValidateService registerValidateService;

	@Autowired
	private ExperienceService experienceService;

	@Autowired
	private CourseService courseService;
	
	@Autowired
	private StudentService studentService;
	
	@Autowired
	private OrderService orderService;

	/**
	 * 对用户进行注册，并重定向到用户提醒激活方法
	 * 
	 * aram request
	 * aram response
	 * @return
	 */
	@RequestMapping(value = "/activate", method = RequestMethod.POST)
	public String addUser(HttpServletRequest request, HttpServletResponse response) {
		try {String email = request.getParameter("email");
		String username = request.getParameter("name");
		String password = request.getParameter("password");
		String validateCode = Md5Util.getMD5Str(email);
		User u = new User();
		u.setEmail(email);
		u.setUsername(username);
		u.setPassword(Md5Util.getMD5Str(password));
		u.setActivationCode(validateCode);
		u.setRegisterDate(new Date());
		u.setActivationStatus("0");
		// 设置默认头像
		u.setUserImage("/images/userImages/defaultUserImages.png");
		u.setImageStatus("0");
		registerValidateService.sendValidateEmail(username, email, validateCode);
		userService.addUser(u);
		}catch (Exception e) {
			return "redirect:/user/activateRemind?errorCode=301";   //错误代码301代表用户邮箱不存在或者发送邮件失败
		}
		return "redirect:/user/activateRemind";
	}

	/**
	 * 判断注册邮箱是否重复
	 * 
	 * aram request
	 * aram response
	 * @throws IOException
	 */
	@RequestMapping("/isRegisterEmail")
	public void isRegisterEmail(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String email = request.getParameter("email");
		if (userService.isRegisterEmail(email)) {
			// 存在重复邮箱，无法通过验证，返回false
			response.getWriter().print(false);
		} else {
			// 不存在重复邮箱，可以通过验证，返回true
			response.getWriter().print(true);
		}
	}

	/**
	 * 跳转到用户激活提醒页面
	 * 
	 * @return
	 */
	@RequestMapping("/activateRemind")
	public String userActivate() {
		return "activateRemind";
	}

	/**
	 * 用于激活用户,对用户激活状态进行修改，返回激活成功页面
	 * 
	 * aram request
	 * aram response
	 * @return
	 */
	@RequestMapping("/userAtivation")
	public String UserAtivation(HttpServletRequest request, HttpServletResponse response) {
		String validateCode = request.getParameter("validateCode");
		User u = userService.findUserByValidateCode(validateCode);
		if (u != null) {
			u.setActivationStatus("1");
			userService.updateUser(u);
			return "activateSuccess";
		}
		return "activateFail";
	}

	/**
	 * 进入登录界面
	 * 
	 * aram request
	 * aram response
	 * @return
	 */
	@RequestMapping("/login")
	public String userLogin(HttpServletRequest request, HttpServletResponse response) {
		return "login";
	}

	/**
	 * 用户登录，登录成功返回首页，失败返回登录页面
	 * 
	 * aram request
	 * aram response
	 * @return
	 */
	@RequestMapping("/sign_in")
	public String sign_in(HttpServletRequest request, HttpServletResponse response) {
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		User u = userService.isLogin(email, password);
		if(u!=null){
			if (u.getActivationStatus().equals("0")) {
				request.getSession().setAttribute("noActivate", "noActivate");
				request.getSession().setAttribute("user", null);
				return "redirect:/user/login";
			}else{
				request.getSession().setAttribute("user", u);
				return "redirect:/";
			}
		}else{
			return "redirect:/user/login?errorCode=202"; //errorCode=202说明用户不存在
		}
		
	}

	/**
	 * 判断用户是否正确登录
	 * 
	 * aram request
	 * aram response
	 * @return
	 * @throws IOException
	 */
	@RequestMapping("/isTrueLogin")
	public void isTrueLogin(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		User u=userService.isLogin(email, password);
		if (u != null) {
			request.getSession().setAttribute("user", u);
			response.getWriter().write("1");
		} else {
			response.getWriter().write("0");
		}
	}

	/**
	 * 存在用户登录后的返回首页
	 * 
	 * @return
	 */
	@RequestMapping("")
	public String index(HttpServletRequest request, HttpServletResponse response) {
		List<User> userList = userService.getNewTeachers();
		request.getSession().setAttribute("newTeacherList", userList);
		List<Course> courses = courseService.findCoursesByTeachType("小初高教育");
		if (!courses.isEmpty()) {
			for (Course c : courses) {
				c.setCreateUser(userService.getUser(Integer.parseInt(c.getCreateId())));
			}
			request.getSession().setAttribute("subjectCourses", courses);
		}
		courses = courseService.findCoursesByTeachType("兴趣特长教学");
		if (!courses.isEmpty()) {
			for (Course c : courses) {
				c.setCreateUser(userService.getUser(Integer.parseInt(c.getCreateId())));
			}
			request.getSession().setAttribute("interestCourses", courses);
		}
		return "index";
	}

	/**
	 * 进入用户中心页面，选择家教中心，或家长中心
	 * 
	 * @return
	 */
	@RequestMapping("/myFamilyEduSelect")
	public String myFamilyEduSelect(HttpServletRequest request, HttpServletResponse response) {
		return "myFamilyEduSelect";
	}

	/**
	 * 进入用户信息教师页
	 * 
	 * @return
	 */
	@RequestMapping("myFamilyEduT")
	public String myFamilyEduT(HttpServletRequest request, HttpServletResponse response) {
		return "myFamilyEduT";
	}
	
	/**
	 * 进入用户信息家长页
	 * 
	 * @return
	 */
	@RequestMapping("myFamilyEduS")
	public String myFamilyEduS(HttpServletRequest request, HttpServletResponse response) {
		return "myFamilyEduS";
	}

	/**
	 * 进入教师页基本信息页面
	 * 
	 * @return
	 */
	@RequestMapping("/myFamilyEduT/base")
	public String tInfoBase(HttpServletRequest request, HttpServletResponse response) {
		User u=(User) request.getSession().getAttribute("user");
		if(u==null){
			return "redirect:/user/login";
		}
		u=userService.getUser(u.getId());
		request.getSession().setAttribute("user", u);
		return "tInfoBase";
	}
	
	/**
	 * 进入家长页基本信息页面
	 * 
	 * @return
	 */
	@RequestMapping("/myFamilyEduS/base")
	public String sInfoBase(HttpServletRequest request, HttpServletResponse response) {
		User u=(User) request.getSession().getAttribute("user");
		if(u==null){
			return "redirect:/user/login";
		}
		u=userService.getUser(u.getId());
		request.getSession().setAttribute("user", u);
		return "sInfoBase";
	}

	/**
	 * 修改用户资格证件图片，包括用户头像，身份证，教师资格证，提交进行资格认证，返回教师个人中心
	 * 
	 * aram request
	 * aram response
	 * aram userImage
	 * aram idImage
	 * aram teachImage
	 * @return
	 * @throws IOException
	 */
	@RequestMapping(value = "/myFamilyEduT/base/updateImages", method = RequestMethod.POST)
	public String tUpdateImages(HttpServletRequest request, HttpServletResponse response,
			@RequestParam MultipartFile userImage, @RequestParam MultipartFile idImage,
			@RequestParam MultipartFile teachImage) throws IOException {
		User u = (User) request.getSession().getAttribute("user");
		int id = u.getId();
		u = userService.getUser(id);
		/*FileUtils.copyInputStreamToFile(userImage.getInputStream(),
				new File("E:\\FamilyEdu\\userImages", id + "userImage.png"));
		FileUtils.copyInputStreamToFile(idImage.getInputStream(),
				new File("E:\\FamilyEdu\\idImages", id + "idImage.png"));*/
		FileUtils.copyInputStreamToFile(userImage.getInputStream(), 
				new File(request.getServletContext().getRealPath("images")+File.separator+"userImages",id+"userImage.png"));
		FileUtils.copyInputStreamToFile(idImage.getInputStream(),
				new File(request.getServletContext().getRealPath("images")+File.separator +"idImages", id + "idImage.png"));
		FileUtils.copyInputStreamToFile(teachImage.getInputStream(),
				new File(request.getServletContext().getRealPath("images")+File.separator +"teachImages", id + "teachImage.png"));
		u.setUserImage("/images/userImages/" + id + "userImage.png");
		u.setIdImage("/images/idImages/" + id + "idImage.png");
		u.setTeachImage("/images/teachImages/" + id + "teachImage.png");
		u.setImageStatus("1");
		u.setParentStatus("1");
		u.setImageStatuDate(new Date());
		u.setParentStatuDate(new Date());
		userService.updateUser(u);
		request.getSession().setAttribute("user", u);
		return "redirect:/user/myFamilyEduT/base";
	}
	
	/**
	 * 修改家长资格证件图片，包括用户头像，身份证提交进行资格认证，返回家长个人中心
	 * 
	 * aram request
	 * aram response
	 * aram userImage
	 * aram idImage
	 * aram teachImage
	 * @return
	 * @throws IOException
	 */
	@RequestMapping(value = "/myFamilyEduS/base/updateImages", method = RequestMethod.POST)
	public String sUpdateImages(HttpServletRequest request, HttpServletResponse response,
			@RequestParam MultipartFile userImage, @RequestParam MultipartFile idImage) throws IOException {
		User u = (User) request.getSession().getAttribute("user");
		int id = u.getId();
		u = userService.getUser(id);
		/*FileUtils.copyInputStreamToFile(userImage.getInputStream(),
				new File("E:\\FamilyEdu\\userImages", id + "userImage.png"));*/
		FileUtils.copyInputStreamToFile(userImage.getInputStream(), 
				new File(request.getServletContext().getRealPath("images")+File.separator+"userImages",id+"userImage.png"));
		FileUtils.copyInputStreamToFile(idImage.getInputStream(),
				new File(request.getServletContext().getRealPath("images")+File.separator +"idImages", id + "idImage.png"));
/*		FileUtils.copyInputStreamToFile(idImage.getInputStream(),
				new File("E:\\FamilyEdu\\idImages", id + "idImage.png"));
*/		u.setUserImage("/images/userImages/" + id + "userImage.png");
		u.setIdImage("/images/idImages/" + id + "idImage.png");
		u.setParentStatus("1");
		u.setParentStatuDate(new Date());
		userService.updateUser(u);
		request.getSession().setAttribute("user", u);
		return "redirect:/user/myFamilyEduS/base";
	}

	/**
	 * 修改用户头像,返回教师个人中心
	 * 
	 * aram request
	 * aram response
	 * aram userImage
	 * @return
	 * @throws IOException
	 */
	@RequestMapping(value = "/myFamilyEduT/base/updateUserImage", method = RequestMethod.POST)
	public String tUpdateUserImage(HttpServletRequest request, HttpServletResponse response,
			@RequestParam MultipartFile userImage) throws IOException {
		User u = (User) request.getSession().getAttribute("user");
		u = userService.getUser(u.getId());
		FileUtils.copyInputStreamToFile(userImage.getInputStream(),
				new File(request.getServletContext().getRealPath("images")+File.separator+"userImages", u.getId() + "userImage.png"));
		u.setUserImage("/images/userImages/" + u.getId() + "userImage.png");
		userService.updateUser(u);
		request.getSession().setAttribute("user", u);
		return "redirect:/user/myFamilyEduT/base";
	}
	
	/**
	 * 修改用户头像，返回家长个人中心
	 * 
	 * aram request
	 * aram response
	 * aram userImage
	 * @return
	 * @throws IOException
	 */
	@RequestMapping(value = "/myFamilyEduS/base/updateUserImage", method = RequestMethod.POST)
	public String sUpdateUserImage(HttpServletRequest request, HttpServletResponse response,
			@RequestParam MultipartFile userImage) throws IOException {
		User u = (User) request.getSession().getAttribute("user");
		u = userService.getUser(u.getId());
		FileUtils.copyInputStreamToFile(userImage.getInputStream(),
				new File(request.getServletContext().getRealPath("images")+File.separator+"userImages", u.getId() + "userImage.png"));
		u.setUserImage("/images/userImages/" + u.getId() + "userImage.png");
		userService.updateUser(u);
		request.getSession().setAttribute("user", u);
		return "redirect:/user/myFamilyEduS/base";
	}

	/**
	 * 修改用户教师信息
	 * aram request
	 * aram response
	 * @return
	 */
	@RequestMapping(value = "/myFamilyEduT/base/updateUserInfo", method = RequestMethod.POST)
	public String tUpdateUserInfo(HttpServletRequest request, HttpServletResponse response) {
		User u = (User) request.getSession().getAttribute("user");
		u = userService.getUser(u.getId());
		String username = request.getParameter("name");
		String age = request.getParameter("age");
		String gender = request.getParameter("gender");
		String school = request.getParameter("school");
		String grade = request.getParameter("grade");
		String major = request.getParameter("major");
		String teachYear = request.getParameter("teachYear");
		String introduction = request.getParameter("introduction");
		u.setUsername(username);
		u.setAge(age);
		u.setGender(gender);
		u.setSchool(school);
		u.setGrade(grade);
		u.setMajor(major);
		u.setTeachYear(teachYear);
		u.setIntroduction(introduction);
		userService.updateUser(u);
		request.getSession().setAttribute("user", u);
		return "redirect:/user/myFamilyEduT/base";
	}
	
	/**
	 * 修改用户家长信息
	 * aram request
	 * aram response
	 * @return
	 */
	@RequestMapping(value = "/myFamilyEduS/base/updateUserInfo", method = RequestMethod.POST)
	public String sUpdateUserInfo(HttpServletRequest request, HttpServletResponse response) {
		User u = (User) request.getSession().getAttribute("user");
		u = userService.getUser(u.getId());
		String username = request.getParameter("name");
		String phoneNum = request.getParameter("phoneNum");
		String stuAddress = request.getParameter("stuAddress");
		u.setUsername(username);
		u.setPhoneNum(phoneNum);
		u.setAddress(stuAddress);
		userService.updateUser(u);
		request.getSession().setAttribute("user", u);
		return "redirect:/user/myFamilyEduS/base";
	}

	/**
	 * 进入教师学习成果页面
	 * 
	 * @return
	 */
	@RequestMapping("/myFamilyEduT/achievement")
	public String tAchievement(HttpServletRequest request, HttpServletResponse response) {
		User u = (User) request.getSession().getAttribute("user");
		if (u != null) {
			List<Achievement> achievements = achievementService.findAchievementsByUserId(u.getId() + "");
			request.getSession().setAttribute("achievements", achievements);
		}
		return "tAchievement";
	}

	/**
	 * 添加学习成果
	 * 
	 * aram request
	 * @param response
	 * @param imgs
	 * @return
	 * @throws IOException
	 */
	@RequestMapping(value = "/myFamilyEduT/achievement/addAchievement", method = RequestMethod.POST)
	public String addAchievement(HttpServletRequest request, HttpServletResponse response,
			@RequestParam("imgs") MultipartFile[] imgs) throws IOException {
		String[] titles = request.getParameterValues("titles");
		User u = (User) request.getSession().getAttribute("user");
		int maxId = achievementService.findMaxIdByUserId(u.getId() + "");
		maxId++;
		for (int i = 0; i < imgs.length; i++) {
			Achievement achievement = new Achievement();
			achievement.setUserId(u.getId() + "");
			achievement.setTitle(titles[i]);
			FileUtils.copyInputStreamToFile(imgs[i].getInputStream(),
					new File(request.getServletContext().getRealPath("images")+File.separator+"achievementImages", u.getId() + "achievementImage" + maxId + ".png"));
			achievement.setAchievementImage(
					"/images/achievementImages/" + u.getId() + "achievementImage" + maxId + ".png");
			achievementService.addAchievement(achievement);
			maxId++;
		}
		return "redirect:/user/myFamilyEduT/achievement";
	}

	/**
	 * 进入教师教学经历
	 * 
	 * @return
	 */
	@RequestMapping("/myFamilyEduT/experience")
	public String tExperience(HttpServletRequest request, HttpServletResponse response) {
		User u = (User) request.getSession().getAttribute("user");
		if (u != null) {
			List<Experience> experiences = experienceService.findExperiencesByUserId(u.getId() + "");
			request.getSession().setAttribute("experiences", experiences);
		}
		return "tExperience";
	}

	/**
	 * 添加学习经历
	 * 
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value = "/myFamilyEduT/achievement/addExperience", method = RequestMethod.POST)
	public String addExperience(HttpServletRequest request, HttpServletResponse response) {
		User u = (User) request.getSession().getAttribute("user");
		String userId = u.getId() + "";
		String beginDate = request.getParameter("beginDate");
		String endDate = request.getParameter("endDate");
		String studentName = request.getParameter("studentName");
		String studentSchool = request.getParameter("studentSchool");
		String teachSubject = request.getParameter("teachSubject");
		String teachExperience = request.getParameter("teachExperience");
		Experience experience = new Experience();
		experience.setUserId(userId);
		experience.setBeginDate(beginDate);
		experience.setEndDate(endDate);
		experience.setStudentName(studentName);
		experience.setStudentSchool(studentSchool);
		experience.setTeachSubject(teachSubject);
		experience.setTeachExperience(teachExperience);
		experienceService.addExperience(experience);
		return "redirect:/user/myFamilyEduT/experience";
	}

	/**
	 * 删除学习经历
	 * 
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value = "/myFamilyEduT/achievement/deleteExperience", method = RequestMethod.POST)
	public String deleteExperience(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		experienceService.deleteExperience(id);
		return "redirect:/user/myFamilyEduT/experience";
	}

	/**
	 * 删除学习成果
	 * 
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value = "/myFamilyEduT/achievement/deleteAchievement", method = RequestMethod.POST)
	public String deleteAchievement(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		achievementService.deleteAchievement(id);
		return "redirect:/user/myFamilyEduT/achievement";
	}

	/**
	 * 进入教师密码修改页面
	 * 
	 * @return
	 */
	@RequestMapping("/myFamilyEduT/userPassword")
	public String tUserPassword(HttpServletRequest request, HttpServletResponse response) {
		return "tUserPassword";
	}
	
	/**
	 * 进入家长密码修改页面
	 * 
	 * @return
	 */
	@RequestMapping("/myFamilyEduS/userPassword")
	public String sUserPassword(HttpServletRequest request, HttpServletResponse response) {
		return "sUserPassword";
	}

	/**
	 * 判断当前密码是否正确
	 * 
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping("/isTrueOldPassword")
	public void isTrueOldPassword(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String oldPassword = request.getParameter("oldPassword");
		User u = (User) request.getSession().getAttribute("user");
		if (u.getPassword().equals(Md5Util.getMD5Str(oldPassword))) {
			// 当前密码正确，返回true
			response.getWriter().print(true);
		} else {
			// 当前密码不正确，返回false
			response.getWriter().print(false);
		}
	}

	/**
	 * 教师修改密码
	 * 
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value = "/myFamilyEduT/userPassword/updatePassword", method = RequestMethod.POST)
	public String updatePasswordT(HttpServletRequest request, HttpServletResponse response) {
		String newPassword = request.getParameter("newPassword");
		User u = (User) request.getSession().getAttribute("user");
		u = userService.getUser(u.getId());
		u.setPassword(Md5Util.getMD5Str(newPassword));
		userService.updateUser(u);
		request.getSession().setAttribute("User", u);
		request.getSession().setAttribute("updateSuccess", "updateSuccess");
		return "redirect:/user/myFamilyEduT/userPassword";
	}
	
	/**
	 * 家长修改密码
	 * 
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value = "/myFamilyEduS/userPassword/updatePassword", method = RequestMethod.POST)
	public String updatePasswordS(HttpServletRequest request, HttpServletResponse response) {
		String newPassword = request.getParameter("newPassword");
		User u = (User) request.getSession().getAttribute("user");
		u = userService.getUser(u.getId());
		u.setPassword(Md5Util.getMD5Str(newPassword));
		userService.updateUser(u);
		request.getSession().setAttribute("User", u);
		request.getSession().setAttribute("updateSuccess", "updateSuccess");
		return "redirect:/user/myFamilyEduS/userPassword";
	}

	/**
	 * 进入用户信息教师课程页
	 * 
	 * @return
	 */
	@RequestMapping("/myCourses/release")
	public String myCourses(HttpServletRequest request, HttpServletResponse response) {
		User u = (User) request.getSession().getAttribute("user");
		if (u != null) {
			u=userService.getUser(u.getId());
			List<Course> courses = courseService.findCoursesByUserId(u.getId() + "");
			request.getSession().setAttribute("courses", courses);
			request.getSession().setAttribute("user", u);
			return "releaseCourse";
		}
		return "redirect:/user/login";
	}

	@RequestMapping(value = "/myCourses/addCourse", method = RequestMethod.POST)
	public String addCourse(HttpServletRequest request, HttpServletResponse response) {
		User u = (User) request.getSession().getAttribute("user");
		String teachMethod = request.getParameter("teachMethod");
		String teachType = request.getParameter("teachType");
		String ableArea = request.getParameter("ableArea");
		String teachPeriod=request.getParameter("teachPeriod");
		String teachGrade=request.getParameter("teachGrade");
		String teachSubject = request.getParameter("teachSubject");
		String freeTime = request.getParameter("freeTime");
		String teachProvince = request.getParameter("teachProvince");
		String teachCity = request.getParameter("teachCity");
		String teachDistrict = request.getParameter("teachDistrict");
		Course course = new Course();
		course.setAbleArea(ableArea);
		course.setCreateId(u.getId() + "");
		course.setFreeTime(freeTime);
		course.setHomeArea(teachProvince + teachCity + teachDistrict);
		course.setTeachMethod(teachMethod);
		course.setTeachSubject(teachSubject);
		course.setTeachType(teachType);
		course.setReleaseDate(new Date());
		course.setTeachPeriod(teachPeriod);
		course.setTeachGrade(teachGrade);
		course.setKeyword(teachSubject+u.getGender()+teachMethod+teachPeriod+teachGrade);
		courseService.addCourse(course);
		return "redirect:/user/myCourses/release";
	}

	/**
	 * 删除学习课程
	 * 
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value = "/myCourses/deleteCourse", method = RequestMethod.POST)
	public String deleteCourse(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		courseService.deleteCourse(id);
		return "redirect:/user/myCourses/release";
	}
	
	/**
	 * 获取课程详细信息并进入课程详细页面
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("/myCourses/detail")
	public String courseDetail(HttpServletRequest request, HttpServletResponse response){
		String courseId=request.getParameter("courseId");
		Course course=new Course();
		try{
		course=courseService.getCourse(Integer.parseInt(courseId));
		}catch(Exception e){
			return "redirect:/user";
		}
		if(course==null){
		return "redirect:/user";
		}
		course.setCreateUser(userService.getUser(Integer.parseInt(course.getCreateId())));
		request.getSession().setAttribute("course", course);
		List<Achievement> achievements=achievementService.findAchievementsByUserId(course.getCreateId()+"");
		request.getSession().setAttribute("achievements", achievements);
		List<Experience> experiences=experienceService.findExperiencesByUserId(course.getCreateId()+"");
		request.getSession().setAttribute("experiences", experiences);
		List<Order> commentOrders=orderService.findCommentOrderByTeacherId(course.getCreateId());
		request.getSession().setAttribute("orderComments", commentOrders);
		return "courseDetail";
	}
	
	/**
	 * 进入家长学生信息
	 * 
	 * @return
	 */
	@RequestMapping("/myFamilyEduS/student")
	public String student(HttpServletRequest request, HttpServletResponse response) {
		User u = (User) request.getSession().getAttribute("user");
		if (u != null) {
			List<Student> students = studentService.findStudentsByCreateId(u.getId() + "");
			request.getSession().setAttribute("students", students);
		}
		return "student";
	}
	
	@RequestMapping("/myFamilyEduS/student/addStudent")
	public String addStudent(HttpServletRequest request, HttpServletResponse response){
		User u=(User) request.getSession().getAttribute("user");
		Student student=new Student();
		String createId=u.getId()+"";
		String stuName=request.getParameter("stuName");
		String stuAge=request.getParameter("stuAge");
		String stuGender=request.getParameter("stuGender");
		String stuSchool=request.getParameter("stuSchool");
		String stuGrade=request.getParameter("stuGrade");
		String stuInfo=request.getParameter("stuInfo");
		student.setCreateId(createId);
		student.setStuName(stuName);
		student.setStuAge(stuAge);
		student.setStuGender(stuGender);
		student.setStuSchool(stuSchool);
		student.setStuGrade(stuGrade);
		student.setStuInfo(stuInfo);
		studentService.addStudent(student);
		return "redirect:/user/myFamilyEduS/student";
	}
	
	/**
	 * 删除学习信息
	 * 
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value = "/myFamilyEduS/student/deleteStudent", method = RequestMethod.POST)
	public String deleteStudent(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("stuId");
		studentService.deleteStudent(id);
		return "redirect:/user/myFamilyEduS/student";
	}
	
	/**
	 * 进入用户搜索页面
	 * @param request
	 * @param response
	 * @return
	 */	
	@RequestMapping(value = "/search")
	public String search(HttpServletRequest request, HttpServletResponse response){
		String keyword=request.getParameter("keyword");
		String searchPeriod=request.getParameter("sPeriod");
		String searchGender=request.getParameter("sGender");
		String searchTeachMethod=request.getParameter("sTeachMethod");
		if(keyword==null){
			keyword="";
		}
		int page=Integer.parseInt(request.getParameter("page"));
		String pageAction=request.getParameter("pageAction");
		if("pre".equals(pageAction)){
			page--;
		}else if("next".equals(pageAction)){
			page++;
		}
		Map<String, Object> map=courseService.findCourses("%"+keyword+"%", page+"");
		int searchBeginPage;
		if(Integer.parseInt(map.get("totalPage").toString())>10){
			searchBeginPage=(Integer.parseInt(map.get("totalPage").toString())-10);
		}else {
			searchBeginPage=1;
		}
		@SuppressWarnings("unchecked")
		List<Course> searchResultLists=(List<Course>) map.get("searchResultLists");
		if(!searchResultLists.isEmpty())
		{
			for(Course c:searchResultLists){
				c.setCreateUser(userService.getUser(Integer.parseInt(c.getCreateId())));
			}
		}
		request.getSession().setAttribute("currentKeyword", keyword);
		request.getSession().setAttribute("searchResultLists", searchResultLists);
		request.getSession().setAttribute("searchTotalPage", map.get("totalPage"));
		request.getSession().setAttribute("searchBeginPage", searchBeginPage);
		request.getSession().setAttribute("searchCurrentPage", page);
		request.getSession().setAttribute("searchPeriod", searchPeriod);
		request.getSession().setAttribute("searchGender", searchGender);
		request.getSession().setAttribute("searchTeachMethod", searchTeachMethod);
		return "search";
		
	}
	
	/**
	 * 进入用户搜索页面,带条件筛选
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value = "/nav")
	public String searchUrl(HttpServletRequest request, HttpServletResponse response){
		
		String keyword=request.getParameter("keyword");
		String searchPeriod=request.getParameter("sPeriod");
		String searchGrade=request.getParameter("sGrade");
		String searchGender=request.getParameter("sGender");
		String searchTeachMethod=request.getParameter("sTeachMethod");
		if(keyword==null){
			keyword="";
		}
		try {
			keyword=new String(keyword.getBytes("ISO-8859-1"), "utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		int page=Integer.parseInt(request.getParameter("page"));
		String pageAction=request.getParameter("pageAction");
		if("pre".equals(pageAction)){
			page--;
		}else if("next".equals(pageAction)){
			page++;
		}
		String keyPeriod=courseService.tranPeriod(searchPeriod);
		String keyGrade=courseService.tranGrade(searchGrade);
		String keyGender=courseService.tranGender(searchGender);
		String keyTeachMethod=courseService.tranTeachMethod(searchTeachMethod);
		Map<String, Object> map=courseService.findCoursesByKeyWord("%"+keyword+"%"+keyGender+"%"+keyTeachMethod+"%"+keyPeriod+"%"+keyGrade+"%", page+"");
		int searchBeginPage;
		if(Integer.parseInt(map.get("totalPage").toString())>10){
			searchBeginPage=(Integer.parseInt(map.get("totalPage").toString())-10);
		}else {
			searchBeginPage=1;
		}
		@SuppressWarnings("unchecked")
		List<Course> searchResultLists=(List<Course>) map.get("searchResultLists");
		if(!searchResultLists.isEmpty())
		{
			for(Course c:searchResultLists){
				c.setCreateUser(userService.getUser(Integer.parseInt(c.getCreateId())));
			}
		}
		request.getSession().setAttribute("currentKeyword", keyword);
		request.getSession().setAttribute("searchResultLists", searchResultLists);
		request.getSession().setAttribute("searchTotalPage", map.get("totalPage"));
		request.getSession().setAttribute("searchBeginPage", searchBeginPage);
		request.getSession().setAttribute("searchCurrentPage", page);
		request.getSession().setAttribute("searchPeriod", searchPeriod);
		request.getSession().setAttribute("searchGrade", searchGrade);
		request.getSession().setAttribute("searchGender", searchGender);
		request.getSession().setAttribute("searchTeachMethod", searchTeachMethod);
		return "search";
	}
	
	@RequestMapping("/myFamilyEduS/order/booking/{bookCourseId}")
	public String bookCourse(HttpServletRequest request, HttpServletResponse response,@PathVariable int bookCourseId){
		Course bookCourse=courseService.getCourse(bookCourseId);
		if(bookCourse==null){
			return "redirect:/user";
		}
		bookCourse.setCreateUser(userService.getUser(Integer.parseInt(bookCourse.getCreateId())));
		User u=(User) request.getSession().getAttribute("user");
		if(u==null){
			return "redirect:/user/login";
		}
		if(u.getParentStatus()==null||!u.getParentStatus().equals("2")){
			request.getSession().setAttribute("noParentStatus", "未完成资格认证");
			return "redirect:/user/myFamilyEduS/base";
		}
		List<Student> myStudents=studentService.findStudentsByCreateId(u.getId()+"");
		request.getSession().setAttribute("bookCourse", bookCourse);
		if(myStudents==null){
			request.getSession().setAttribute("noStudents", "用户没有学生信息");
			return "redirect:/user/myFamilyEduS/student";
		}else{
		request.getSession().setAttribute("myStudents", myStudents);
		}
		return "bookingCourse";
	}
	/**
	 * 家长进入全部订单页
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("/myFamilyEduS/order")
	public String sAllOrder(HttpServletRequest request, HttpServletResponse response){
		User u=(User) request.getSession().getAttribute("user");
		if(u==null){
			return "redirect:/user/login";
		}
		int page=Integer.parseInt(request.getParameter("page"));
		String pageAction=request.getParameter("pageAction");
		if("pre".equals(pageAction)){
			page--;
		}else if("next".equals(pageAction)){
			page++;
		}
		Map<String, Object> map=orderService.findAllOrderByParentId(u.getId()+"",page+"");
		int sOrdersBeginPage;
		if(Integer.parseInt(map.get("totalPage").toString())>10){
			sOrdersBeginPage=(Integer.parseInt(map.get("totalPage").toString())-10);
		}else {
			sOrdersBeginPage=1;
		}
		@SuppressWarnings("unchecked")
		List<Order> sMyOrders=(List<Order>) map.get("sMyOrders");
		if(!sMyOrders.isEmpty()){
			for(Order order:sMyOrders){
				System.err.println(order.getTeacherId());
				order.setTeacher(userService.getUser(Integer.parseInt(order.getTeacherId())));
				if(order.getStudentId()!=null){
				order.setStudent(studentService.getStudent(Integer.parseInt(order.getStudentId())));
				}
			}
		}
		request.getSession().setAttribute("sMyOrders", sMyOrders);
		request.getSession().setAttribute("sOrdersTotalPage", map.get("totalPage"));
		request.getSession().setAttribute("sOrdersBeginPage", sOrdersBeginPage);
		request.getSession().setAttribute("sOrdersCurrentPage", page);
		return "sAllOrders";
	}
	
	@RequestMapping("/myFamilyEduS/order/addOrder")
	public String addOrder(HttpServletRequest request, HttpServletResponse response){
		User u=(User) request.getSession().getAttribute("user");
		String studentId=request.getParameter("stuId");
		String teachDate=request.getParameter("teachDate");
		String teacherId=request.getParameter("teacherId");
		String teachSubject=request.getParameter("teachSubject");
		Order order=new Order();
		order.setCreateDate(new Date());
		order.setParentId(u.getId()+"");
		order.setStatus("0");
		order.setStudentId(studentId);
		order.setTeachDate(teachDate);
		order.setTeacherId(teacherId);
		order.setTeachSubject(teachSubject);
		order.setCommentStatus("0");
		orderService.addOrder(order);
		User teacher=userService.getUser(Integer.parseInt(teacherId));
		userService.sendNewOrderEamil(teacher.getUsername(), teacher.getEmail());
		return "redirect:/user/myFamilyEduS/order?page=1";
	}
	
	/**
	 * 家长进入未确认订单页
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("/myFamilyEduS/order/unconfirmed")
	public String sUnconfirmedOrder(HttpServletRequest request, HttpServletResponse response){
		User u=(User) request.getSession().getAttribute("user");
		if(u==null){
			return "redirect:/user/login";
		}
		int page=Integer.parseInt(request.getParameter("page"));
		String pageAction=request.getParameter("pageAction");
		if("pre".equals(pageAction)){
			page--;
		}else if("next".equals(pageAction)){
			page++;
		}
		Map<String, Object> map=orderService.findUnconfirmedOrderByParentId(u.getId()+"",page+"");
		int sOrdersBeginPage;
		if(Integer.parseInt(map.get("totalPage").toString())>10){
			sOrdersBeginPage=(Integer.parseInt(map.get("totalPage").toString())-10);
		}else {
			sOrdersBeginPage=1;
		}
		@SuppressWarnings("unchecked")
		List<Order> sMyOrders=(List<Order>) map.get("sMyOrders");
		if(!sMyOrders.isEmpty()){
			for(Order order:sMyOrders){
				order.setTeacher(userService.getUser(Integer.parseInt(order.getTeacherId())));
				if(order.getStudentId()!=null){
				order.setStudent(studentService.getStudent(Integer.parseInt(order.getStudentId())));
				}
			}
		}
		request.getSession().setAttribute("sMyOrders", sMyOrders);
		request.getSession().setAttribute("sOrdersTotalPage", map.get("totalPage"));
		request.getSession().setAttribute("sOrdersBeginPage", sOrdersBeginPage);
		request.getSession().setAttribute("sOrdersCurrentPage", page);
		return "sUnconfirmedOrders";
	}
	
	/**
	 * 家长进入确认订单页
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("/myFamilyEduS/order/confirmed")
	public String sConfirmedOrder(HttpServletRequest request, HttpServletResponse response){
		User u=(User) request.getSession().getAttribute("user");
		if(u==null){
			return "redirect:/user/login";
		}
		int page=Integer.parseInt(request.getParameter("page"));
		String pageAction=request.getParameter("pageAction");
		if("pre".equals(pageAction)){
			page--;
		}else if("next".equals(pageAction)){
			page++;
		}
		Map<String, Object> map=orderService.findConfirmedOrderByParentId(u.getId()+"",page+"");
		int sOrdersBeginPage;
		if(Integer.parseInt(map.get("totalPage").toString())>10){
			sOrdersBeginPage=(Integer.parseInt(map.get("totalPage").toString())-10);
		}else {
			sOrdersBeginPage=1;
		}
		@SuppressWarnings("unchecked")
		List<Order> sMyOrders=(List<Order>) map.get("sMyOrders");
		if(!sMyOrders.isEmpty()){
			for(Order order:sMyOrders){
				order.setTeacher(userService.getUser(Integer.parseInt(order.getTeacherId())));
				order.setStudent(studentService.getStudent(Integer.parseInt(order.getStudentId())));
			}
		}
		request.getSession().setAttribute("sMyOrders", sMyOrders);
		request.getSession().setAttribute("sOrdersTotalPage", map.get("totalPage"));
		request.getSession().setAttribute("sOrdersBeginPage", sOrdersBeginPage);
		request.getSession().setAttribute("sOrdersCurrentPage", page);
		return "sConfirmedOrders";
	}
	
	/**
	 * 删除订单
	 * 
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value = "/myFamilyEduS/order/deleteOrder/{orderId}", method = RequestMethod.POST)
	public String deleteOrder(HttpServletRequest request, HttpServletResponse response,@PathVariable String orderId) {
		String location = request.getParameter("location");
		String reason=request.getParameter("deleteReason");
		String role=request.getParameter("role");
		Order order=orderService.getOrder(orderId);
		User teacher=userService.getUser(Integer.parseInt(order.getTeacherId()));
		User parent=userService.getUser(Integer.parseInt(order.getParentId()));
		String email;
		if(role.equals("家长")){
			email=teacher.getEmail();
		}else {
			email=parent.getEmail();
		}
		userService.sendDeleteOrderEamil(teacher.getUsername()
				,parent.getUsername(), 
			email, reason, role);
		orderService.deleteOrder(orderId);
		return location;
	}
	
	/**
	 * 家长进入全部订单页
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("/myFamilyEduT/order")
	public String tAllOrder(HttpServletRequest request, HttpServletResponse response){
		User u=(User) request.getSession().getAttribute("user");
		if(u==null){
			return "redirect:/user/login";
		}
		int page=Integer.parseInt(request.getParameter("page"));
		String pageAction=request.getParameter("pageAction");
		if("pre".equals(pageAction)){
			page--;
		}else if("next".equals(pageAction)){
			page++;
		}
		Map<String, Object> map=orderService.findAllOrderByTeacherId(u.getId()+"",page+"");
		int tOrdersBeginPage;
		if(Integer.parseInt(map.get("totalPage").toString())>10){
			tOrdersBeginPage=(Integer.parseInt(map.get("totalPage").toString())-10);
		}else {
			tOrdersBeginPage=1;
		}
		@SuppressWarnings("unchecked")
		List<Order> tMyOrders=(List<Order>) map.get("tMyOrders");
		if(!tMyOrders.isEmpty()){
			for(Order order:tMyOrders){
				order.setParent(userService.getUser(Integer.parseInt(order.getParentId())));
				order.setStudent(studentService.getStudent(Integer.parseInt(order.getStudentId())));
			}
		}
		request.getSession().setAttribute("tMyOrders", tMyOrders);
		request.getSession().setAttribute("tOrdersTotalPage", map.get("totalPage"));
		request.getSession().setAttribute("tOrdersBeginPage", tOrdersBeginPage);
		request.getSession().setAttribute("tOrdersCurrentPage", page);
		return "tAllOrders";
	}
	
	/**
	 * 教师进入未确认订单页
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("/myFamilyEduT/order/unconfirmed")
	public String tUnconfirmedOrder(HttpServletRequest request, HttpServletResponse response){
		User u=(User) request.getSession().getAttribute("user");
		if(u==null){
			return "redirect:/user/login";
		}
		int page=Integer.parseInt(request.getParameter("page"));
		String pageAction=request.getParameter("pageAction");
		if("pre".equals(pageAction)){
			page--;
		}else if("next".equals(pageAction)){
			page++;
		}
		Map<String, Object> map=orderService.findUnconfirmedOrderByTeacherId(u.getId()+"",page+"");
		int tOrdersBeginPage;
		if(Integer.parseInt(map.get("totalPage").toString())>10){
			tOrdersBeginPage=(Integer.parseInt(map.get("totalPage").toString())-10);
		}else {
			tOrdersBeginPage=1;
		}
		@SuppressWarnings("unchecked")
		List<Order> tMyOrders=(List<Order>) map.get("tMyOrders");
		if(!tMyOrders.isEmpty()){
			for(Order order:tMyOrders){
				order.setParent(userService.getUser(Integer.parseInt(order.getParentId())));
				order.setStudent(studentService.getStudent(Integer.parseInt(order.getStudentId())));
			}
		}
		request.getSession().setAttribute("tMyOrders", tMyOrders);
		request.getSession().setAttribute("tOrdersTotalPage", map.get("totalPage"));
		request.getSession().setAttribute("tOrdersBeginPage", tOrdersBeginPage);
		request.getSession().setAttribute("tOrdersCurrentPage", page);
		return "tUnconfirmedOrders";
	}
	
	/**
	 * 教师进入确认订单页
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("/myFamilyEduT/order/confirmed")
	public String tConfirmedOrder(HttpServletRequest request, HttpServletResponse response){
		User u=(User) request.getSession().getAttribute("user");
		if(u==null){
			return "redirect:/user/login";
		}
		int page=Integer.parseInt(request.getParameter("page"));
		String pageAction=request.getParameter("pageAction");
		if("pre".equals(pageAction)){
			page--;
		}else if("next".equals(pageAction)){
			page++;
		}
		Map<String, Object> map=orderService.findConfirmedOrderByTeacherId(u.getId()+"",page+"");
		int tOrdersBeginPage;
		if(Integer.parseInt(map.get("totalPage").toString())>10){
			tOrdersBeginPage=(Integer.parseInt(map.get("totalPage").toString())-10);
		}else {
			tOrdersBeginPage=1;
		}
		@SuppressWarnings("unchecked")
		List<Order> tMyOrders=(List<Order>) map.get("tMyOrders");
		if(!tMyOrders.isEmpty()){
			for(Order order:tMyOrders){
				order.setParent(userService.getUser(Integer.parseInt(order.getParentId())));
				order.setStudent(studentService.getStudent(Integer.parseInt(order.getStudentId())));
			}
		}
		request.getSession().setAttribute("tMyOrders", tMyOrders);
		request.getSession().setAttribute("tOrdersTotalPage", map.get("totalPage"));
		request.getSession().setAttribute("tOrdersBeginPage", tOrdersBeginPage);
		request.getSession().setAttribute("tOrdersCurrentPage", page);
		return "tConfirmedOrders";
	}
	
	/**
	 * 获取订单详细信息并进入订单详细页面
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value="/order/detail", method = RequestMethod.POST)
	public String orderDetail(HttpServletRequest request, HttpServletResponse response){
		String orderId=request.getParameter("orderId");
		return "redirect:/user/order/orderDetail?orderId="+orderId;
	}
	
	/**
	 * 重定向进入，避免刷新重复提交
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value="/order/orderDetail")
	public String orderDetailJsp(HttpServletRequest request, HttpServletResponse response){
		User u=(User) request.getSession().getAttribute("user");
		if(u==null){
			return "redirect:/user/login";
		}
		String orderId=request.getParameter("orderId");
		Order order=null;
		try{
		order=orderService.getOrder(orderId);
		}catch(Exception e){
			return "redirect:/user";
		}
		if(order==null){
			return "redirect:/user";
		}
		if(!order.getParentId().equals(u.getId()+"") && !order.getTeacherId().equals(u.getId()+"")){
			return "redirect:/user";
		}
		order.setTeacher(userService.getUser(Integer.parseInt(order.getTeacherId())));
		order.setParent(userService.getUser(Integer.parseInt(order.getParentId())));
		order.setStudent(studentService.getStudent(Integer.parseInt(order.getStudentId())));
		request.getSession().setAttribute("order", order);
		return "orderDetail";
	}
	
	/**
	 * 确认订单
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value="/myFamilyEduT/order/fFirmOrder",method=RequestMethod.POST)
	public String tFirmOrder(HttpServletRequest request, HttpServletResponse response){
		String orderId=request.getParameter("orderId");
		Order order=orderService.getOrder(orderId);
		String location=request.getParameter("location");
		order.setStatus("1");
		orderService.updateOrder(order);
		User teacher=userService.getUser(Integer.parseInt(order.getTeacherId()));
		User parent=userService.getUser(Integer.parseInt(order.getParentId()));
		userService.sendTFirmOrderEmail(teacher.getUsername(), parent.getUsername(), parent.getEmail());
		return location;
	}
	
	/**
	 * 订单评价
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value="/myFamilyEduS/order/commentOrder/{orderId}",method=RequestMethod.POST)
	public String commentOrder(HttpServletRequest request, HttpServletResponse response,@PathVariable String orderId){
		Order order=orderService.getOrder(orderId);
		String location=request.getParameter("location");
		String comment=request.getParameter("comment");
		order.setCommentStatus("1");
		order.setComment(comment);
		orderService.updateOrder(order);
		return location;
	}
	
}
