package net.skhu.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import net.skhu.dto.Major;

@Mapper
public interface MajorMapper {
	List<Major> findMustMajor(int departmentId);
}
