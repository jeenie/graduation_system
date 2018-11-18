package net.skhu.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import net.skhu.dto.MyCell;

@Mapper
public interface MyCellMapper {
	void insert(List<MyCell> data);
	List<MyCell> findAllById(int id);
	void delete(int id);
}
