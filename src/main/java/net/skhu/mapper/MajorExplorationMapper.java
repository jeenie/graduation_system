package net.skhu.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import net.skhu.dto.MajorExploration;

@Mapper
public interface MajorExplorationMapper {
	List<MajorExploration> findExplorationByMajorId(int majorId);
}
