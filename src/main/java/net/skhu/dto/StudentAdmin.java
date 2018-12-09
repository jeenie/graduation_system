package net.skhu.dto;

import java.util.Date;

public class StudentAdmin {
	int id;
	int professorId;
	int studentId;
	String comment;
	String dateWritten;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getProfessorId() {
		return professorId;
	}
	public void setProfessorId(int professorId) {
		this.professorId = professorId;
	}
	public int getStudentId() {
		return studentId;
	}
	public void setStudentId(int studentId) {
		this.studentId = studentId;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public String getDateWritten() {
		return dateWritten;
	}
	public void setDateWritten(String dateWritten) {
		this.dateWritten = dateWritten;
	}
}
