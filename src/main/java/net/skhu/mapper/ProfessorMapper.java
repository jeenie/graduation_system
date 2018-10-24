package net.skhu.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import net.skhu.dto.Professor;
@Mapper
public interface ProfessorMapper {
	Professor findOne(String professorId);
	List<Professor> findAll();
	List<Professor> findByDepartment(String departmentName);
}
