package net.skhu.dto;

//전공에 따른 전공탐색 과목 객체 
public class MajorExploration {
	int majorId;
	String subjectId;
	String subjectName;
	
	public int getMajorId() {
		return majorId;
	}
	
	public void setMajorId(int majorId) {
		this.majorId = majorId;
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
}
