package com.FamilyEdu.Service.Impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.FamilyEdu.Dao.CourseDao;
import com.FamilyEdu.Model.Course;
import com.FamilyEdu.Service.CourseService;

@Service("courseService")
public class CourseServiceImpl implements CourseService{
	
	@Autowired
	private CourseDao courseDao;
	
	@Override
	public void addCourse(Course course) {
		courseDao.addCourse(course);
	}

	@Override
	public List<Course> findCoursesByUserId(String userId) {
		return courseDao.findCoursesByUserId(userId);
	}

	@Override
	public void deleteCourse(String id) {
		courseDao.deleteCourse(id);
	}

	@Override
	public List<Course> findCoursesByTeachType(String teachType) {
		return courseDao.findCoursesByTeachType(teachType);
	}

	@Override
	public Course getCourse(int id) {
		return courseDao.getCourse(id);
	}

	@Override
	public Map<String,Object> findCoursesByKeyWord(String keyWord, String page) {
		return courseDao.findCoursesByKeyWord(keyWord, page);
	}

	@Override
	public String tranPeriod(String searchPeriod) {
		if(searchPeriod==null){
			return "";
		}
		switch (searchPeriod) {
		case "0":
			searchPeriod="";
			break;
		case "1":
			searchPeriod="小学";
			break;
		case "2":
			searchPeriod="初中";
			break;
		case "3":
			searchPeriod="高中";
			break;
		default:
			searchPeriod="";
		}
		return searchPeriod;
	}

	@Override
	public String tranGender(String searchGender) {
		if(searchGender==null){
			return "";
		}
		switch (searchGender) {
		case "0":
			searchGender="";
			break;
		case "1":
			searchGender="男";
			break;
		case "2":
			searchGender="女";
			break;
		default:
			searchGender="";
		}
		return searchGender;
	}

	@Override
	public String tranGrade(String searchGrade) {
		if(searchGrade==null){
			return "";
		}
		switch (searchGrade) {
		case "100":
			searchGrade="";
			break;
		case "1":
			searchGrade="一年级";
			break;
		case "2":
			searchGrade="二年级";
			break;
		case "3":
			searchGrade="三年级";
			break;
		case "4":
			searchGrade="四年级";
			break;
		case "5":
			searchGrade="五年级";
			break;
		case "6":
			searchGrade="六年级";
			break;
		case "200":
			searchGrade="";
			break;
		case "7":
			searchGrade="初一";
			break;
		case "8":
			searchGrade="初二";
			break;
		case "9":
			searchGrade="初三";
			break;
		case "300":
			searchGrade="";
			break;
		case "10":
			searchGrade="高一";
			break;
		case "11":
			searchGrade="高二";
			break;
		case "12":
			searchGrade="高三";
			break;
		default:
			searchGrade="";
		}
		return searchGrade;
	}

	@Override
	public String tranTeachMethod(String searchTeachMethod) {
		if(searchTeachMethod==null){
			return "";
		}
		switch (searchTeachMethod) {
		case "0":
			searchTeachMethod="";
			break;
		case "1":
			searchTeachMethod="一对一上门教授";
			break;
		case "2":
			searchTeachMethod="一对多补习班式教学";
			break;
		default:
			searchTeachMethod="";
		}
		return searchTeachMethod;
	}

	@Override
	public Map<String, Object> findCourses(String keyWord, String page) {
		return courseDao.findCourses(keyWord, page);
	}

}
