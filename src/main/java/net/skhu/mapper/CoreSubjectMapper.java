package net.skhu.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import net.skhu.dto.CoreSubject;

@Mapper
public interface CoreSubjectMapper {
	List<CoreSubject> findAllCoreSubject(int userNumber);
	List<CoreSubject> studentCoreSubjectData(int userNumber);
}
