package net.skhu.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import net.skhu.dto.SpecialProcess;

@Mapper
public interface SpecialProcessMapper {
	List<SpecialProcess> findAll();
}