package net.skhu.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import net.skhu.dto.ChapelSubject;

@Mapper
public interface ChapelSubjectMapper {
	List<ChapelSubject> findAll();

	int findById(int id);
}