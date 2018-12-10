package net.skhu.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import net.skhu.dto.StudentAdmin;

@Mapper
public interface  StudentAdminMapper {
	void insert(StudentAdmin studentAdmin);
	List<StudentAdmin> findById();
}
