package net.skhu.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import net.skhu.dto.Student;
import net.skhu.dto.StudentGradeFile;

@Mapper
public interface CheckStudentGradeMapper {
	Student findOneMini(int id);
	List grade(int id);
	StudentGradeFile totalGrade1(int id);
	StudentGradeFile totalRequiredMajor(int id);
	StudentGradeFile totalSelectedMajor(int id);
	StudentGradeFile totalRequiredCulture(int id);
	StudentGradeFile totalSelectedCulture(int id);
}
