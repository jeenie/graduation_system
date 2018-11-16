package net.skhu.dto;

import org.springframework.web.multipart.MultipartFile;

public class Student {
	int id;
	String name;
	int departmentId;
	String departmentName;
	int grade;
	String entranceType;
	String password;
	String password2;
	String passwordQuestion;
	String quizContent;
	String passwordAnswer;
	String email;
	String subjectName;
	int completeSemester;
	int totalUnit;
	int majorUnit;
	int cultureUnit;
	int majorexUnit;
	int processId;
	int mustPlusChoice;
	MultipartFile file;

	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
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

	public int getGrade() {
		return grade;
	}

	public void setGrade(int grade) {
		this.grade = grade;
	}

	public String getEntranceType() {
		return entranceType;
	}

	public void setEntranceType(String entranceType) {
		this.entranceType = entranceType;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getPassword2() {
		return password2;
	}

	public void setPassword2(String password2) {
		this.password2 = password2;
	}

	public String getPasswordQuestion() {
		return passwordQuestion;
	}

	public void setPasswordQuestion(String passwordQuestion) {
		this.passwordQuestion = passwordQuestion;
	}
	
	public String getQuizContent() {
		return quizContent;
	}

	public void setQuizContent(String quizContent) {
		this.quizContent = quizContent;
	}

	public String getPasswordAnswer() {
		return passwordAnswer;
	}

	public void setPasswordAnswer(String passwordAnswer) {
		this.passwordAnswer = passwordAnswer;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public int getCompleteSemester() {
		return completeSemester;
	}

	public void setCompleteSemester(int completeSemester) {
		this.completeSemester = completeSemester;
	}
	
	public int getTotalUnit() {
		return totalUnit;
	}

	public void setTotalUnit(int totalUnit) {
		this.totalUnit = totalUnit;
	}

	public int getMajorUnit() {
		return majorUnit;
	}

	public void setMajorUnit(int majorUnit) {
		this.majorUnit = majorUnit;
	}

	public int getCultureUnit() {
		return cultureUnit;
	}

	public void setCultureUnit(int cultureUnit) {
		this.cultureUnit = cultureUnit;
	}

	public int getMajorexUnit() {
		return majorexUnit;
	}

	public void setMajorexUnit(int majorexUnit) {
		this.majorexUnit = majorexUnit;
	}

	public int getProcessId() {
		return processId;
	}

	public void setProcessId(int processId) {
		this.processId = processId;
	}

	public int getMustPlusChoice() {
		return mustPlusChoice;
	}

	public void setMustPlusChoice(int mustPlusChoice) {
		this.mustPlusChoice = mustPlusChoice;
	}
	
	public String getSubjectName() {
		return subjectName;
	}
	
	public void setSubjectName(String subjectName) {
		this.subjectName = subjectName;
	}
	
	public MultipartFile getFile() {
		return file;
	}

	public void setFile(MultipartFile file) {
		this.file = file;
	}


}
