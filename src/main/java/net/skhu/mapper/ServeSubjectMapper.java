package net.skhu.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import net.skhu.dto.ServeSubject;

@Mapper
public interface ServeSubjectMapper {
	List<ServeSubject> findAll();

	int findById(int id);
}
