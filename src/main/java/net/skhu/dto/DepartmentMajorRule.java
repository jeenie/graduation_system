package net.skhu.dto;

public class DepartmentMajorRule {
	int departmentId;
	int processId;
	int entranceYear;
	int mustMajor;
	int choiceMajor;
	int mustPlusChoice;
	
	public int getDepartmentId() {
		return departmentId;
	}
	
	public void setDepartmentId(int departmentId) {
		this.departmentId = departmentId;
	}
	
	public int getProcessId() {
		return processId;
	}
	
	public void setProcessId(int processId) {
		this.processId = processId;
	}
	
	public int getEntranceYear() {
		return entranceYear;
	}
	
	public void setEntranceYear(int entranceYear) {
		this.entranceYear = entranceYear;
	}
	
	public int getMustMajor() {
		return mustMajor;
	}
	
	public void setMustMajor(int mustMajor) {
		this.mustMajor = mustMajor;
	}
	
	public int getChoiceMajor() {
		return choiceMajor;
	}
	
	
	public void setChoiceMajor(int choiceMajor) {
		this.choiceMajor = choiceMajor;
	}
	
	public int getMustPlusChoice() {
		return mustPlusChoice;
	}
	
	public void setMustPlusChoice(int mustPlusChoice) {
		this.mustPlusChoice = mustPlusChoice;
	}
}
