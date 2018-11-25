package net.skhu.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import net.skhu.dto.CoreSubject;

@Mapper
public interface CoreSubjectMapper {
	List<CoreSubject> findAllCoreSubject(int userNumber);
	List<CoreSubject> findc101(int userNumber);
	List<CoreSubject> findc102(int userNumber);
	List<CoreSubject> findc103(int userNumber);
	List<CoreSubject> findc201(int userNumber);
	List<CoreSubject> findc202(int userNumber);
	List<CoreSubject> findc203(int userNumber);
	List<CoreSubject> findc301(int userNumber);
	List<CoreSubject> findc302(int userNumber);
}
