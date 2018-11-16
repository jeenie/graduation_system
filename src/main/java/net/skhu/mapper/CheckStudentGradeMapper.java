package net.skhu.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import net.skhu.dto.Student;
import net.skhu.dto.StudentGradefile;

@Mapper
public interface CheckStudentGradeMapper {
	Student findOneMini(int id);
	List grade(int id);
	StudentGradefile totalGrade1(int id);
	StudentGradefile totalRequiredMajor(int id);
	StudentGradefile totalSelectedMajor(int id);
	StudentGradefile totalRequiredCulture(int id);
	StudentGradefile totalSelectedCulture(int id);
}
