package net.skhu.dto;

import java.util.Date;

public class StudentGradeFile {
	int id;
	Date latestUploadDate;
	int totalUnit;
	int majorUnit;
	int cultureUnit;
	int majorExUnit;
	double totalAvgGrade;

	int totalRequiredMajor;
	int totalSelectedMajor;
	int totalRequiredCulture;
	int totalSelectedCulture;

	public int getTotalRequiredMajor() {
		return totalRequiredMajor;
	}
	public void setTotalRequiredMajor(int totalRequiredMajor) {
		this.totalRequiredMajor = totalRequiredMajor;
	}
	public int getTotalSelectedMajor() {
		return totalSelectedMajor;
	}
	public void setTotalSelectedMajor(int totalSelectedMajor) {
		this.totalSelectedMajor = totalSelectedMajor;
	}
	public int getTotalRequiredCulture() {
		return totalRequiredCulture;
	}
	public void setTotalRequiredCulture(int totalRequiredCulture) {
		this.totalRequiredCulture = totalRequiredCulture;
	}
	public int getTotalSelectedCulture() {
		return totalSelectedCulture;
	}
	public void setTotalSelectedCulture(int totalSelectedCulture) {
		this.totalSelectedCulture = totalSelectedCulture;
	}


	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public Date getLatestUploadDate() {
		return latestUploadDate;
	}
	public void setLatestUploadDate(Date latestUploadDate) {
		this.latestUploadDate = latestUploadDate;
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
	public int getMajorExUnit() {
		return majorExUnit;
	}
	public void setMajorExUnit(int majorExUnit) {
		this.majorExUnit = majorExUnit;
	}
	public double getTotalAvgGrade() {
		return totalAvgGrade;
	}
	public void setTotalAvgGrade(double totalAvgGrade) {
		this.totalAvgGrade = totalAvgGrade;
	}
}
