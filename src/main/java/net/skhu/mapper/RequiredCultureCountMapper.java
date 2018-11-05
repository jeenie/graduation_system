package net.skhu.mapper;

import org.apache.ibatis.annotations.Mapper;

import net.skhu.dto.RequiredCultureCount;

@Mapper
public interface RequiredCultureCountMapper {
	RequiredCultureCount find();
	void update(RequiredCultureCount requiredCultureCount);
}
