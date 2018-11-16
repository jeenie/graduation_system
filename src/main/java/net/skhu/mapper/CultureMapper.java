package net.skhu.mapper;

import org.apache.ibatis.annotations.Mapper;

import net.skhu.dto.Culture;

@Mapper
public interface CultureMapper {
	Culture find();

	void update(int grade);
}