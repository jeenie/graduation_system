package net.skhu.dto;

import java.sql.Date;

public class Comment {
	int student_administrationcol;
	int professorId;
	int studentId;
	String comment;
	Date dateWritten;
	
	public int getStudent_administrationcol() {
		return student_administrationcol;
	}
	public void setStudent_administrationcol(int student_administrationcol) {
		this.student_administrationcol = student_administrationcol;
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
	public Date getDateWritten() {
		return dateWritten;
	}
	public void setDateWritten(Date dateWritten) {
		this.dateWritten = dateWritten;
	}
}
