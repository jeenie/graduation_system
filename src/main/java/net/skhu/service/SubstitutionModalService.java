package net.skhu.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import net.skhu.dto.Subject;
import net.skhu.mapper.SubjectMapper;

@Service
public class SubstitutionModalService {
	@Autowired SubjectMapper subjectMapper;
	
	public List<Subject> findById(String id) {
		return subjectMapper.findById(id);
	}
	
	public List<Subject> findByName(String name) {
		return subjectMapper.findByName(name);
	}
}
