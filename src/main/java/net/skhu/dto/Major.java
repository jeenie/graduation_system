package net.skhu.dto;

//전공
public class Major {
	int departmentId;
	String departmentName;
	String majorSubjectId;
	String majorName;
	
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
	
	public String getMajorSubjectId() {
		return majorSubjectId;
	}
	
	public void setMajorSubjectId(String majorSubjectId) {
		this.majorSubjectId = majorSubjectId;
	}
	
	public String getMajorName() {
		return majorName;
	}
	
	public void setMajorName(String majorName) {
		this.majorName = majorName;
	}
}
