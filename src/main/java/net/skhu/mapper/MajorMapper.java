package net.skhu.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import net.skhu.dto.Major;

@Mapper
public interface MajorMapper {
	List<Major> findMustMajor(int departmentId);

	List<Major> findSoft2013MustMajor(int departmentId);

	List<Major> findSoft2014MustMajor(int departmentId);

	List<Major> findMustMajorByUser(int departmentId, int entranceYear);
	
	List<Major> findMustMajorBy2013User(int departmentId, int entranceYear);
	
	void delete(int departmentId, String majorSubjectId, int entranceYear);
	
	List<Major> findMajorList2018(int userNumber);
	
	//특정학과의 전공필수과목 목록
	List<Major> findMajorMustSubject(int departmentId);
	
	//전공 필수 과목 등록
	void insert(Major major);
}
