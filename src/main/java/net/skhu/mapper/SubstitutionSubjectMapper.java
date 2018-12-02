package net.skhu.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import net.skhu.dto.SubstitutionSubject;

@Mapper
public interface SubstitutionSubjectMapper {
	List<SubstitutionSubject> findAll();
	List<SubstitutionSubject> findBySubject(String subject);
	SubstitutionSubject findBySubjectId(String subjectId);
	void insert(SubstitutionSubject subject);
}
