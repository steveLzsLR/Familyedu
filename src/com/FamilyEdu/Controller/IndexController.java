package com.FamilyEdu.Controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.FamilyEdu.Model.Course;
import com.FamilyEdu.Model.User;
import com.FamilyEdu.Service.CourseService;
import com.FamilyEdu.Service.UserService;



@Controller
public class IndexController {
	
	@Autowired
	private UserService userService; 
	
	@Autowired
	private CourseService courseService;
	
	
	/**
	 * 默认方法，访问进入首页
	 * @return
	 */
	@RequestMapping("")
	public String index(HttpServletRequest request, HttpServletResponse response){
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
	 * 进入用户注册页面
	 * @return
	 */
	@RequestMapping("/user/register")
	public String userRegister(){
		return "userRegister";
	}
	
	/**
	 * 注销用户
	 * @return
	 */
	@RequestMapping("/user/loginout")
	public String loginout(){
		return "logout";
	}
	


}
