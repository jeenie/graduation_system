package net.skhu.model;

import java.util.List;

import net.skhu.dto.DepartmentMajorRule;
import net.skhu.dto.Student;
import net.skhu.dto.StudentGradefile;
import net.skhu.dto.Total;

public class StudentVO {
	Student student;
	
	StudentGradefile fileData;
	

	List<DepartmentMajorRule> rules;
	
	Total total;

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
	
}
