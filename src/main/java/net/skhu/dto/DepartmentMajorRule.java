package net.skhu.dto;

//학과별 전공과정
public class DepartmentMajorRule {
	int departmentId;
	String departmentName;
	int processId;
	String processName;
	int entranceYear;
	int mustMajor;
	int choiceMajor;
	int mustPlusChoice;
	int addCulture;

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

	public int getProcessId() {
		return processId;
	}

	public void setProcessId(int processId) {
		this.processId = processId;
	}

	public String getProcessName() {
		return processName;
	}

	public void setProcessName(String processName) {
		this.processName = processName;
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

	public int getAddCulture() {
		return addCulture;
	}

	public void setAddCulture(int addCulture) {
		this.addCulture = addCulture;
	}
}