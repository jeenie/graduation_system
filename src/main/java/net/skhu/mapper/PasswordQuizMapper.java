package net.skhu.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import net.skhu.dto.PasswordQuiz;

@Mapper
public interface PasswordQuizMapper {
	List<PasswordQuiz> findAll();
}
