package net.skhu.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import net.skhu.dto.SubstitutionSubject;

@Mapper
public interface StudentSubstitutionMapper {
	List<SubstitutionSubject> findLowGradeAbosub(int userNumber);
	List<SubstitutionSubject> findSubstiByAbosub(String subjectId);
	List<SubstitutionSubject> findSubstiStatus(int userNumber);
	SubstitutionSubject findAboliInfo(int userNumber,String abolitionId);
	SubstitutionSubject findStatusByAbosub(int userNumber,String abolitionId);
	void insertStatus(int userNumber, String abolitionId, String substitutionId, int abolitionYear, String abolitionSemester, String abolitionGrade, String substitutionGrade, String abolitionType);
	void insert(int userNumber, int abolitionYear, String abolitionSemester, String abolitionId, String abolitionType, String abolitionGrade);
	void delete(int userNumber, String abolitionId);
	void deleteStatus(int userNumber, String abolitionId);

}
