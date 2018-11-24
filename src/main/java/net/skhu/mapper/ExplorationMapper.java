package net.skhu.mapper;

import org.apache.ibatis.annotations.Mapper;

import net.skhu.dto.Exploration;

@Mapper
public interface ExplorationMapper {
	Exploration find();
}
