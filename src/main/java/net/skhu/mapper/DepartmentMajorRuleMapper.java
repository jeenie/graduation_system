package net.skhu.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import net.skhu.dto.DepartmentMajorRule;

@Mapper
public interface DepartmentMajorRuleMapper {
	DepartmentMajorRule findFirst(int departmentId, int entranceYear);

	DepartmentMajorRule findSecond(int departmentId, int entranceYear);

	DepartmentMajorRule findTotalMajor(int departmentId, int entranceYear, int processId);

	List<DepartmentMajorRule> findByDepartmentId(int departmentId, int entranceYear);

	void updateList(List<DepartmentMajorRule> list);

	void update(DepartmentMajorRule departmentMajorRule);
}
