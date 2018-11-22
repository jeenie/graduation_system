package net.skhu.dto;

public class StudentSubjectGrade {
	int id;
	String subjectId;
	String subjectName;
	int subjectScore;
	String grade;
	String completeType;
	int departmentId;
	String departmentName;
	int yearOfClass;
	String yearOfSemester;
	/***
	List <StudentSubjectGrade> grades;

	public List<StudentSubjectGrade> getGrades() {
		return grades;
	}
	public void setGrades(List<StudentSubjectGrade> grades) {
		this.grades = grades;
	}
	***/

	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getSubjectId() {
		return subjectId;
	}
	public void setSubjectId(String subjectId) {
		this.subjectId = subjectId;
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
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	public String getCompleteType() {
		return completeType;
	}
	public void setCompleteType(String completeType) {
		this.completeType = completeType;
	}
	public int getDepartmentId() {
		return departmentId;
	}
	public void setDepartmentId(int departmentId) {
		this.departmentId = departmentId;
	}
	public String getDepartmentName() {
		return departmentName;
	}
	public void setDepartmentName(String departmentName) {
		this.departmentName = departmentName;
	}
	public int getYearOfClass() {
		return yearOfClass;
	}
	public void setYearOfClass(int yearOfClass) {
		this.yearOfClass = yearOfClass;
	}
	public String getYearOfSemester() {
		return yearOfSemester;
	}
	public void setYearOfSemester(String yearOfSemester) {
		this.yearOfSemester = yearOfSemester;
	}
}
