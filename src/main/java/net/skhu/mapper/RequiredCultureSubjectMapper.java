package net.skhu.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import net.skhu.dto.RequiredCultureSubject;

@Mapper
public interface RequiredCultureSubjectMapper {
	List<RequiredCultureSubject> findByYear(int entranceYear);
	void insert2016(RequiredCultureSubject cultureMust);
	void insert2017(RequiredCultureSubject cultureMust);
	void insert2018(RequiredCultureSubject cultureMust);
	void delete(String subjectId, int entranceYear);
}
