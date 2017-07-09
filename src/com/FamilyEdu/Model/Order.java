package com.FamilyEdu.Model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;

/**
 * 订单
 * @author Gu
 *
 */
@Entity
@Table(name="courseOrder")
public class Order {
	
//	主键，自增长
	private int id;
	
//	家长id
	private String parentId;
	
//	家教Id
	private String teacherId;
	
//	学生Id
	private String studentId;
	
//	教学课程
	private String teachSubject;
	
//	教学时间
	private String teachDate;
	
	private User parent;
	
	private User teacher;
	
	private Student student;
	
//	评价状态，0未评价，1已评价
	private String commentStatus;
	
//	评价内容
	private String comment;
	
	
//	订单状态,0待确认，1已确认
	private String status;
	
//	订单生产时间
	private Date createDate;

	@Id
	@Column(name="id")
	@GeneratedValue(strategy = GenerationType.AUTO)
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getParentId() {
		return parentId;
	}

	public void setParentId(String parentId) {
		this.parentId = parentId;
	}

	public String getTeacherId() {
		return teacherId;
	}

	public void setTeacherId(String teacherId) {
		this.teacherId = teacherId;
	}

	public String getStudentId() {
		return studentId;
	}

	public void setStudentId(String studentId) {
		this.studentId = studentId;
	}

	public String getTeachSubject() {
		return teachSubject;
	}

	public void setTeachSubject(String teachSubject) {
		this.teachSubject = teachSubject;
	}

	public String getTeachDate() {
		return teachDate;
	}

	public void setTeachDate(String teachDate) {
		this.teachDate = teachDate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "createDate", length = 19)
	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	@Transient
	public User getParent() {
		return parent;
	}

	public void setParent(User parent) {
		this.parent = parent;
	}

	@Transient
	public User getTeacher() {
		return teacher;
	}

	public void setTeacher(User teacher) {
		this.teacher = teacher;
	}

	@Transient
	public Student getStudent() {
		return student;
	}

	public void setStudent(Student student) {
		this.student = student;
	}

	public String getCommentStatus() {
		return commentStatus;
	}

	public void setCommentStatus(String commentStatus) {
		this.commentStatus = commentStatus;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}
	
	
	

}
