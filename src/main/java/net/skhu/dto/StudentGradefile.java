package net.skhu.dto;

import java.util.Date;

public class StudentGradefile {
	int id;
	Date latestUploadDate;
	int totalUnit;
	int majorUnit;
	int cultureUnit;
	float totalAvgGrade;
	int majorexUnit;

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

	public float getTotalAvgGrade() {
		return totalAvgGrade;
	}

	public void setTotalAvgGrade(float totalAvgGrade) {
		this.totalAvgGrade = totalAvgGrade;
	}

	public int getMajorexUnit() {
		return majorexUnit;
	}

	public void setMajorexUnit(int majorexUnit) {
		this.majorexUnit = majorexUnit;
	}

}