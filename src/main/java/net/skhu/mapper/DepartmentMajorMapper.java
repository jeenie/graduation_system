package net.skhu.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import net.skhu.dto.DepartmentMajor;

//학부 내 전공 목록 관리를 위한 mapper
@Mapper
public interface DepartmentMajorMapper {
	List<DepartmentMajor> findMajorsByDepartmentId(int departmentId);
}
