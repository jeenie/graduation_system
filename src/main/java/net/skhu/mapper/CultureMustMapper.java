package net.skhu.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import net.skhu.dto.CultureMust;

@Mapper
public interface CultureMustMapper {
	List<CultureMust> findByEntranceYear(int entranceYear);
}
