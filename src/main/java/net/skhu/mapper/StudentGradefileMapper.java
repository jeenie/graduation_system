package net.skhu.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import net.skhu.dto.MyCell;
import net.skhu.dto.StudentGradefile;

@Mapper
public interface StudentGradefileMapper {
	List<StudentGradefile> findAll();
	StudentGradefile findById(int id);
	void insert(StudentGradefile studentGradefile);
}