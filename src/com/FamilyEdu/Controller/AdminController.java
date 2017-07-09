package com.FamilyEdu.Controller;

import java.io.UnsupportedEncodingException;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.FamilyEdu.Model.Admin;
import com.FamilyEdu.Model.User;
import com.FamilyEdu.Service.AdminService;
import com.FamilyEdu.Service.UserService;

@Controller
@RequestMapping("admin")
public class AdminController {

	@Autowired
	private AdminService adminService;
	
	@Autowired
	private UserService userService;
	
	/**
	 * 进入管理员登录页面
	 * @return
	 */
	@RequestMapping("/login")
	public String adminSign_in(){
		return "adminLogin";
	}
	
	/**
	 * 管理员登录
	 * @return
	 */
	@RequestMapping("/sign_in")
	public String adminLogin(HttpServletRequest request, HttpServletResponse response){
		String username=request.getParameter("username");
		String password=request.getParameter("password");
		Admin admin=adminService.isLogin(username, password);
		if(admin!=null){
		request.getSession().setAttribute("admin", admin);
		return "redirect:/admin/main";
		}else{
			request.getSession().setAttribute("adminError", "adminError");
		return "redirect:/admin/login";
		}
	}
	
	@RequestMapping("/main")
	public String main(HttpServletRequest request, HttpServletResponse response){
		return "admin";
	}
	
	@RequestMapping("/adminLoginOut")
	public String adminLoginOut(HttpServletRequest request, HttpServletResponse response){
		return "adminlogout";
	}
	
	@RequestMapping("/findWaitingValidateTeachers")
	public String findWaitingValidateTeachers(HttpServletRequest request, HttpServletResponse response){
		int page=Integer.parseInt(request.getParameter("page"));
		String pageAction=request.getParameter("pageAction");
		if("pre".equals(pageAction)){
			page--;
		}else if("next".equals(pageAction)){
			page++;
		}
		int teachersBeginPage;
		Map<String,Object> map=userService.findWaitingValidateTeachers(page+"");
		if(Integer.parseInt(map.get("totalPage").toString())>10){
			teachersBeginPage=(Integer.parseInt(map.get("totalPage").toString())-10);
		}else {
			teachersBeginPage=1;
		}
		request.getSession().setAttribute("waitingValidateTeachers", map.get("teachers"));
		request.getSession().setAttribute("teachersTotalPage", map.get("totalPage"));
		request.getSession().setAttribute("teachersBeginPage", teachersBeginPage);
		request.getSession().setAttribute("teachersCurrentPage", page);
		return "waitingValidateTeachers";
	}
	
	@RequestMapping("/findWaitingValidateParents")
	public String findWaitingValidateParents(HttpServletRequest request, HttpServletResponse response){
		int page=Integer.parseInt(request.getParameter("page"));
		String pageAction=request.getParameter("pageAction");
		if("pre".equals(pageAction)){
			page--;
		}else if("next".equals(pageAction)){
			page++;
		}
		int parentsBeginPage;
		Map<String,Object> map=userService.findWaitingValidateParents(page+"");
		if(Integer.parseInt(map.get("totalPage").toString())>10){
			parentsBeginPage=(Integer.parseInt(map.get("totalPage").toString())-10);
		}else {
			parentsBeginPage=1;
		}
		request.getSession().setAttribute("waitingValidateParents", map.get("parents"));
		request.getSession().setAttribute("parentsTotalPage", map.get("totalPage"));
		request.getSession().setAttribute("parentsBeginPage", parentsBeginPage);
		request.getSession().setAttribute("parentsCurrentPage", page);
		return "waitingValidateParents";
	}
	
	@RequestMapping("/checkedFail/{id}")
	public String checkedFail(HttpServletRequest request, HttpServletResponse response,@PathVariable String id){
		String type=request.getParameter("type");
		String reason=request.getParameter("failReason");
		User u=userService.getUser(Integer.parseInt(id));
		if(type.equals("教师资格")){
		u.setImageStatus("0");
		}else if(type.equals("家长认证")){
			u.setParentStatus("0");
		}
		userService.updateUser(u);
		adminService.sendCheckedFailEmail(u.getUsername(), u.getEmail(), reason, type);
		return "redirect:/admin/findWaitingValidateTeachers?page=1";
	}
	
	@RequestMapping("/checkedSuccess/{id}/{type}")
	public String checkedSuccess(HttpServletRequest request, HttpServletResponse response,@PathVariable String id,@PathVariable String type){
		try {
			type=new String(type.getBytes("ISO-8859-1"), "utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		User u=userService.getUser(Integer.parseInt(id));
		if(type.equals("教师资格")){
			u.setImageStatus("2");
			u.setParentStatus("2");
			}else if(type.equals("家长认证")){
				u.setParentStatus("2");
			}
		userService.updateUser(u);
		adminService.sendCheckedSuccessEmail(u.getUsername(), u.getEmail(), type);
		return "redirect:/admin/findWaitingValidateTeachers?page=1";
	}
}
