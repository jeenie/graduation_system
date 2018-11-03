package net.skhu.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import net.skhu.dto.DepartmentMajorRule;

@Mapper
public interface DepartmentMajorRuleMapper {
	DepartmentMajorRule findFirst(int departmentId, int entranceYear);
	List<DepartmentMajorRule> findByDepartmentId(int departmentId, int entranceYear);
	void update(DepartmentMajorRule departmentMajorRule);
}
