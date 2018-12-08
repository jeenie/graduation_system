package net.skhu.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import net.skhu.dto.Student;

@Mapper
public interface StudentMapper {
	List<Student> findAll();
	List<Student> findByDepartment(int departmentId);
	List<Student> findByStudentInquiry(String departmentName, Integer grade, Integer allId, String subjectName, String name, Integer id, String checkbox);
	List<Student> searchAll(String searchAll);
	Student findById(int id);
	Student findById2(int studentId);
	Student findOne(int id);
	Student findWithQuiz(int id);
	void join(Student student);
	void insert(Student student);
	void update(Student student);
	void updatePassword(Student student);
	void delete(int id);
}
