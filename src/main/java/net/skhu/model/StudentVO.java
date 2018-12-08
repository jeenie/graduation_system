package net.skhu.model;

import java.util.ArrayList;
import java.util.List;

import net.skhu.dto.DepartmentMajorRule;
import net.skhu.dto.Major;
import net.skhu.dto.RequiredCultureCount;
import net.skhu.dto.RequiredCultureSubject;
import net.skhu.dto.Student;
import net.skhu.dto.StudentGradefile;
import net.skhu.dto.StudentSubjectGrade;
import net.skhu.dto.Total;

public class StudentVO {
	Student student;
	
	StudentGradefile fileData;
	

	List<DepartmentMajorRule> rules;

	Total total;
	
	List<Major> unlisten;
	

	List<StudentSubjectGrade> listen;
	
	int entranceYear;
	
	//교양
	RequiredCultureCount requiredCultureCount;
	
	int serveSubject;
	int chapelSubject;
	
	List<StudentSubjectGrade> mustCulture;
	
	List<StudentSubjectGrade> s1;
	List<RequiredCultureSubject> s2;
	
	
	public Student getStudent() {
		return student;
	}

	public void setStudent(Student student) {
		this.student = student;
	}

	public StudentGradefile getFileData() {
		return fileData;
	}

	public void setFileData(StudentGradefile fileData) {
		this.fileData = fileData;
	}
	
	public List<DepartmentMajorRule> getRules() {
		return rules;
	}

	public void setRules(List<DepartmentMajorRule> rules) {
		this.rules = rules;
	}

	public Total getTotal() {
		return total;
	}

	public void setTotal(Total total) {
		this.total = total;
	}
	
	
	public int getEntranceYear() {
		return entranceYear;
	}

	public void setEntranceYear(int entranceYear) {
		this.entranceYear = entranceYear;
	}
	
	public List<Major> getUnlisten() {
		return unlisten;
	}

	public void setUnlisten(List<Major> unlisten) {
		this.unlisten = unlisten;
	}

	public List<StudentSubjectGrade> getListen() {
		return listen;
	}

	public void setListen(List<StudentSubjectGrade> listen) {
		this.listen = listen;
	}
	
	public RequiredCultureCount getRequiredCultureCount() {
		return requiredCultureCount;
	}

	public void setRequiredCultureCount(RequiredCultureCount requiredCultureCount) {
		this.requiredCultureCount = requiredCultureCount;
	}

	public int getServeSubject() {
		return serveSubject;
	}

	public void setServeSubject(int serveSubject) {
		this.serveSubject = serveSubject;
	}

	public int getChapelSubject() {
		return chapelSubject;
	}

	public void setChapelSubject(int chapelSubject) {
		this.chapelSubject = chapelSubject;
	}
	
	public List<StudentSubjectGrade> getMustCulture() {
		return mustCulture;
	}

	public void setMustCulture(List<StudentSubjectGrade> mustCulture) {
		this.mustCulture = mustCulture;
	}
	
	public void setS1(List<StudentSubjectGrade> s1) {
		this.s1 = s1;
	}

	public List<RequiredCultureSubject> getS2() {
		return s2;
	}

	public void setS2(List<RequiredCultureSubject> s2) {
		this.s2 = s2;
	}
	
	public List<StudentSubjectGrade> getS1() {
		return s1;
	}

	



}
