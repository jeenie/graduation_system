package net.skhu.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import net.skhu.dto.Professor;

@Mapper
public interface ProfessorMapper {
	Professor findById(int id);
	List<Professor> findAll();
	List<Professor> findByDepartment(String departmentName);
	Professor findOne(String professorId);
	List<Professor> findByInquiry(String name, Integer id, String departmentName);
	void insert(Professor professor);
	void update(Professor professor);
	void delete(int id);
	
	
	
	
}
