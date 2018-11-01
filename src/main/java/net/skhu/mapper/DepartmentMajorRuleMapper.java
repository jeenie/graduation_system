package net.skhu.mapper;

import org.apache.ibatis.annotations.Mapper;

import net.skhu.dto.DepartmentMajorRule;

@Mapper
public interface DepartmentMajorRuleMapper {
	DepartmentMajorRule findByDepartmentId(int departmentId, int processId);
	void update(DepartmentMajorRule departmentMajorRule);
}
