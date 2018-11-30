package net.skhu.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import net.skhu.dto.Department;

@Mapper
public interface DepartmentMapper {
	List<Department> findAll();
	List<Department> findRealDept();
	List<Department> findItDept();
	List<Department> findLiberal();
	
	Department findById(int departmentId);
}
