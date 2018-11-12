package net.skhu.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import net.skhu.dto.DepartmentCulture;

@Mapper
public interface DepartmentCultureMapper {
	List<DepartmentCulture> findByDepartmentId(int departmentId, int entranceYear);
}
