package net.skhu.dto;

//18학번
//학부 내 전공 객체
public class DepartmentMajor {
	int majorId;
	String majorName;
	int departmentId;
	
	public int getMajorId() {
		return majorId;
	}
	
	public void setMajorId(int majorId) {
		this.majorId = majorId;
	}
	
	public String getMajorName() {
		return majorName;
	}
	
	public void setMajorName(String majorName) {
		this.majorName = majorName;
	}
	
	public int getDepartmentId() {
		return departmentId;
	}
	
	public void setDepartmentId(int departmentId) {
		this.departmentId = departmentId;
	}
}
