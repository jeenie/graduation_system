package net.skhu.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import net.skhu.dto.Student;

@Mapper
public interface StudentMapper {
	List<Student> findAll();
	List<Student> findByDepartment(int departmentId);
	Student findById(int id);
	void insert(Student student);
	void update(Student student);
	void delete(int id);
}
