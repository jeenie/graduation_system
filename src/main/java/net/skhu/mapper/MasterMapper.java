package net.skhu.mapper;


import org.apache.ibatis.annotations.Mapper;

import net.skhu.dto.Master;

@Mapper
public interface MasterMapper {
	Master findById(int id);
	void insert(Master master);
}
