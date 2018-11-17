package net.skhu.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import net.skhu.dto.OtherMajorType;

@Mapper
public interface OtherMajorTypeMapper {
	List<OtherMajorType> otherMajorType();
}
