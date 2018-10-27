package net.skhu.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import net.skhu.dto.Master;
import net.skhu.dto.Professor;
import net.skhu.dto.Student;
import net.skhu.dto.User;
import net.skhu.mapper.MasterMapper;
import net.skhu.mapper.ProfessorMapper;
import net.skhu.mapper.StudentMapper;
import net.skhu.mapper.UserMapper;
import net.skhu.utils.Encryption;

@Service
public class UserService {
	@Autowired UserMapper userMapper;
	@Autowired StudentMapper studentMapper;
	@Autowired ProfessorMapper professorMapper;
	@Autowired MasterMapper masterMapper;

	public User login(String userId, String password) {
		int loginId = Integer.parseInt(userId);
		if(studentMapper.findById(loginId) != null) {
			Student student = studentMapper.findById(loginId);
			System.out.println(student.getName());
			User studentUser = userMapper.findOne(student.getId());
			String pw = Encryption.encrypt(password, Encryption.MD5);
			System.out.println(pw+" "+studentUser.getPassword());
			if(studentUser.getPassword().equals(pw)==false) return null;
			return studentUser;
		} else if(professorMapper.findById(loginId) != null) {
			Professor professor = professorMapper.findById(loginId);
			System.out.println(professor.getName());
			User professorUser = userMapper.findOne(professor.getId());
			String pw = Encryption.encrypt(password, Encryption.MD5);
			System.out.println(pw+" "+professorUser.getPassword());
			if(professorUser.getPassword().equals(pw)==false) return null;
			return professorUser;
		} else if(masterMapper.findById(loginId) != null) {
			Master master = masterMapper.findById(loginId);
			System.out.println(master.getId());
			User masterUser = userMapper.findOne(master.getId());
			String pw = Encryption.encrypt(password, Encryption.MD5);
			System.out.println(pw+" "+masterUser.getPassword());
			if(masterUser.getPassword().equals(pw) == false) return null;
			return masterUser;
		}
		else return null;
	}
}
