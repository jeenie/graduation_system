package net.skhu.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import net.skhu.dto.OtherMajor;

@Mapper
public interface OtherMajorMapper {
	List<OtherMajor> otherMajorStatus(int studentId);
	void insert(OtherMajor othermajor);
	void update(int userNumber, String type);
}
