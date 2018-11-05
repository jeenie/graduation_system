package net.skhu.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import net.skhu.dto.RequiredCultureSubject;

@Mapper
public interface RequiredCultureSubjectMapper {
	List<RequiredCultureSubject> findByYear(int entranceYear);
}
