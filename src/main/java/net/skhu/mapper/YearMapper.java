package net.skhu.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import net.skhu.dto.Year;

@Mapper
public interface YearMapper {
	List<Year> years();
}
