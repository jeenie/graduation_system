package net.skhu.mapper;

import org.apache.ibatis.annotations.Mapper;

import net.skhu.dto.Total;

@Mapper
public interface TotalMapper {
	Total find();
	void update(int grade);
}
