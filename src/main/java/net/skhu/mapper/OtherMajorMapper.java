package net.skhu.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import net.skhu.dto.OtherMajor;

@Mapper
public interface OtherMajorMapper {
	List<OtherMajor> otherMajorStatus(int studentId);
	void insert(OtherMajor othermajor);
	void update(int userNumber, String type, String subjectId);
	List<OtherMajor> anotherMajorList(int userNumber, int departmentId);
	OtherMajor otherMajorData(int userNumber, String subjectId);
	String findBeforeType(int userNumber, String subjectId);
	void delete(int userNumber, String subjectId);
}

