package net.skhu.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import net.skhu.dto.MyCell;

@Mapper
public interface MyCellMapper {
	void insert(List<MyCell> data);
}
