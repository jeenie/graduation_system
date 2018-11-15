package net.skhu.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import net.skhu.dto.SubstitutionSubject;

@Mapper
public interface StudentSubstitutionMapper {
	List<SubstitutionSubject> findLowGradeAbosub(int userNumber);
	List<SubstitutionSubject> findSubstiByAbosub(String abolitionSubject);
	void insert(SubstitutionSubject subject);
}
