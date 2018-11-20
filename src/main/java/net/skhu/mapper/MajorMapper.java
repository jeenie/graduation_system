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
	
	void delete(int departmentId, String majorSubjectId, int entranceYear);
}
