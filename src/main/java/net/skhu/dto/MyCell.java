package net.skhu.dto;

import java.sql.Date;

//student_subject_grade
public class MyCell {
	private Date date; //업로드 날짜
	private int id; 
	private int yearOfClass; //수강년도
	private int yearOfSemester; //학기
	private String subjectId; //과목코드
	private String subjectName; //과목명은 쿼리로 output
	private String completeType; //이수구분
	private int subjectScore; //학점은 subject table로 연결해서 output
	private String grade; //성적등급
	
	public int getYearOfClass() {
		return yearOfClass;
	}
	public void setYearOfClass(int yearOfClass) {
		this.yearOfClass = yearOfClass;
	}
	public int getYearOfSemester() {
		return yearOfSemester;
	}
	public void setYearOfSemester(int yearOfSemester) {
		this.yearOfSemester = yearOfSemester;
	}
	public String getSubjectId() {
		return subjectId;
	}
	public void setSubjectId(String subjectId) {
		this.subjectId = subjectId;
	}
	public String getCompleteType() {
		return completeType;
	}
	public void setCompleteType(String completeType) {
		this.completeType = completeType;
	}
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getSubjectName() {
		return subjectName;
	}
	public void setSubjectName(String subjectName) {
		this.subjectName = subjectName;
	}
	public int getSubjectScore() {
		return subjectScore;
	}
	public void setSubjectScore(int subjectScore) {
		this.subjectScore = subjectScore;
	}
	
	
}
