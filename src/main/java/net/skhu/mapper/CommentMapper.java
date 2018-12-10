package net.skhu.mapper;

import org.apache.ibatis.annotations.Mapper;

import net.skhu.dto.Comment;

@Mapper
public interface CommentMapper {
	void insert(Comment comment);
}
